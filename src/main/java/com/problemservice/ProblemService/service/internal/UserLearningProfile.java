package com.problemservice.ProblemService.service.internal;

import lombok.Builder;
import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * WordStudyService 내부용 학습 프로필 분석 DTO
 * 외부 API에 노출되지 않으며, 내부 분석 로직에만 사용됨
 * API 응답에는 WeaknessSummaryDto 사용 권장
 */
@Data
@Builder
public class UserLearningProfile {
    
    private String userId;
    private Map<String, Double> categoryAccuracy; // category -> accuracy percentage
    private Map<String, Double> difficultyAccuracy; // A, B, C -> accuracy percentage
    private Map<String, Integer> difficultyQuestionsSolved; // A, B, C -> question count
    private List<String> weakCategories;
    private List<String> mediumCategories;
    private List<String> strongCategories;
    private String weakestDifficulty;
    private String strongestDifficulty;
    private Double weakestDifficultyAccuracy;
    private Double strongestDifficultyAccuracy;
    private List<String> weakQuestionTypes;
    private String learningPattern; // IMPROVING, STABLE, STRUGGLING
    private Double averageTime;
    private Double consistencyScore;
}

