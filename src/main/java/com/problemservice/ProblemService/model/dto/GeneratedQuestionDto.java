package com.problemservice.ProblemService.model.dto;

import com.problemservice.ProblemService.model.enums.Difficulty;
import com.problemservice.ProblemService.model.enums.QuestionType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * OpenAI로 생성된 문제 데이터 DTO
 * 생성된 문제의 모든 정보를 포함하며, Question 엔티티로 변환 가능한 형태
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GeneratedQuestionDto {
    
    /**
     * 생성된 문제 텍스트
     */
    private String questionText;
    
    /**
     * 선택지 A
     */
    private String optionA;
    
    /**
     * 선택지 B
     */
    private String optionB;
    
    /**
     * 선택지 C
     */
    private String optionC;
    
    /**
     * 정답 (A, B, C 중 하나)
     */
    private String correctAnswer;
    
    /**
     * 문제 유형
     */
    private QuestionType questionType;
    
    /**
     * 난이도
     */
    private Difficulty difficulty;
    
    /**
     * 주요 카테고리
     */
    private String majorCategory;
    
    /**
     * 세부 카테고리
     */
    private String minorCategory;
    
    /**
     * 문제에 대한 설명 (선택사항)
     */
    private String explanation;
    
    /**
     * 문제 생성 시간
     */
    private LocalDateTime generatedAt;
    
    /**
     * AI 생성 성공 여부
     */
    private boolean isValid;
    
    /**
     * 생성 실패 시 에러 메시지
     */
    private String errorMessage;
}