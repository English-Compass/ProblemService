package com.problemservice.ProblemService.model.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 세션에 문제 추가를 위한 데이터 전송 객체 (DTO)
 * 기존 학습 세션에 새로운 문제를 추가할 때 사용
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AddQuestionRequestDto {

    @NotBlank(message = "Question ID is required")
    private String questionId;
}

