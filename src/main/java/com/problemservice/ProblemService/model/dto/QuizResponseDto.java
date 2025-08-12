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
public class QuizResponseDto {

    private Long id;
    private Long categoryId;
    private String categoryName;
    private String question;
    private String answer;
    private String difficultyLevel;
    private String questionType;
    private String keyword;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}