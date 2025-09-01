package com.problemservice.ProblemService.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class WordStudyWordDto {
    
    private String word;
    private String difficulty; // A, B, C
    private String category;
    private String questionType; // WORD, SENTENCE
    private String definition;
    private String koreanMeaning;
    private String exampleSentence;
    private String commonMistakes;
    private String studyTip;
    private String categoryContext;
}