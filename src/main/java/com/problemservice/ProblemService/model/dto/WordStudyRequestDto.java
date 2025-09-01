package com.problemservice.ProblemService.model.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Max;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class WordStudyRequestDto {
    
    @NotBlank(message = "사용자 ID는 필수입니다")
    private String userId;
    
    @NotNull(message = "단어 개수는 필수입니다")
    @Min(value = 5, message = "최소 5개 단어가 필요합니다")
    @Max(value = 50, message = "최대 50개 단어까지 생성 가능합니다")
    private Integer wordCount;
    
    @Builder.Default
    private String focusCategory = null; // 특정 카테고리에 집중하고 싶은 경우
    
    @Builder.Default
    private String targetDifficulty = null; // 특정 난이도에 집중하고 싶은 경우
}