package com.problemservice.ProblemService.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * 문제 ID 캐싱 서비스
 * DB의 비효율적인 RAND() 쿼리를 피하기 위해 Redis에 문제 ID 목록을 캐싱
 * 
 * Redis 키 구조:
 * - "question:ids:major:{category}:level:{level}" -> 문제 ID 리스트
 * - "question:ids:minor:{minorCategory}:level:{level}" -> 문제 ID 리스트
 * - "question:ids:major:{category}:minor:{minorCategory}:level:{level}" -> 문제 ID 리스트
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class QuestionIdCacheService {

    private final StringRedisTemplate redisTemplate;
    private final ObjectMapper objectMapper;
    
    private static final String KEY_PREFIX_MAJOR = "question:ids:major:";
    private static final String KEY_PREFIX_MINOR = "question:ids:minor:";
    private static final String KEY_PREFIX_COMBINED = "question:ids:combined:";
    private static final long CACHE_TTL_HOURS = 10; // 10시간 캐시 유지

    /**
     * 대분류 + 난이도 조합으로 문제 ID 목록을 Redis에 저장
     * 
     * @param majorCategory 대분류 카테고리 (예: "school", "business")
     * @param difficultyLevel 난이도 레벨 (1, 2, 3)
     * @param questionIds 문제 ID 목록
     */
    public void cacheQuestionIdsByMajorCategory(String majorCategory, Integer difficultyLevel, List<String> questionIds) {
        String key = buildMajorCategoryKey(majorCategory, difficultyLevel);
        try {
            String json = objectMapper.writeValueAsString(questionIds);
            redisTemplate.opsForValue().set(key, json, CACHE_TTL_HOURS, TimeUnit.HOURS);
            log.debug("Cached {} question IDs for major category: {}, level: {}", questionIds.size(), majorCategory, difficultyLevel);
        } catch (Exception e) {
            log.error("Failed to cache question IDs for major category: {}, level: {}", majorCategory, difficultyLevel, e);
        }
    }

    /**
     * 소분류 + 난이도 조합으로 문제 ID 목록을 Redis에 저장
     * 
     * @param minorCategory 소분류 카테고리
     * @param difficultyLevel 난이도 레벨 (1, 2, 3)
     * @param questionIds 문제 ID 목록
     */
    public void cacheQuestionIdsByMinorCategory(String minorCategory, Integer difficultyLevel, List<String> questionIds) {
        String key = buildMinorCategoryKey(minorCategory, difficultyLevel);
        try {
            String json = objectMapper.writeValueAsString(questionIds);
            redisTemplate.opsForValue().set(key, json, CACHE_TTL_HOURS, TimeUnit.HOURS);
            log.debug("Cached {} question IDs for minor category: {}, level: {}", questionIds.size(), minorCategory, difficultyLevel);
        } catch (Exception e) {
            log.error("Failed to cache question IDs for minor category: {}, level: {}", minorCategory, difficultyLevel, e);
        }
    }

    /**
     * 대분류 + 소분류 + 난이도 조합으로 문제 ID 목록을 Redis에 저장
     * 
     * @param majorCategory 대분류 카테고리
     * @param minorCategory 소분류 카테고리
     * @param difficultyLevel 난이도 레벨
     * @param questionIds 문제 ID 목록
     */
    public void cacheQuestionIdsByCombined(String majorCategory, String minorCategory, Integer difficultyLevel, List<String> questionIds) {
        String key = buildCombinedKey(majorCategory, minorCategory, difficultyLevel);
        try {
            String json = objectMapper.writeValueAsString(questionIds);
            redisTemplate.opsForValue().set(key, json, CACHE_TTL_HOURS, TimeUnit.HOURS);
            log.debug("Cached {} question IDs for combined: major={}, minor={}, level={}", 
                    questionIds.size(), majorCategory, minorCategory, difficultyLevel);
        } catch (Exception e) {
            log.error("Failed to cache question IDs for combined: major={}, minor={}, level={}", 
                    majorCategory, minorCategory, difficultyLevel, e);
        }
    }

    /**
     * 대분류 + 난이도 조합으로 문제 ID 목록을 Redis에서 조회
     * 
     * @param majorCategory 대분류 카테고리
     * @param difficultyLevel 난이도 레벨
     * @return 문제 ID 목록 (캐시 미스 시 빈 리스트)
     */
    public List<String> getQuestionIdsByMajorCategory(String majorCategory, Integer difficultyLevel) {
        String key = buildMajorCategoryKey(majorCategory, difficultyLevel);
        return getQuestionIdsFromCache(key);
    }

    /**
     * 소분류 + 난이도 조합으로 문제 ID 목록을 Redis에서 조회
     * 
     * @param minorCategory 소분류 카테고리
     * @param difficultyLevel 난이도 레벨
     * @return 문제 ID 목록 (캐시 미스 시 빈 리스트)
     */
    public List<String> getQuestionIdsByMinorCategory(String minorCategory, Integer difficultyLevel) {
        String key = buildMinorCategoryKey(minorCategory, difficultyLevel);
        return getQuestionIdsFromCache(key);
    }

    /**
     * 여러 대분류 + 난이도 조합으로 문제 ID 목록을 Redis에서 조회하고 병합
     * 
     * @param majorCategories 대분류 카테고리 목록
     * @param difficultyLevel 난이도 레벨
     * @return 병합된 문제 ID 목록
     */
    public List<String> getQuestionIdsByMajorCategories(List<String> majorCategories, Integer difficultyLevel) {
        List<String> allIds = new ArrayList<>();
        for (String category : majorCategories) {
            List<String> ids = getQuestionIdsByMajorCategory(category, difficultyLevel);
            allIds.addAll(ids);
        }
        // 중복 제거
        return allIds.stream().distinct().collect(java.util.stream.Collectors.toList());
    }

    /**
     * 여러 소분류 + 난이도 조합으로 문제 ID 목록을 Redis에서 조회하고 병합
     * 
     * @param minorCategories 소분류 카테고리 목록
     * @param difficultyLevel 난이도 레벨
     * @return 병합된 문제 ID 목록
     */
    public List<String> getQuestionIdsByMinorCategories(List<String> minorCategories, Integer difficultyLevel) {
        List<String> allIds = new ArrayList<>();
        for (String category : minorCategories) {
            List<String> ids = getQuestionIdsByMinorCategory(category, difficultyLevel);
            allIds.addAll(ids);
        }
        // 중복 제거
        return allIds.stream().distinct().collect(java.util.stream.Collectors.toList());
    }

    /**
     * Redis에서 문제 ID 목록 조회 (내부 메서드)
     */
    private List<String> getQuestionIdsFromCache(String key) {
        try {
            String json = redisTemplate.opsForValue().get(key);
            if (json == null || json.isEmpty()) {
                return new ArrayList<>();
            }
            return objectMapper.readValue(json, new TypeReference<List<String>>() {});
        } catch (Exception e) {
            log.error("Failed to get question IDs from cache for key: {}", key, e);
            return new ArrayList<>();
        }
    }

    /**
     * 문제 ID 목록을 셔플하고 지정된 개수만큼 반환
     * 
     * @param questionIds 문제 ID 목록
     * @param count 반환할 개수
     * @return 셔플된 문제 ID 목록
     */
    public List<String> shuffleAndSelect(List<String> questionIds, int count) {
        if (questionIds == null || questionIds.isEmpty()) {
            return new ArrayList<>();
        }
        
        // 원본 리스트를 복사하여 셔플 (원본 변경 방지)
        List<String> shuffled = new ArrayList<>(questionIds);
        Collections.shuffle(shuffled);
        
        // 지정된 개수만큼 반환
        return shuffled.stream()
                .limit(count)
                .collect(java.util.stream.Collectors.toList());
    }

    /**
     * 캐시 키 생성 (대분류)
     */
    private String buildMajorCategoryKey(String majorCategory, Integer difficultyLevel) {
        return KEY_PREFIX_MAJOR + majorCategory + ":level:" + difficultyLevel;
    }

    /**
     * 캐시 키 생성 (소분류)
     */
    private String buildMinorCategoryKey(String minorCategory, Integer difficultyLevel) {
        return KEY_PREFIX_MINOR + minorCategory + ":level:" + difficultyLevel;
    }

    /**
     * 캐시 키 생성 (대분류 + 소분류)
     */
    private String buildCombinedKey(String majorCategory, String minorCategory, Integer difficultyLevel) {
        return KEY_PREFIX_COMBINED + majorCategory + ":minor:" + minorCategory + ":level:" + difficultyLevel;
    }

    /**
     * 특정 키의 캐시 삭제
     */
    public void evictCache(String majorCategory, Integer difficultyLevel) {
        String key = buildMajorCategoryKey(majorCategory, difficultyLevel);
        redisTemplate.delete(key);
        log.debug("Evicted cache for key: {}", key);
    }

    /**
     * 모든 문제 ID 캐시 삭제
     */
    public void evictAllCache() {
        redisTemplate.delete(redisTemplate.keys(KEY_PREFIX_MAJOR + "*"));
        redisTemplate.delete(redisTemplate.keys(KEY_PREFIX_MINOR + "*"));
        redisTemplate.delete(redisTemplate.keys(KEY_PREFIX_COMBINED + "*"));
        log.info("Evicted all question ID caches");
    }
}

