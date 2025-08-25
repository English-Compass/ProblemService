package com.problemservice.ProblemService.model.dto;

import com.problemservice.ProblemService.model.entity.LearningSession.SessionType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 세션 완료 이벤트 데이터 전송 객체 (DTO)
 * Kafka 메시징을 통해 세션 완료 이벤트 정보를 외부 시스템에 전달하는 역할
 * 입력: 완료된 학습 세션 데이터
 * 출력: Kafka 토픽으로 발행할 이벤트 메시지
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class SessionCompletedEventDto {

    // 이벤트 유형 (예: "SESSION_COMPLETED")
    private String eventType;
    // 완료된 학습 세션의 고유 식별자
    private String sessionId;
    // 세션을 완료한 사용자의 ID
    private String userId;
    // 완료된 세션의 유형 (PRACTICE, REVIEW, WRONG_ANSWER)
    private SessionType sessionType;
    // 세션 완료 시간
    private LocalDateTime completedAt;
    // 세션에 포함된 총 문제 개수
    private Integer totalQuestions;
    // 사용자가 맞힌 정답 개수
    private Integer correctAnswers;
    // 사용자가 틀린 오답 개수
    private Integer wrongAnswers;
    // 세션 완료 시점의 진행률 (0.0 ~ 100.0 퍼센트)
    private Double progressPercentage;
    // 이벤트 발생 시간 (현재 시간)
    private LocalDateTime eventTimestamp;
}