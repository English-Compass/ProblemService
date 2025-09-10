package com.problemservice.ProblemService.Integration;

import com.problemservice.ProblemService.model.dto.CompleteLearningAnalysis;
import com.problemservice.ProblemService.model.entity.LearningSession;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.model.enums.Difficulty;
import com.problemservice.ProblemService.model.enums.QuestionType;
import com.problemservice.ProblemService.repository.QuestionRepository;
import com.problemservice.ProblemService.service.QuestionAssignmentService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.jdbc.Sql;

import java.util.List;
import java.util.Set;

import static org.assertj.core.api.Assertions.assertThat;

import org.springframework.security.test.context.support.WithMockUser;

@SpringBootTest
@ActiveProfiles("test")
@WithMockUser(username="test-user", roles={"USER"})
class QuestionAssignmentServiceIntegrationTest {

    @Autowired
    private QuestionAssignmentService questionAssignmentService;
    @Autowired
    private QuestionRepository questionRepository;

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("WRONG_ANSWER: 오답 ID가 포함되도록 우선 선택")
    void wrongAnswerPreference() {
        String userId = "u1";
        // 오답 ID로 seed의 test-q-b-1을 지정
        CompleteLearningAnalysis analysis = CompleteLearningAnalysis.builder()
                .sessionId("an-s")
                .userId(userId)
                .wrongQuestionIds(List.of("test-q-b-1"))
                .weakQuestionTypes(List.of(QuestionType.SENTENCE))
                .consistencyScore(50.0)
                .averageTimePerQuestion(10.0)
                .build();
        questionAssignmentService.updateUserLearningProfile(userId, analysis);

        List<Question> picked = questionAssignmentService.selectOptimalQuestions(
                userId,
                List.of("business"),
                3,
                LearningSession.SessionType.WRONG_ANSWER,
                Difficulty.B);

        assertThat(picked.size()).isGreaterThan(0);
        assertThat(picked.stream().map(Question::getQuestionId)).contains("test-q-b-1");
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("REVIEW: 취약 유형 우선 포함(SENTENCE)")
    void reviewWeakTypePreference() {
        String userId = "u1";
        CompleteLearningAnalysis analysis = CompleteLearningAnalysis.builder()
                .sessionId("an-s2")
                .userId(userId)
                .weakQuestionTypes(List.of(QuestionType.SENTENCE))
                .wrongQuestionIds(List.of())
                .consistencyScore(50.0)
                .averageTimePerQuestion(10.0)
                .build();
        questionAssignmentService.updateUserLearningProfile(userId, analysis);

        List<Question> picked = questionAssignmentService.selectOptimalQuestions(
                userId,
                List.of("business"),
                3,
                LearningSession.SessionType.REVIEW,
                Difficulty.B);

        assertThat(picked.size()).isGreaterThan(0);
        assertThat(picked.stream().map(Question::getQuestionType).map(String::toLowerCase))
                .contains("sentence");
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("PRACTICE: 사용자가 풀지 않은 문제만 선택")
    void practiceSessionUnsolvedQuestionsOnly() {
        String userId = "u2"; // 아직 문제를 풀지 않은 새로운 사용자
        CompleteLearningAnalysis analysis = CompleteLearningAnalysis.builder()
                .sessionId("an-s3")
                .userId(userId)
                .wrongQuestionIds(List.of())
                .weakQuestionTypes(List.of())
                .consistencyScore(75.0)
                .averageTimePerQuestion(8.0)
                .build();
        questionAssignmentService.updateUserLearningProfile(userId, analysis);

        List<Question> picked = questionAssignmentService.selectOptimalQuestions(
                userId,
                List.of("business"),
                3,
                LearningSession.SessionType.PRACTICE,
                Difficulty.B);

        assertThat(picked.size()).isGreaterThan(0);
        // 새 사용자이므로 모든 문제가 풀지 않은 문제여야 함
        assertThat(picked.stream().map(Question::getMajorCategory)).allMatch(category -> "business".equals(category));
        assertThat(picked.stream().map(Question::getDifficultyLevel)).allMatch(level -> level == 2);
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("PRACTICE: 프로필 없는 경우 기본 전략 사용")
    void practiceSessionWithoutProfile() {
        String userId = "u3"; // 프로필이 없는 사용자
        
        List<Question> picked = questionAssignmentService.selectOptimalQuestions(
                userId,
                List.of("business"),
                2,
                LearningSession.SessionType.PRACTICE,
                Difficulty.A);

        assertThat(picked.size()).isGreaterThan(0);
        assertThat(picked.stream().map(Question::getMajorCategory)).allMatch(category -> "business".equals(category));
        assertThat(picked.stream().map(Question::getDifficultyLevel)).allMatch(level -> level == 1);
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("WRONG_ANSWER: 빈 오답 ID 목록인 경우")
    void wrongAnswerSessionWithEmptyIds() {
        String userId = "u4";
        CompleteLearningAnalysis analysis = CompleteLearningAnalysis.builder()
                .sessionId("an-s4")
                .userId(userId)
                .wrongQuestionIds(List.of()) // 빈 목록
                .weakQuestionTypes(List.of(QuestionType.WORD))
                .consistencyScore(60.0)
                .averageTimePerQuestion(12.0)
                .build();
        questionAssignmentService.updateUserLearningProfile(userId, analysis);

        List<Question> picked = questionAssignmentService.selectOptimalQuestions(
                userId,
                List.of("business"),
                2,
                LearningSession.SessionType.WRONG_ANSWER,
                Difficulty.A);

        assertThat(picked.size()).isGreaterThan(0);
        // 오답 ID가 없으므로 취약 유형(WORD)으로 문제가 선택되어야 함
        assertThat(picked.stream().map(Question::getQuestionType).map(String::toLowerCase))
                .contains("word");
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("WRONG_ANSWER: 같은 카테고리 오답 문제 우선 선택")
    void wrongAnswerSessionWithSameCategory() {
        String userId = "u5";
        CompleteLearningAnalysis analysis = CompleteLearningAnalysis.builder()
                .sessionId("an-s5")
                .userId(userId)
                .wrongQuestionIds(List.of("test-q-b-1")) // business 카테고리 문제
                .weakQuestionTypes(List.of(QuestionType.WORD))
                .consistencyScore(45.0)
                .averageTimePerQuestion(15.0)
                .build();
        questionAssignmentService.updateUserLearningProfile(userId, analysis);

        List<Question> picked = questionAssignmentService.selectOptimalQuestions(
                userId,
                List.of("business"), // business 카테고리 요청
                2,
                LearningSession.SessionType.WRONG_ANSWER,
                Difficulty.B);
        
        assertThat(picked.size()).isGreaterThan(0);
        // 같은 카테고리의 오답 문제가 포함되어야 함
        assertThat(picked.stream().map(Question::getQuestionId)).contains("test-q-b-1");
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("다양한 카테고리 조합 테스트")
    void multipleCategories() {
        String userId = "u6";
        CompleteLearningAnalysis analysis = CompleteLearningAnalysis.builder()
                .sessionId("an-s6")
                .userId(userId)
                .wrongQuestionIds(List.of("test-q-d-2", "test-q-t-2"))
                .weakQuestionTypes(List.of(QuestionType.SENTENCE))
                .consistencyScore(70.0)
                .averageTimePerQuestion(9.0)
                .build();
        questionAssignmentService.updateUserLearningProfile(userId, analysis);

        List<Question> picked = questionAssignmentService.selectOptimalQuestions(
                userId,
                List.of("daily", "travel"), // 두 개 카테고리 요청
                3,
                LearningSession.SessionType.WRONG_ANSWER,
                Difficulty.B);

        assertThat(picked.size()).isGreaterThan(0);
        // 요청한 카테고리 중 하나는 포함되어야 함
        assertThat(picked.stream().map(Question::getMajorCategory))
                .allMatch(category -> List.of("daily", "travel").contains(category));
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("고급 난이도(C) 문제 선택 테스트")
    void advancedDifficultySelection() {
        String userId = "u7";
        CompleteLearningAnalysis analysis = CompleteLearningAnalysis.builder()
                .sessionId("an-s7")
                .userId(userId)
                .wrongQuestionIds(List.of("test-q-b-3")) // 고급 난이도 문제
                .weakQuestionTypes(List.of(QuestionType.CONVERSATION))
                .consistencyScore(85.0)
                .averageTimePerQuestion(6.0)
                .build();
        questionAssignmentService.updateUserLearningProfile(userId, analysis);

        List<Question> picked = questionAssignmentService.selectOptimalQuestions(
                userId,
                List.of("business"),
                2,
                LearningSession.SessionType.WRONG_ANSWER,
                Difficulty.C);

        assertThat(picked.size()).isGreaterThan(0);
        assertThat(picked.stream().map(Question::getQuestionId)).contains("test-q-b-3");
        assertThat(picked.stream().map(Question::getDifficultyLevel)).allMatch(level -> level == 3);
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("REVIEW: 복합 취약 유형 처리")
    void reviewMultipleWeakTypes() {
        String userId = "u8";
        CompleteLearningAnalysis analysis = CompleteLearningAnalysis.builder()
                .sessionId("an-s8")
                .userId(userId)
                .wrongQuestionIds(List.of())
                .weakQuestionTypes(List.of(QuestionType.WORD, QuestionType.SENTENCE)) // 여러 취약 유형
                .consistencyScore(55.0)
                .averageTimePerQuestion(11.0)
                .build();
        questionAssignmentService.updateUserLearningProfile(userId, analysis);

        List<Question> picked = questionAssignmentService.selectOptimalQuestions(
                userId,
                List.of("business"),
                4,
                LearningSession.SessionType.REVIEW,
                Difficulty.B);

        assertThat(picked.size()).isGreaterThan(0);
        // 취약 유형 중 하나 이상이 포함되어야 함
        assertThat(picked.stream().map(Question::getQuestionType).map(String::toLowerCase))
                .anyMatch(type -> List.of("word", "sentence").contains(type));
    }
}


