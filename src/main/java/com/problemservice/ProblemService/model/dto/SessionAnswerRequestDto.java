package com.problemservice.ProblemService.model.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 세션 답변 제출을 위한 데이터 전송 객체 (DTO)
 * 사용자가 문제에 답변을 제출할 때 사용
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SessionAnswerRequestDto {

    @NotBlank(message = "Question ID is required")
    private String questionId;

    @NotNull(message = "isCorrect field is required")
    private Boolean isCorrect;
}

