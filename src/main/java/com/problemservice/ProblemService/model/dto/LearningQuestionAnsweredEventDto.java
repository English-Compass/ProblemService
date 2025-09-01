package com.problemservice.ProblemService.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class LearningQuestionAnsweredEventDto {

    private String sessionId;
    private String userId;
    private String questionId;
    private String userAnswer;
    private String correctAnswer;
    private boolean isCorrect;
    private LocalDateTime answeredAt;
    private String questionCategory;
    private String questionDifficulty;
    private String questionType;
    private Integer responseTimeMs;
    private String eventType = "QUESTION_ANSWERED";
    private LocalDateTime eventTimestamp;
}