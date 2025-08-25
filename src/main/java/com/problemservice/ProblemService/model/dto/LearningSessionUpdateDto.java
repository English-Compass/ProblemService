package com.problemservice.ProblemService.model.dto;

import com.problemservice.ProblemService.model.entity.LearningSession.SessionStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 학습 세션 업데이트를 위한 데이터 전송 객체 (DTO)
 * API 요청으로부터 학습 세션 수정에 필요한 정보를 전달받는 역할
 * 입력: HTTP 요청 본문의 JSON 데이터
 * 출력: 검증된 학습 세션 수정 데이터
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class LearningSessionUpdateDto {

    // 수정할 세션 상태 (CREATED, IN_PROGRESS, COMPLETED, CANCELLED)
    private SessionStatus status;
    // 수정할 세션 메타데이터 (JSON 형태의 문자열)
    private String sessionMetadata;
    // 업데이트할 답변한 문제 개수
    private Integer answeredQuestions;
    // 업데이트할 정답 개수
    private Integer correctAnswers;
    // 업데이트할 오답 개수
    private Integer wrongAnswers;
    // 업데이트할 진행률 (0.0 ~ 100.0 퍼센트)
    private Double progressPercentage;
}