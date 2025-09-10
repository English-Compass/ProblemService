package com.problemservice.ProblemService.Integration;

import com.problemservice.ProblemService.model.dto.OpenAIResponseDto;
import com.problemservice.ProblemService.model.dto.QuestionGenerationRequestDto;
import com.problemservice.ProblemService.model.dto.QuestionGenerationResponseDto;
import com.problemservice.ProblemService.model.enums.Difficulty;
import com.problemservice.ProblemService.model.enums.QuestionType;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.repository.QuestionRepository;
import com.problemservice.ProblemService.service.OpenAIService;
import com.problemservice.ProblemService.service.QuestionGenerationService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.jdbc.Sql;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@SpringBootTest
@ActiveProfiles("test")
class QuestionGenerationHallucinationTest {

    @Autowired
    private QuestionGenerationService questionGenerationService;
    @Autowired
    private QuestionRepository questionRepository;

    @MockBean
    private OpenAIService openAIService;

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("할루시네이션: ANSWER가 A/B/C가 아니면 invalid 처리")
    void hallucinationInvalidAnswerLetter() {
        String bad = "QUESTION: Test?\nA: a\nB: b\nC: c\nANSWER: D\nEXPLANATION: x";
        when(openAIService.generateResponse(org.mockito.ArgumentMatchers.any()))
                .thenReturn(OpenAIResponseDto.builder().success(true).response(bad).build());

        QuestionGenerationRequestDto req = QuestionGenerationRequestDto.builder()
                .questionType(QuestionType.WORD)
                .difficulty(Difficulty.A)
                .majorCategory("business")
                .questionCount(1)
                .build();

        QuestionGenerationResponseDto res = questionGenerationService.generateQuestions(req);
        assertThat(res.isSuccess()).isFalse();
        assertThat(res.getFailedCount()).isEqualTo(1);
        assertThat(res.getSuccessfullyGenerated()).isEqualTo(0);
    }

    @Test
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @Sql(scripts = "/sql/cleanup.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("정상 응답: 저장 시 카테고리/정답/유형 정규화")
    void validThenSaveQuestion() {
        String good = "QUESTION: Test?\nA: a\nB: b\nC: c\nANSWER: A\nEXPLANATION: x";
        when(openAIService.generateResponse(org.mockito.ArgumentMatchers.any()))
                .thenReturn(OpenAIResponseDto.builder().success(true).response(good).build());

        QuestionGenerationRequestDto req = QuestionGenerationRequestDto.builder()
                .questionType(QuestionType.SENTENCE)
                .difficulty(Difficulty.B)
                .majorCategory("business")
                .minorCategory("email")
                .questionCount(1)
                .build();

        QuestionGenerationResponseDto res = questionGenerationService.generateQuestions(req);
        assertThat(res.isSuccess()).isTrue();
        assertThat(res.getSuccessfullyGenerated()).isEqualTo(1);
        var gen = res.getQuestions().get(0);

        Question saved = questionGenerationService.saveGeneratedQuestion(gen);
        assertThat(saved.getMajorCategory()).isEqualTo("business");
        assertThat(saved.getQuestionType()).isEqualTo("sentence");
        assertThat(saved.getCorrectAnswer()).isEqualTo("1"); // A -> 1
    }
}


