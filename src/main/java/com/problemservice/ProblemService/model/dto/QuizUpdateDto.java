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
public class QuizUpdateDto {

    @NotNull(message = "Category ID is required")
    private Long categoryId;

    @NotBlank(message = "Question is required")
    @Size(max = 1000, message = "Question must not exceed 1000 characters")
    private String question;

    @NotBlank(message = "Answer is required")
    @Size(max = 500, message = "Answer must not exceed 500 characters")
    private String answer;

    @NotBlank(message = "Difficulty level is required")
    @Size(max = 10, message = "Difficulty level must not exceed 10 characters")
    private String difficultyLevel;

    @NotBlank(message = "Question type is required")
    @Size(max = 50, message = "Question type must not exceed 50 characters")
    private String questionType;

    @Size(max = 500, message = "Keyword must not exceed 500 characters")
    private String keyword;
}