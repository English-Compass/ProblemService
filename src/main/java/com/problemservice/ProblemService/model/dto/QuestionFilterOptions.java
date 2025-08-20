package com.problemservice.ProblemService.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class QuestionFilterOptions {
    private String category;
    private String keyword;
    private String level;
    private String questionType;
}