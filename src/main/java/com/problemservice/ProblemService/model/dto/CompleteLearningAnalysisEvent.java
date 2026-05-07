package com.problemservice.ProblemService.model.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * Kafka 이벤트로 받는 학습 분석 완료 이벤트 DTO
 * LearningService의 AnalysisCompletedEvent와 구조를 맞춤 (핵심 필드만)
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonIgnoreProperties(ignoreUnknown = true)
public class CompleteLearningAnalysisEvent {

    private String eventType;
    private String userId;
    private String sessionId;

    /** 취약 문제 유형 (정답률 60% 미만): word / sentence / conversation */
    private List<String> weakQuestionTypes;

    /** 최근 오답 문제 ID 목록 */
    private List<String> wrongQuestionIds;

    /** 복습 추천 문제 ID 목록 */
    private List<String> recommendedReviewQuestions;

    /** 학습 패턴: IMPROVING / STABLE / STRUGGLING */
    private String learningPattern;

    /** 이벤트 타임스탬프 */
    private long timestamp;
}