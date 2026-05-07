package com.problemservice.ProblemService.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.BDDMockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("QuestionIdCacheService 테스트")
class QuestionIdCacheServiceTest {

    @Mock StringRedisTemplate redisTemplate;
    @Mock ValueOperations<String, String> valueOps;

    @InjectMocks
    QuestionIdCacheService cacheService;

    private final ObjectMapper objectMapper = new ObjectMapper();

    // 실제 ObjectMapper를 주입하기 위해 직접 생성
    @BeforeEach
    void setUp() {
        cacheService = new QuestionIdCacheService(redisTemplate, objectMapper);
        // shuffleAndSelect·evictCache 같이 opsForValue를 쓰지 않는 테스트도 있으므로 lenient 처리
        lenient().when(redisTemplate.opsForValue()).thenReturn(valueOps);
    }

    // ──────────────────────────────────────────────────────────────────────
    // 1. 캐시 저장
    // ──────────────────────────────────────────────────────────────────────

    @Nested
    @DisplayName("캐시 저장")
    class CacheStore {

        @Test
        @DisplayName("대분류+난이도로 문제 ID 목록을 Redis에 저장한다")
        void cacheByMajorCategory() throws Exception {
            List<String> ids = List.of("q1", "q2", "q3");

            cacheService.cacheQuestionIdsByMajorCategory("business", 2, ids);

            then(valueOps).should().set(
                eq("question:ids:major:business:level:2"),
                eq(objectMapper.writeValueAsString(ids)),
                eq(10L),
                eq(TimeUnit.HOURS)
            );
        }

        @Test
        @DisplayName("소분류+난이도로 문제 ID 목록을 Redis에 저장한다")
        void cacheByMinorCategory() throws Exception {
            List<String> ids = List.of("q10", "q11");

            cacheService.cacheQuestionIdsByMinorCategory("meeting", 1, ids);

            then(valueOps).should().set(
                eq("question:ids:minor:meeting:level:1"),
                eq(objectMapper.writeValueAsString(ids)),
                eq(10L),
                eq(TimeUnit.HOURS)
            );
        }

        @Test
        @DisplayName("대분류+소분류+난이도 복합 키로 저장한다")
        void cacheByCombined() throws Exception {
            List<String> ids = List.of("q20", "q21");

            cacheService.cacheQuestionIdsByCombined("business", "meeting", 3, ids);

            then(valueOps).should().set(
                eq("question:ids:combined:business:minor:meeting:level:3"),
                eq(objectMapper.writeValueAsString(ids)),
                eq(10L),
                eq(TimeUnit.HOURS)
            );
        }

        @Test
        @DisplayName("Redis 장애 시 예외를 던지지 않고 로그만 남긴다")
        void cacheFailSilently() {
            given(redisTemplate.opsForValue()).willReturn(valueOps);
            willThrow(new RuntimeException("Redis 연결 실패"))
                .given(valueOps).set(anyString(), anyString(), anyLong(), any());

            assertThatCode(() ->
                cacheService.cacheQuestionIdsByMajorCategory("school", 1, List.of("q1"))
            ).doesNotThrowAnyException();
        }
    }

    // ──────────────────────────────────────────────────────────────────────
    // 2. 캐시 조회
    // ──────────────────────────────────────────────────────────────────────

    @Nested
    @DisplayName("캐시 조회")
    class CacheRead {

        @Test
        @DisplayName("대분류+난이도로 캐시된 ID 목록을 반환한다")
        void getByMajorCategory() throws Exception {
            List<String> ids = List.of("q1", "q2", "q3");
            given(valueOps.get("question:ids:major:business:level:2"))
                .willReturn(objectMapper.writeValueAsString(ids));

            List<String> result = cacheService.getQuestionIdsByMajorCategory("business", 2);

            assertThat(result).containsExactlyInAnyOrderElementsOf(ids);
        }

        @Test
        @DisplayName("소분류+난이도로 캐시된 ID 목록을 반환한다")
        void getByMinorCategory() throws Exception {
            List<String> ids = List.of("q10", "q11");
            given(valueOps.get("question:ids:minor:meeting:level:1"))
                .willReturn(objectMapper.writeValueAsString(ids));

            List<String> result = cacheService.getQuestionIdsByMinorCategory("meeting", 1);

            assertThat(result).containsExactlyInAnyOrderElementsOf(ids);
        }

        @Test
        @DisplayName("캐시 미스(null)이면 빈 리스트를 반환한다")
        void cacheMissReturnsEmptyList() {
            given(valueOps.get(anyString())).willReturn(null);

            List<String> result = cacheService.getQuestionIdsByMajorCategory("travel", 2);

            assertThat(result).isEmpty();
        }

        @Test
        @DisplayName("캐시 값이 빈 문자열이면 빈 리스트를 반환한다")
        void emptyStringReturnsEmptyList() {
            given(valueOps.get(anyString())).willReturn("");

            List<String> result = cacheService.getQuestionIdsByMajorCategory("daily", 1);

            assertThat(result).isEmpty();
        }

        @Test
        @DisplayName("Redis 장애 시 빈 리스트를 반환한다 (서비스 중단 없음)")
        void redisErrorReturnsEmptyList() {
            given(valueOps.get(anyString())).willThrow(new RuntimeException("Redis timeout"));

            List<String> result = cacheService.getQuestionIdsByMajorCategory("business", 2);

            assertThat(result).isEmpty();
        }
    }

    // ──────────────────────────────────────────────────────────────────────
    // 3. 복수 카테고리 조회 및 병합
    // ──────────────────────────────────────────────────────────────────────

    @Nested
    @DisplayName("복수 카테고리 병합 조회")
    class MultiCategoryMerge {

        @Test
        @DisplayName("여러 대분류의 ID를 병합하여 반환한다")
        void mergeMultipleMajorCategories() throws Exception {
            given(valueOps.get("question:ids:major:business:level:2"))
                .willReturn(objectMapper.writeValueAsString(List.of("q1", "q2")));
            given(valueOps.get("question:ids:major:travel:level:2"))
                .willReturn(objectMapper.writeValueAsString(List.of("q3", "q4")));

            List<String> result = cacheService.getQuestionIdsByMajorCategories(
                List.of("business", "travel"), 2);

            assertThat(result).containsExactlyInAnyOrder("q1", "q2", "q3", "q4");
        }

        @Test
        @DisplayName("복수 대분류 조회 시 중복 ID는 제거된다")
        void deduplicatesIds() throws Exception {
            given(valueOps.get("question:ids:major:business:level:2"))
                .willReturn(objectMapper.writeValueAsString(List.of("q1", "q2", "q3")));
            given(valueOps.get("question:ids:major:travel:level:2"))
                .willReturn(objectMapper.writeValueAsString(List.of("q2", "q3", "q4")));  // q2, q3 중복

            List<String> result = cacheService.getQuestionIdsByMajorCategories(
                List.of("business", "travel"), 2);

            assertThat(result).containsExactlyInAnyOrder("q1", "q2", "q3", "q4");
            assertThat(result).hasSize(4);  // 중복 제거 후 4개
        }

        @Test
        @DisplayName("여러 소분류의 ID를 병합하고 중복을 제거한다")
        void mergeMultipleMinorCategories() throws Exception {
            given(valueOps.get("question:ids:minor:meeting:level:1"))
                .willReturn(objectMapper.writeValueAsString(List.of("q10", "q11")));
            given(valueOps.get("question:ids:minor:email:level:1"))
                .willReturn(objectMapper.writeValueAsString(List.of("q10", "q12")));

            List<String> result = cacheService.getQuestionIdsByMinorCategories(
                List.of("meeting", "email"), 1);

            assertThat(result).containsExactlyInAnyOrder("q10", "q11", "q12");
            assertThat(result).hasSize(3);
        }

        @Test
        @DisplayName("빈 카테고리 목록이면 빈 리스트를 반환한다")
        void emptyCategories() {
            List<String> result = cacheService.getQuestionIdsByMajorCategories(
                List.of(), 2);

            assertThat(result).isEmpty();
        }
    }

    // ──────────────────────────────────────────────────────────────────────
    // 4. shuffleAndSelect
    // ──────────────────────────────────────────────────────────────────────

    @Nested
    @DisplayName("shuffleAndSelect")
    class ShuffleAndSelect {

        @Test
        @DisplayName("요청 개수만큼 ID를 반환한다")
        void returnsRequestedCount() {
            List<String> ids = List.of("q1", "q2", "q3", "q4", "q5");

            List<String> result = cacheService.shuffleAndSelect(ids, 3);

            assertThat(result).hasSize(3);
        }

        @Test
        @DisplayName("요청 개수가 목록보다 크면 전체를 반환한다")
        void countExceedsListSize() {
            List<String> ids = List.of("q1", "q2");

            List<String> result = cacheService.shuffleAndSelect(ids, 10);

            assertThat(result).hasSize(2);
        }

        @Test
        @DisplayName("원본 리스트를 변경하지 않는다")
        void doesNotMutateOriginalList() {
            List<String> original = new ArrayList<>(List.of("q1", "q2", "q3", "q4", "q5"));
            List<String> copy = new ArrayList<>(original);

            cacheService.shuffleAndSelect(original, 3);

            assertThat(original).isEqualTo(copy);
        }

        @Test
        @DisplayName("null 입력이면 빈 리스트를 반환한다")
        void nullInputReturnsEmpty() {
            List<String> result = cacheService.shuffleAndSelect(null, 5);

            assertThat(result).isEmpty();
        }

        @Test
        @DisplayName("빈 리스트 입력이면 빈 리스트를 반환한다")
        void emptyInputReturnsEmpty() {
            List<String> result = cacheService.shuffleAndSelect(List.of(), 5);

            assertThat(result).isEmpty();
        }

        @Test
        @DisplayName("반환된 ID들은 모두 원본에 포함된 값이다")
        void resultContainsOnlyOriginalIds() {
            List<String> ids = List.of("q1", "q2", "q3", "q4", "q5");

            List<String> result = cacheService.shuffleAndSelect(ids, 3);

            assertThat(ids).containsAll(result);
        }
    }

    // ──────────────────────────────────────────────────────────────────────
    // 5. 캐시 삭제
    // ──────────────────────────────────────────────────────────────────────

    @Nested
    @DisplayName("캐시 삭제")
    class CacheEvict {

        @Test
        @DisplayName("대분류+난이도 키의 캐시를 삭제한다")
        void evictMajorCategoryCache() {
            cacheService.evictCache("business", 2);

            then(redisTemplate).should().delete("question:ids:major:business:level:2");
        }

        @Test
        @DisplayName("evictAllCache 호출 시 모든 패턴의 캐시를 삭제한다")
        void evictAllCaches() {
            given(redisTemplate.keys("question:ids:major:*")).willReturn(Set.of("k1"));
            given(redisTemplate.keys("question:ids:minor:*")).willReturn(Set.of("k2"));
            given(redisTemplate.keys("question:ids:combined:*")).willReturn(Set.of("k3"));

            cacheService.evictAllCache();

            then(redisTemplate).should().delete(Set.of("k1"));
            then(redisTemplate).should().delete(Set.of("k2"));
            then(redisTemplate).should().delete(Set.of("k3"));
        }
    }

    // ──────────────────────────────────────────────────────────────────────
    // 6. Redis 키 형식 검증
    // ──────────────────────────────────────────────────────────────────────

    @Nested
    @DisplayName("Redis 키 형식")
    class KeyFormat {

        @Test
        @DisplayName("대분류 키 형식: question:ids:major:{category}:level:{level}")
        void majorCategoryKeyFormat() throws Exception {
            cacheService.cacheQuestionIdsByMajorCategory("school", 1, List.of("q1"));

            then(valueOps).should().set(
                eq("question:ids:major:school:level:1"),
                anyString(), anyLong(), any()
            );
        }

        @Test
        @DisplayName("소분류 키 형식: question:ids:minor:{category}:level:{level}")
        void minorCategoryKeyFormat() throws Exception {
            cacheService.cacheQuestionIdsByMinorCategory("class", 3, List.of("q1"));

            then(valueOps).should().set(
                eq("question:ids:minor:class:level:3"),
                anyString(), anyLong(), any()
            );
        }

        @Test
        @DisplayName("복합 키 형식: question:ids:combined:{major}:minor:{minor}:level:{level}")
        void combinedKeyFormat() throws Exception {
            cacheService.cacheQuestionIdsByCombined("business", "email", 2, List.of("q1"));

            then(valueOps).should().set(
                eq("question:ids:combined:business:minor:email:level:2"),
                anyString(), anyLong(), any()
            );
        }
    }
}
