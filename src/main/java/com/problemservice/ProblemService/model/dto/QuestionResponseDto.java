package com.problemservice.ProblemService.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class QuestionResponseDto {

    private String questionId;
    private String questionText;
    private String optionA;
    private String optionB;
    private String optionC;
    private String correctAnswer;
    private String majorCategory;
    private String minorCategory;
    private String questionType;
    private String explanation;
    private Integer difficultyLevel;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    
    private String level;
    private String option1;
    private String option2;
    private String option3;
    private Integer answerIndex;
    
    // 답안 정보 (오답노트/복습용 - 선택적 필드)
    private String userAnswer;          // 사용자가 선택한 답안 (A/B/C)
    private String userAnswerText;      // 사용자가 선택한 답안 텍스트
    private String correctAnswerText;    // 정답 텍스트
    private Boolean isCorrect;          // 정답 여부
    private LocalDateTime answeredAt;    // 답안 제출 시간
}