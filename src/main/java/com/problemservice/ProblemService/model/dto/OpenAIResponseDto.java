package com.problemservice.ProblemService.model.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class OpenAIResponseDto {
    
    private String response;
    private String model;
    private Integer tokensUsed;
    private LocalDateTime createdAt;
    private boolean success;
    private String errorMessage;
}