package com.problemservice.ProblemService.model.dto;

import com.problemservice.ProblemService.model.enums.LearningPattern;
import com.problemservice.ProblemService.model.enums.QuestionType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

/**
 * 외부 분석 서비스에서 제공하는 완전한 학습 분석 데이터
 * Kafka 이벤트를 통해 받는 상세 분석 정보
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CompleteLearningAnalysis {
    
    /**
     * 분석된 세션 ID
     */
    private String sessionId;
    
    /**
     * 학습자 사용자 ID
     */
    private String userId;
    
    /**
     * 총 학습 시간 (초)
     */
    private int totalDuration;
    
    /**
     * 문제당 평균 응답 시간 (초)
     */
    private double averageTimePerQuestion;
    
    /**
     * 오답 문제 ID 목록
     */
    private List<String> wrongQuestionIds;
    
    /**
     * 취약한 문제 유형 목록
     */
    private List<QuestionType> weakQuestionTypes;
    
    /**
     * 문제 유형별 상세 성과
     */
    private Map<QuestionType, QuestionTypePerformance> questionTypePerformances;
    
    /**
     * 전체 학습 패턴
     */
    private LearningPattern overallLearningPattern;
    
    /**
     * 학습 일관성 점수 (0-100)
     */
    private double consistencyScore;
    
    /**
     * 복습 추천 문제 ID 목록
     */
    private List<String> recommendedReviewQuestions;
    
    /**
     * 개인화된 학습 제안 메시지
     */
    private String learningSuggestion;
    
    /**
     * 집중 학습 영역
     */
    private List<String> focusAreas;
    
    /**
     * 예상 복습 시간 (분)
     */
    private int estimatedReviewTime;
}