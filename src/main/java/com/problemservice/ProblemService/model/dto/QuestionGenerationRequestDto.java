package com.problemservice.ProblemService.model.dto;

import com.problemservice.ProblemService.model.enums.Difficulty;
import com.problemservice.ProblemService.model.enums.QuestionType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * OpenAI를 사용한 문제 생성 요청 DTO
 * 사용자가 원하는 문제 유형, 난이도, 주제 등을 지정하여 AI 문제 생성을 요청
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QuestionGenerationRequestDto {
    
    /**
     * 생성할 문제 유형 (WORD, SENTENCE, CONVERSATION)
     */
    @NotNull(message = "문제 유형은 필수입니다")
    private QuestionType questionType;
    
    /**
     * 문제 난이도 (A: 초급, B: 중급, C: 고급)
     */
    @NotNull(message = "난이도는 필수입니다")
    private Difficulty difficulty;
    
    /**
     * 주요 카테고리 (학업, 비즈니스, 여행, 일상생활)
     */
    @NotBlank(message = "주요 카테고리는 필수입니다")
    private String majorCategory;
    
    /**
     * 세부 카테고리 (선택사항)
     */
    private String minorCategory;
    
    /**
     * 문제 주제 또는 키워드 목록 (선택사항)
     */
    private List<String> topics;
    
    /**
     * 생성할 문제 개수 (기본값: 1)
     */
    @PositiveOrZero(message = "문제 개수는 0 이상이어야 합니다")
    @Builder.Default
    private Integer questionCount = 1;
    
    /**
     * 추가 컨텍스트나 특별 요구사항 (선택사항)
     */
    private String additionalContext;
    
    /**
     * 언어 설정 (기본값: 한국어-영어)
     */
    @Builder.Default
    private String language = "ko-en";
}