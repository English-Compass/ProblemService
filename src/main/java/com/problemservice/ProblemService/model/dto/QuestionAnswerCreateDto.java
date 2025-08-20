package com.problemservice.ProblemService.model.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class QuestionAnswerCreateDto {

    @NotBlank(message = "Session ID is required")
    private String sessionId;

    @NotBlank(message = "Question ID is required")
    private String questionId;

    @NotBlank(message = "Session type is required")
    @Size(max = 50, message = "Session type must not exceed 50 characters")
    private String sessionType;

    @NotBlank(message = "User answer is required")
    @Size(min = 1, max = 1, message = "User answer must be A, B, or C")
    private String userAnswer;

    @NotNull(message = "Correctness indicator is required")
    private Boolean isCorrect;

    private Integer timeSpent;

    @Builder.Default
    private Integer solveCount = 1;
}