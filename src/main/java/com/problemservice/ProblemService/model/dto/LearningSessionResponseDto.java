package com.problemservice.ProblemService.model.dto;

import com.problemservice.ProblemService.model.entity.LearningSession.SessionStatus;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 학습 세션 응답을 위한 데이터 전송 객체 (DTO)
 * API 응답으로 클라이언트에게 학습 세션 정보를 전달하는 역할
 * 입력: 학습 세션 엔티티 데이터
 * 출력: JSON 형태의 학습 세션 응답 데이터
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class LearningSessionResponseDto {

    // 학습 세션의 고유 식별자
    private String sessionId;
    // 세션을 생성한 사용자의 ID
    private String userId;
    // 현재 세션 상태 (CREATED, IN_PROGRESS, COMPLETED, CANCELLED)
    private SessionStatus status;
    // 세션 유형 (PRACTICE, REVIEW, WRONG_ANSWER)
    private SessionType sessionType;
    // 세션 관련 추가 메타데이터 (JSON 형태의 문자열)
    private String sessionMetadata;
    // 세션에 포함된 총 문제 개수
    private Integer totalQuestions;
    // 사용자가 답변한 문제 개수
    private Integer answeredQuestions;
    // 정답 개수
    private Integer correctAnswers;
    // 오답 개수
    private Integer wrongAnswers;
    // 세션 진행률 (0.0 ~ 100.0 퍼센트)
    private Double progressPercentage;
    // 세션 생성 시간
    private LocalDateTime createdAt;
    // 세션 시작 시간 (학습 시작 버튼 클릭 시점)
    private LocalDateTime startedAt;
    // 세션 완료 시간 (모든 문제 완료 시점)
    private LocalDateTime completedAt;
    // 세션 정보 최종 수정 시간
    private LocalDateTime updatedAt;
}