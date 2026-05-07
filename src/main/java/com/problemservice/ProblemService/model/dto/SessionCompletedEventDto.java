package com.problemservice.ProblemService.model.dto;

import com.problemservice.ProblemService.model.entity.LearningSession.SessionType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class SessionCompletedEventDto {

    private String eventType;
    private String sessionId;
    private String userId;
    private SessionType sessionType;
    private LocalDateTime startedAt;
    private LocalDateTime completedAt;
    private LocalDateTime eventTimestamp;

    // ── 학습 결과 (LearningService REST 재호출 제거용) ──────────────────

    private int totalQuestions;
    private int correctAnswers;
    private int wrongAnswers;

    /** 세션 내 각 문제 답변 상세 */
    private List<QuestionAnswerEventDto> answers;

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class QuestionAnswerEventDto {
        private String questionId;
        private String questionType;   // WORD / SENTENCE / CONVERSATION
        private String majorCategory;
        private String minorCategory;
        private Integer difficultyLevel;
        private String userAnswer;     // A / B / C
        private Boolean isCorrect;
        private Integer timeSpent;     // 초 단위
        private LocalDateTime answeredAt;
        private Integer solveCount;
    }
}