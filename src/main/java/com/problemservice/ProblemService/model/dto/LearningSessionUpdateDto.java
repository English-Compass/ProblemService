package com.problemservice.ProblemService.model.dto;

import com.problemservice.ProblemService.model.entity.LearningSession.SessionStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class LearningSessionUpdateDto {

    private SessionStatus status;
    private String sessionMetadata;
    private Integer answeredQuestions;
    private Integer correctAnswers;
    private Integer wrongAnswers;
    private Double progressPercentage;
}