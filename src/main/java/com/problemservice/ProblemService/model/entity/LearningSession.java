package com.problemservice.ProblemService.model.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

/**
 * 사용자의 학습 세션을 나타내는 엔티티 클래스
 * 세션 상태, 진행률, 문제 답안 통계를 추적
 * 입력: 사용자 ID 및 세션 생성 요청
 * 출력: 진행률과 통계가 포함된 학습 세션 데이터
 */
@Entity
@Table(name = "learning_sessions")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class LearningSession {

    // 기본 키 - 세션의 고유 식별자
    @Id
    @Column(name = "session_id", nullable = false)
    private String sessionId;

    // 세션 소유자의 사용자 ID
    @Column(name = "user_id", nullable = false)
    @NotBlank
    private String userId;

    // 세션이 처음 생성된 시점의 자동 타임스탬프
    @CreationTimestamp
    @Column(name = "created_at", updatable = false, columnDefinition = "DATETIME(6)")
    private LocalDateTime createdAt;

    // 사용자가 세션을 실제로 시작한 시점
    @Column(name = "started_at", columnDefinition = "DATETIME(6)")
    private LocalDateTime startedAt;

    // 세션이 완료된 시점
    @Column(name = "completed_at", columnDefinition = "DATETIME(6)")
    private LocalDateTime completedAt;

    // 세션 정보가 마지막으로 업데이트된 시점의 자동 타임스탬프
    @UpdateTimestamp
    @Column(name = "updated_at", columnDefinition = "DATETIME(6)")
    private LocalDateTime updatedAt;

    // 세션의 현재 상태 (STARTED, IN_PROGRESS, COMPLETED)
    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    @Builder.Default
    private SessionStatus status = SessionStatus.STARTED;

    // 세션 유형 (연습, 복습, 오답노트)
    @Enumerated(EnumType.STRING)
    @Column(name = "session_type", nullable = false)
    @Builder.Default
    private SessionType sessionType = SessionType.PRACTICE;

    // 세션 관련 추가 메타데이터 (JSON 형태로 저장)
    @Column(name = "session_metadata", columnDefinition = "TEXT")
    private String sessionMetadata;

    // 세션에 포함된 총 문제 수
    @Column(name = "total_questions")
    private Integer totalQuestions;

    // 사용자가 답변한 문제 수
    @Column(name = "answered_questions")
    @Builder.Default
    private Integer answeredQuestions = 0;

    // 정답 개수
    @Column(name = "correct_answers")
    @Builder.Default
    private Integer correctAnswers = 0;

    // 오답 개수
    @Column(name = "wrong_answers")
    @Builder.Default
    private Integer wrongAnswers = 0;

    // 세션 진행률 (0.0 ~ 100.0)
    @Column(name = "progress_percentage")
    @Builder.Default
    private Double progressPercentage = 0.0;

    // 세션 상태를 정의하는 열거형
    public enum SessionStatus {
        STARTED,        // 세션 생성됨
        IN_PROGRESS,    // 세션 진행 중
        COMPLETED       // 세션 완료됨
    }

    // 세션 유형을 정의하는 열거형
    public enum SessionType {
        PRACTICE,       // 연습 세션
        REVIEW,         // 복습 세션
        WRONG_ANSWER    // 오답 노트 세션
    }
}