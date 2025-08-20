package com.problemservice.ProblemService.model.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class OpenAIRequestDto {
    
    @NotBlank(message = "프롬프트는 필수입니다")
    private String prompt;
    
    @Builder.Default
    private String model = "gpt-3.5-turbo";
    
    @Builder.Default
    private Integer maxTokens = 150;
    
    @Builder.Default
    private Double temperature = 0.7;
}