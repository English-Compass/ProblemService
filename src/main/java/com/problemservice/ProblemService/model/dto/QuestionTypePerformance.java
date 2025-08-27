package com.problemservice.ProblemService.model.dto;

import com.problemservice.ProblemService.model.enums.Difficulty;
import com.problemservice.ProblemService.model.enums.QuestionType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 문제 유형별 상세 성과 데이터
 * 특정 문제 유형에 대한 학습자의 성과를 나타내는 DTO
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QuestionTypePerformance {
    
    /**
     * 문제 유형 (FILL_IN_THE_BLANK, SYNONYM_SELECTION, PRONUNCIATION_RECOGNITION)
     */
    private QuestionType questionType;
    
    /**
     * 총 문제 수
     */
    private int totalQuestions;
    
    /**
     * 정답 수
     */
    private int correctAnswers;
    
    /**
     * 정답률
     */
    private double accuracy;
    
    /**
     * 취약 영역 여부 (정답률 < 70%)
     */
    private boolean isWeakArea;
    
    /**
     * 평균 응답 시간
     */
    private double averageTime;
    
    /**
     * 난이도
     */
    private Difficulty difficulty;
}