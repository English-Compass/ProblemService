package com.problemservice.ProblemService.model.dto;

import com.problemservice.ProblemService.model.entity.LearningSession.SessionType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 학습 세션 생성을 위한 데이터 전송 객체 (DTO)
 * API 요청으로부터 학습 세션 생성에 필요한 정보를 전달받는 역할
 * 입력: HTTP 요청 본문의 JSON 데이터
 * 출력: 검증된 학습 세션 생성 데이터
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class LearningSessionCreateDto {

    // 학습 세션을 생성할 사용자 ID (필수)
    @NotBlank(message = "User ID is required")
    private String userId;

    // 세션 유형 (PRACTICE, REVIEW, WRONG_ANSWER 중 하나, 필수)
    @NotNull(message = "Session type is required")
    private SessionType sessionType;

    // 세션 관련 추가 메타데이터 (JSON 형태의 문자열)
    private String sessionMetadata;

    // 세션에 포함할 문제 ID 목록 (선택사항)
    private List<String> questionIds;

    // 문제 선택을 위한 카테고리 목록 (1개 이상 6개 이하)
    @Size(min = 1, max = 6, message = "Available categories must be between 1 and 6")
    private List<String> categories;
}