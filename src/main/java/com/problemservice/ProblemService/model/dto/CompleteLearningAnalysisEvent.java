package com.problemservice.ProblemService.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Kafka 이벤트로 받는 학습 분석 완료 이벤트 DTO
 * 외부 분석 서비스에서 전송하는 이벤트 데이터를 담는 래퍼 클래스
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CompleteLearningAnalysisEvent {
    
    /**
     * 분석 완료된 세션 ID
     */
    private String sessionId;
    
    /**
     * 학습자 사용자 ID
     */
    private String userId;
    
    /**
     * 상세 학습 분석 데이터
     */
    private CompleteLearningAnalysis analysisData;
    
    /**
     * 이벤트 발생 타임스탬프
     */
    private long timestamp;
}