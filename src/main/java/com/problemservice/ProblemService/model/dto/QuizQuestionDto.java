package com.problemservice.ProblemService.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 퀴즈 문제 응답용 DTO
 * 복습 퀴즈, 오답노트에서 사용하는 표준 형식
 * 구조: { id, question, options[], correct }
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class QuizQuestionDto {
    
    private String id;
    private String question;
    private List<String> options;
    private String correct;
    
    public static QuizQuestionDto fromQuestionResponseDto(QuestionResponseDto questionDto) {
        return QuizQuestionDto.builder()
                .id(questionDto.getQuestionId())
                .question(questionDto.getQuestionText())
                .options(List.of(
                    questionDto.getOptionA(),
                    questionDto.getOptionB(), 
                    questionDto.getOptionC()
                ))
                .correct(questionDto.getCorrectAnswer())
                .build();
    }
}