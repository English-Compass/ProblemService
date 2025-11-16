package com.problemservice.ProblemService.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 사용자 약점 영역 요약 정보 DTO
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class WeaknessSummaryDto {
    
    private String userId;
    private List<String> weakestCategories;
    private String weakestDifficulty;
    private String weakestDifficultyAccuracy; // 포맷된 문자열 (예: "65.5%")
    private List<String> weakQuestionTypes;
    private String learningPattern;
    private String recommendedFocus;
}

