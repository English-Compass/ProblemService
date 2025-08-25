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
public class QuestionAnswerResponseDto {

    private Long id;
    private String sessionId;
    private String questionId;
    private String sessionType;
    private String userAnswer;
    private Boolean isCorrect;
    private Integer timeSpent;
    private LocalDateTime answeredAt;
    private Integer solveCount;
    
    private String questionText;
    private String optionA;
    private String optionB;
    private String optionC;
    private String correctAnswer;
    private String majorCategory;
    private String minorCategory;
    private String questionType;
    private Integer difficultyLevel;
}