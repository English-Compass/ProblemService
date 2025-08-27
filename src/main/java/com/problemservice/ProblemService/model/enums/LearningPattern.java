package com.problemservice.ProblemService.model.enums;

/**
 * 학습자의 전반적인 학습 패턴을 나타내는 열거형
 * 외부 분석 서비스에서 분석된 학습자의 특성을 분류
 */
public enum LearningPattern {
    
    /**
     * 우수한 학습자 (정답률 80%+, 빠른 속도)
     */
    EXCELLENT,
    
    /**
     * 정확하지만 느린 학습자 (정답률 80%+, 느린 속도)
     */
    ACCURATE_BUT_SLOW,
    
    /**
     * 좋은 학습자 (정답률 60%+, 적당한 속도)
     */
    GOOD,
    
    /**
     * 좋지만 느린 학습자 (정답률 60%+, 느린 속도)
     */
    GOOD_BUT_SLOW,
    
    /**
     * 평균적인 학습자 (정답률 40%+)
     */
    AVERAGE,
    
    /**
     * 개선이 필요한 학습자 (정답률 < 40%)
     */
    NEEDS_IMPROVEMENT,
    
    /**
     * 데이터 없음
     */
    NO_DATA,
    
    /**
     * 빠른 학습자 (평균 시간 < 20초)
     */
    FAST_LEARNER,
    
    /**
     * 보통 속도 학습자 (평균 시간 20-40초)
     */
    MODERATE_LEARNER,
    
    /**
     * 신중한 학습자 (평균 시간 40-60초)
     */
    CAREFUL_LEARNER,
    
    /**
     * 느린 학습자 (평균 시간 60초+)
     */
    SLOW_LEARNER
}