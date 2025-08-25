package com.problemservice.ProblemService.model.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

/**
 * 언어 학습 퀴즈 문제를 나타내는 엔티티 클래스
 * 문제 내용, 답안 선택지, 정답 및 메타데이터를 포함
 * 입력: 외부 소스나 API 요청으로부터의 문제 데이터
 * 출력: 데이터베이스에 저장된 영속화된 문제 엔티티
 */
@Entity
@Table(name = "question")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class Question {

    // 기본 키 필드 - 각 문제의 고유 식별자
    @Id
    @Column(name = "question_id", nullable = false)
    private String questionId;

    // 주요 문제 텍스트 내용 - 긴 문제를 위해 TEXT로 저장
    @Column(name = "question_text", nullable = false, columnDefinition = "TEXT")
    @NotBlank
    private String questionText;

    // 첫 번째 답안 선택지 - 500자로 제한
    @Column(name = "option_a", nullable = false, length = 500)
    @NotBlank
    private String optionA;

    // 두 번째 답안 선택지 - 500자로 제한
    @Column(name = "option_b", nullable = false, length = 500)
    @NotBlank
    private String optionB;

    // 세 번째 답안 선택지 - 500자로 제한
    @Column(name = "option_c", nullable = false, length = 500)
    @NotBlank
    private String optionC;

    // 정답 표시자 - 단일 문자 (A, B, 또는 C)
    @Column(name = "correct_answer", nullable = false, length = 1)
    @NotBlank
    private String correctAnswer;

    // 상위 레벨 카테고리 분류 (예: 학업, 비즈니스, 여행, 일상생활)
    @Column(name = "major_category", nullable = false, length = 50)
    @NotBlank
    private String majorCategory;

    // 주요 카테고리 내의 세부 하위 카테고리 분류
    @Column(name = "minor_category", nullable = false, length = 50)
    @NotBlank
    private String minorCategory;

    // 문제 유형 (빈칸 채우기의 경우 Word, 동의어 매칭의 경우 Sentence)
    @Column(name = "question_type", nullable = false, length = 50)
    @NotBlank
    private String questionType;

    // 정답에 대한 선택적 상세 설명
    @Column(name = "explanation", columnDefinition = "TEXT")
    private String explanation;

    // 난이도 등급: 1 (초급/A), 2 (중급/B), 3 (고급/C)
    @Column(name = "difficulty_level", nullable = false)
    @NotNull
    @Builder.Default
    private Integer difficultyLevel = 1;

    // 문제가 처음 생성된 시점의 자동 타임스탬프
    @CreationTimestamp
    @Column(name = "created_at", updatable = false, columnDefinition = "DATETIME(6)")
    private LocalDateTime createdAt;

    // 문제가 마지막으로 업데이트된 시점의 자동 타임스탬프
    @UpdateTimestamp
    @Column(name = "updated_at", columnDefinition = "DATETIME(6)")
    private LocalDateTime updatedAt;
}