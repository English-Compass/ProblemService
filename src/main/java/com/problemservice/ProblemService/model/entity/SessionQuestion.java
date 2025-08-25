package com.problemservice.ProblemService.model.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 학습 세션과 문제를 연결하는 중간 테이블 엔티티
 * 세션 내에서 문제의 순서와 카테고리 정보를 관리
 * 입력: 세션 ID, 문제 ID, 순서 정보
 * 출력: 세션-문제 연관관계 및 순서 데이터
 */
@Entity
@Table(name = "session_question",
       uniqueConstraints = {
           // 한 세션에서 같은 문제가 중복되지 않도록 제약
           @UniqueConstraint(name = "uk_session_question", columnNames = {"session_id", "question_id"}),
           // 한 세션에서 문제 순서가 중복되지 않도록 제약
           @UniqueConstraint(name = "uk_session_order", columnNames = {"session_id", "question_order"})
       })
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class SessionQuestion {

    // 기본 키 - 자동 증가하는 ID
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // 연관된 학습 세션의 ID
    @Column(name = "session_id", nullable = false)
    @NotBlank
    private String sessionId;

    // 연관된 문제의 ID
    @Column(name = "question_id", nullable = false)
    @NotBlank
    private String questionId;

    // 세션 내에서 이 문제의 순서 (1부터 시작)
    @Column(name = "question_order", nullable = false)
    @NotNull
    private Integer questionOrder;

    // 이 문제가 속한 카테고리 목록 (별도 테이블에 저장)
    @ElementCollection
    @CollectionTable(name = "session_question_categories", joinColumns = @JoinColumn(name = "session_question_id"))
    @Column(name = "category")
    @Size(min = 1, max = 6, message = "Available categories must be between 1 and 6")
    private List<String> categories;

    // 학습 세션 엔티티와의 다대일 연관관계 (지연 로딩)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "session_id", insertable = false, updatable = false)
    private LearningSession learningSession;

    // 문제 엔티티와의 다대일 연관관계 (지연 로딩)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "question_id", insertable = false, updatable = false)
    private Question question;
}