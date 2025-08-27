package com.problemservice.ProblemService.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 문제 생성 결과 응답 DTO
 * 생성된 문제 목록과 생성 결과 메타데이터를 포함
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QuestionGenerationResponseDto {
    
    /**
     * 생성된 문제 목록
     */
    private List<GeneratedQuestionDto> questions;
    
    /**
     * 요청한 문제 개수
     */
    private int requestedCount;
    
    /**
     * 성공적으로 생성된 문제 개수
     */
    private int successfullyGenerated;
    
    /**
     * 생성에 실패한 문제 개수
     */
    private int failedCount;
    
    /**
     * 전체 생성 프로세스 성공 여부
     */
    private boolean success;
    
    /**
     * 생성 과정에서 발생한 에러 메시지들
     */
    private List<String> errorMessages;
    
    /**
     * 사용된 총 AI 토큰 수
     */
    private Integer totalTokensUsed;
    
    /**
     * 문제 생성 완료 시간
     */
    private LocalDateTime generatedAt;
    
    /**
     * 생성에 소요된 시간 (밀리초)
     */
    private Long processingTimeMs;
}