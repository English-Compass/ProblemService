package com.problemservice.ProblemService.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 틀린 문제용 DTO
 * WrongAnswerCard에서 사용하는 형식
 * 구조: { id, question, options[] }
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class WrongAnswerQuestionDto {
    
    private String id;
    private String question;
    private List<String> options;
    
    public static WrongAnswerQuestionDto fromQuestionAnswerResponseDto(QuestionAnswerResponseDto answerDto) {
        return WrongAnswerQuestionDto.builder()
                .id(answerDto.getQuestionId())
                .question(answerDto.getQuestionText())
                .options(List.of(
                    answerDto.getOptionA(),
                    answerDto.getOptionB(),
                    answerDto.getOptionC()
                ))
                .build();
    }
}