package com.problemservice.ProblemService.model.dto;

import lombok.Builder;
import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
@Builder
public class UserLearningProfileDto {
    
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