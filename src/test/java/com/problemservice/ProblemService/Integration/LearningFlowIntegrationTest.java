package com.problemservice.ProblemService.Integration;

import com.problemservice.ProblemService.model.dto.LearningSessionCreateDto;
import com.problemservice.ProblemService.model.dto.LearningSessionResponseDto;
import com.problemservice.ProblemService.model.dto.WordStudyRequestDto;
import com.problemservice.ProblemService.service.LearningSessionService;
import com.problemservice.ProblemService.service.WordStudyService;
import com.problemservice.ProblemService.repository.SessionQuestionRepository;
import com.problemservice.ProblemService.repository.QuestionRepository;
import com.problemservice.ProblemService.model.entity.Question;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.List;
import java.util.Set;

import static org.assertj.core.api.Assertions.assertThat;

import org.springframework.security.test.context.support.WithMockUser;

import com.problemservice.ProblemService.model.dto.QuestionAnswerCreateDto;
import com.problemservice.ProblemService.model.entity.UserLearningProfile;
import com.problemservice.ProblemService.repository.UserLearningProfileRepository;
import com.problemservice.ProblemService.service.QuestionAnswerService;
import com.problemservice.ProblemService.service.UserLearningProfileService;

import java.util.Optional;

@SpringBootTest
@ActiveProfiles("test")
@WithMockUser(username="test-user", roles={"USER"})
class LearningFlowIntegrationTest {

    @Autowired
    private LearningSessionService learningSessionService;
    @Autowired
    private SessionQuestionRepository sessionQuestionRepository;
    @Autowired
    private QuestionRepository questionRepository;
    @Autowired
    private WordStudyService wordStudyService;
    @Autowired
    private org.springframework.data.redis.core.StringRedisTemplate stringRedisTemplate;
    @Autowired
    private QuestionAnswerService questionAnswerService;
    @Autowired
    private UserLearningProfileService userLearningProfileService;
    @Autowired
    private UserLearningProfileRepository userLearningProfileRepository;
    

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("REVIEW 세션 생성 시 정답 기록 기반 문제 할당")
    void reviewSessionAssignment() {
        LearningSessionCreateDto dto = LearningSessionCreateDto.builder()
                .userId("u1")
                .sessionType(com.problemservice.ProblemService.model.entity.LearningSession.SessionType.REVIEW)
                .categories(List.of("비즈니스"))
                .build();

        LearningSessionResponseDto res = learningSessionService.createReviewSession(dto);
        Long cnt = sessionQuestionRepository.countBySessionId(res.getSessionId());
        assertThat(cnt).isGreaterThan(0);
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("WRONG_ANSWER 세션 생성 시 오답 기록 기반 문제 할당")
    void wrongAnswerSessionAssignment() {
        LearningSessionCreateDto dto = LearningSessionCreateDto.builder()
                .userId("u1")
                .sessionType(com.problemservice.ProblemService.model.entity.LearningSession.SessionType.WRONG_ANSWER)
                .categories(List.of("비즈니스"))
                .build();

        LearningSessionResponseDto res = learningSessionService.createWrongAnswerSession(dto);
        Long cnt = sessionQuestionRepository.countBySessionId(res.getSessionId());
        assertThat(cnt).isGreaterThan(0);
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("PRACTICE 세션: 한국어 카테고리(학업) → DB 카테고리(school) 매핑 확인")
    void practiceSessionKoreanCategoryMapping() {
        String metadataJson = "{\"categories\":[\"학업\"],\"keywords\":[],\"level\":\"A\",\"questionCount\":2}";
        LearningSessionCreateDto dto = LearningSessionCreateDto.builder()
                .userId("u1")
                .sessionType(com.problemservice.ProblemService.model.entity.LearningSession.SessionType.PRACTICE)
                .sessionMetadata(metadataJson)
                .build();

        LearningSessionResponseDto res = learningSessionService.createPracticeSession(dto);
        var sessionQuestions = sessionQuestionRepository.findBySessionIdOrderByQuestionOrder(res.getSessionId());
        assertThat(sessionQuestions.size()).isGreaterThan(0);

        for (var sq : sessionQuestions) {
            Question q = questionRepository.findById(sq.getQuestionId()).orElse(null);
            assertThat(q).isNotNull();
            assertThat(q.getMajorCategory()).isEqualTo("school");
        }
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("세션에 문제 추가: totalQuestions/연관관계 증가 확인")
    void addQuestionToSessionIncrementsCounts() {
        // 사전 세션 생성 (1문제)
        LearningSessionCreateDto dto = LearningSessionCreateDto.builder()
                .userId("u1")
                .sessionType(com.problemservice.ProblemService.model.entity.LearningSession.SessionType.PRACTICE)
                .questionIds(java.util.List.of("test-q-b-2"))
                .build();

        LearningSessionResponseDto created = learningSessionService.createLearningSession(dto);
        String sessionId = created.getSessionId();

        Long beforeCnt = sessionQuestionRepository.countBySessionId(sessionId);

        // 다른 문제 추가
        learningSessionService.addQuestionToSession(sessionId, "test-q-d-1");

        Long afterCnt = sessionQuestionRepository.countBySessionId(sessionId);
        LearningSessionResponseDto updated = learningSessionService.getLearningSessionById(sessionId);

        assertThat(afterCnt).isEqualTo(beforeCnt + 1);
        assertThat(updated.getTotalQuestions()).isEqualTo(created.getTotalQuestions() + 1);
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("진행률 업데이트: 정답/오답 반영 및 퍼센트 계산")
    void updateProgressFlow() {
        // 사전 세션 생성 (문제 2개)
        LearningSessionCreateDto dto = LearningSessionCreateDto.builder()
                .userId("u1")
                .sessionType(com.problemservice.ProblemService.model.entity.LearningSession.SessionType.PRACTICE)
                .questionIds(List.of("test-q-b-2", "test-q-b-3"))
                .build();

        LearningSessionResponseDto created = learningSessionService.createLearningSession(dto);
        String sessionId = created.getSessionId();

        // 정답 1회, 오답 1회 반영
        LearningSessionResponseDto after1 = learningSessionService.updateSessionProgress(sessionId, true);
        LearningSessionResponseDto after2 = learningSessionService.updateSessionProgress(sessionId, false);

        assertThat(after2.getAnsweredQuestions()).isEqualTo(2);
        assertThat(after2.getCorrectAnswers()).isEqualTo(1);
        assertThat(after2.getWrongAnswers()).isEqualTo(1);
        assertThat(after2.getProgressPercentage()).isEqualTo(100.0);
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("WordStudy 캐시: 첫 호출 후 키 생성, 재호출 시 키 개수 유지")
    void wordStudyCacheFlow() {
        // Redis 초기화
        stringRedisTemplate.getRequiredConnectionFactory().getConnection().serverCommands().flushDb();

        WordStudyRequestDto req = WordStudyRequestDto.builder()
                .userId("u1")
                .wordCount(12)
                .targetDifficulty("AUTO")
                .build();

        // 1) 첫 호출 후 키 생성 확인
        wordStudyService.generateWordStudyList(req);
        Set<String> k1a = stringRedisTemplate.keys("word-study:wordStudy*");
        Set<String> k1b = stringRedisTemplate.keys("wordStudy*");
        int c1 = (k1a != null ? k1a.size() : 0) + (k1b != null ? k1b.size() : 0);
        assertThat(c1).isGreaterThan(0);

        // 2) 두 번째 호출 후 키 개수 유지 확인
        wordStudyService.generateWordStudyList(req);
        Set<String> k2a = stringRedisTemplate.keys("word-study:wordStudy*");
        Set<String> k2b = stringRedisTemplate.keys("wordStudy*");
        int c2 = (k2a != null ? k2a.size() : 0) + (k2b != null ? k2b.size() : 0);
        assertThat(c2).isEqualTo(c1);
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("REVIEW/WRONG_ANSWER 세션: 카테고리 분포 검증(비즈니스)")
    void reviewAndWrongAnswerCategoryDistribution() {
        // REVIEW
        LearningSessionCreateDto reviewDto = LearningSessionCreateDto.builder()
                .userId("u1")
                .sessionType(com.problemservice.ProblemService.model.entity.LearningSession.SessionType.REVIEW)
                .categories(java.util.List.of("비즈니스"))
                .build();
        LearningSessionResponseDto review = learningSessionService.createReviewSession(reviewDto);
        var reviewSQ = sessionQuestionRepository.findBySessionIdOrderByQuestionOrder(review.getSessionId());
        assertThat(reviewSQ.size()).isGreaterThan(0);
        for (var sq : reviewSQ) {
            Question q = questionRepository.findById(sq.getQuestionId()).orElse(null);
            assertThat(q).isNotNull();
            assertThat(q.getMajorCategory()).isEqualTo("business");
            assertThat(q.getDifficultyLevel()).isBetween(1, 3);
        }

        // WRONG_ANSWER
        LearningSessionCreateDto wrongDto = LearningSessionCreateDto.builder()
                .userId("u1")
                .sessionType(com.problemservice.ProblemService.model.entity.LearningSession.SessionType.WRONG_ANSWER)
                .categories(java.util.List.of("비즈니스"))
                .build();
        LearningSessionResponseDto wrong = learningSessionService.createWrongAnswerSession(wrongDto);
        var wrongSQ = sessionQuestionRepository.findBySessionIdOrderByQuestionOrder(wrong.getSessionId());
        assertThat(wrongSQ.size()).isGreaterThan(0);
        for (var sq : wrongSQ) {
            Question q = questionRepository.findById(sq.getQuestionId()).orElse(null);
            assertThat(q).isNotNull();
            assertThat(q.getMajorCategory()).isEqualTo("business");
            assertThat(q.getDifficultyLevel()).isBetween(1, 3);
        }
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("세션 상태 전이 및 완료 처리")
    void statusTransitionAndCompletion() {
        LearningSessionCreateDto dto = LearningSessionCreateDto.builder()
                .userId("u1")
                .sessionType(com.problemservice.ProblemService.model.entity.LearningSession.SessionType.PRACTICE)
                .questionIds(java.util.List.of("test-q-b-2", "test-q-b-3"))
                .build();
        LearningSessionResponseDto created = learningSessionService.createLearningSession(dto);
        assertThat(created.getStatus()).isEqualTo(com.problemservice.ProblemService.model.entity.LearningSession.SessionStatus.STARTED);

        LearningSessionResponseDto after = learningSessionService.updateSessionProgress(created.getSessionId(), true);
        assertThat(after.getStatus()).isEqualTo(com.problemservice.ProblemService.model.entity.LearningSession.SessionStatus.IN_PROGRESS);

        LearningSessionResponseDto completed = learningSessionService.completeSession(created.getSessionId());
        assertThat(completed.getStatus()).isEqualTo(com.problemservice.ProblemService.model.entity.LearningSession.SessionStatus.COMPLETED);
        assertThat(completed.getProgressPercentage()).isNotNull();
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("WordStudy 캐시: 파라미터 변경 시 새로운 키 생성")
    void wordStudyCacheNewKeyOnParamChange() {
        stringRedisTemplate.getRequiredConnectionFactory().getConnection().serverCommands().flushDb();

        WordStudyRequestDto req1 = WordStudyRequestDto.builder()
                .userId("u1")
                .wordCount(12)
                .targetDifficulty("AUTO")
                .build();
        WordStudyRequestDto req2 = WordStudyRequestDto.builder()
                .userId("u1")
                .wordCount(15) // 다른 파라미터
                .targetDifficulty("AUTO")
                .build();

        wordStudyService.generateWordStudyList(req1);
        int c1 = stringRedisTemplate.keys("wordStudy*").size();
        wordStudyService.generateWordStudyList(req1);
        int c2 = stringRedisTemplate.keys("wordStudy*").size();
        assertThat(c2).isEqualTo(c1);

        wordStudyService.generateWordStudyList(req2);
        int c3 = stringRedisTemplate.keys("wordStudy*").size();
        assertThat(c3).isGreaterThan(c2);
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("세션 완료 후 UserLearningProfile 생성 및 업데이트 확인")
    void userProfileCreationOnSessionComplete() {
        // given
        String userId = "u1";
        String questionId = "test-q-s-1"; // school 카테고리 문제

        // 1. 새로운 PRACTICE 세션 생성
        LearningSessionCreateDto createDto = LearningSessionCreateDto.builder()
                .userId(userId)
                .sessionType(com.problemservice.ProblemService.model.entity.LearningSession.SessionType.PRACTICE)
                .questionIds(List.of(questionId))
                .build();
        LearningSessionResponseDto session = learningSessionService.createLearningSession(createDto);
        String sessionId = session.getSessionId();

        // 2. 문제에 대한 답변 제출 (정답)
        QuestionAnswerCreateDto answerDto = QuestionAnswerCreateDto.builder()
                .sessionId(sessionId)
                .questionId(questionId)
                .userAnswer("A") // 정답
                .timeSpent(15)
                .sessionType("PRACTICE")
                .isCorrect(true) // DTO 필드를 채우기 위한 임의의 값
                .build();
        questionAnswerService.createQuestionAnswer(answerDto, userId);

        // when
        // 3. 세션 완료
        learningSessionService.completeSession(sessionId);

        // 4. 이벤트 리스너가 실행할 서비스 직접 호출 (테스트 환경)
        userLearningProfileService.updateUserProfile(userId);

        // then
        // 5. UserLearningProfile이 생성/업데이트 되었는지 확인
        Optional<UserLearningProfile> profileOpt = userLearningProfileRepository.findByUserId(userId);
        assertThat(profileOpt).isPresent();

        UserLearningProfile profile = profileOpt.get();
        // seed.sql에 있던 2개의 답변 + 방금 제출한 1개의 답변 = 총 3개
        assertThat(profile.getTotalQuestionsAnswered()).isEqualTo(3);
        // seed.sql에서 정답 1개 + 방금 정답 1개 = 총 2개
        assertThat(profile.getTotalCorrectAnswers()).isEqualTo(2);
        assertThat(profile.getOverallAccuracy()).isEqualTo((double) 2 / 3);
        assertThat(profile.getCategoryPerformance()).contains("school");
    }
}
