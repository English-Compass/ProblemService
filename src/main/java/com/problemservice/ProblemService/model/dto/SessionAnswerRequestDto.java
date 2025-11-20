package com.problemservice.ProblemService.model.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
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

    @NotBlank(message = "User answer is required")
    @Size(min = 1, max = 1, message = "User answer must be A, B, or C")
    private String userAnswer;

    @NotNull(message = "isCorrect field is required")
    private Boolean isCorrect;

    // 문제 해결에 소요된 시간 (초 단위, 선택)
    private Integer timeSpent;

    // 이 문제를 푼 횟수 (기본값 1)
    @Builder.Default
    private Integer solveCount = 1;
}

