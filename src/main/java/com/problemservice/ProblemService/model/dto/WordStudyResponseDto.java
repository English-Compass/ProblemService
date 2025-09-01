package com.problemservice.ProblemService.model.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Data
@Builder
public class WordStudyResponseDto {
    
    private List<WordStudyWordDto> words;
    private String studyStrategy;
    private List<String> focusAreas;
    private Integer estimatedStudyTime;
    private Map<String, Integer> difficultyDistribution; // A: count, B: count, C: count
    private Map<String, Integer> categoryDistribution; // weak: count, medium: count, strong: count
    private LocalDateTime generatedAt;
    private boolean success;
    private String errorMessage;
}