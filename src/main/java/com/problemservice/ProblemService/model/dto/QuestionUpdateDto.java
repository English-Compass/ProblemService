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
public class QuestionUpdateDto {

    @NotBlank(message = "Question text is required")
    private String questionText;

    @NotBlank(message = "Option A is required")
    @Size(max = 500, message = "Option A must not exceed 500 characters")
    private String optionA;

    @NotBlank(message = "Option B is required")
    @Size(max = 500, message = "Option B must not exceed 500 characters")
    private String optionB;

    @NotBlank(message = "Option C is required")
    @Size(max = 500, message = "Option C must not exceed 500 characters")
    private String optionC;

    @NotBlank(message = "Correct answer is required")
    @Size(min = 1, max = 1, message = "Correct answer must be A, B, or C")
    private String correctAnswer;

    @NotBlank(message = "Major category is required")
    @Size(max = 50, message = "Major category must not exceed 50 characters")
    private String majorCategory;

    @NotBlank(message = "Minor category is required")
    @Size(max = 50, message = "Minor category must not exceed 50 characters")
    private String minorCategory;

    @NotBlank(message = "Question type is required")
    @Size(max = 50, message = "Question type must not exceed 50 characters")
    private String questionType;

    private String explanation;

    @NotNull(message = "Difficulty level is required")
    private Integer difficultyLevel;
}