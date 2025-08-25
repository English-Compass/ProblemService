package com.problemservice.ProblemService.model.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

/**
 * 사용자가 제출한 문제 답안을 저장하는 엔티티 클래스
 * 답안 정확성, 소요 시간, 답안 제출 시점을 추적
 * 입력: 세션 ID, 문제 ID, 사용자 답안
 * 출력: 답안 정확성 및 통계 데이터
 */
@Entity
@Table(name = "question_answer", 
       uniqueConstraints = @UniqueConstraint(name = "uk_session_question_answer", 
                                           columnNames = {"session_id", "question_id"}))
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class QuestionAnswer {

    // 기본 키 - 자동 증가하는 ID
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // 답안이 제출된 학습 세션 ID
    @Column(name = "session_id", nullable = false)
    @NotBlank
    private String sessionId;

    // 답안이 제출된 문제 ID
    @Column(name = "question_id", nullable = false)
    @NotBlank
    private String questionId;

    // 답안이 제출된 세션의 유형 (연습, 복습, 오답노트)
    @Column(name = "session_type", nullable = false, length = 50)
    @NotBlank
    private String sessionType;

    // 사용자가 선택한 답안 (A, B, C 중 하나)
    @Column(name = "user_answer", nullable = false, length = 1)
    @NotBlank
    private String userAnswer;

    // 답안이 정답인지 여부
    @Column(name = "is_correct", nullable = false)
    @NotNull
    private Boolean isCorrect;

    // 문제 해결에 소요된 시간 (초 단위)
    @Column(name = "time_spent")
    private Integer timeSpent;

    // 답안이 제출된 시점의 타임스탬프
    @CreationTimestamp
    @Column(name = "answered_at", columnDefinition = "DATETIME(6)")
    private LocalDateTime answeredAt;

    // 이 문제를 푼 횟수 (기본값 1)
    @Column(name = "solve_count", nullable = false)
    @Builder.Default
    private Integer solveCount = 1;

    // 학습 세션 엔티티와의 다대일 연관관계 (지연 로딩)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "session_id", insertable = false, updatable = false)
    private LearningSession learningSession;

    // 문제 엔티티와의 다대일 연관관계 (지연 로딩)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "question_id", insertable = false, updatable = false)
    private Question question;
}