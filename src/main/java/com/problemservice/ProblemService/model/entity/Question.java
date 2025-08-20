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

@Entity
@Table(name = "question")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class Question {

    @Id
    @Column(name = "question_id", nullable = false)
    private String questionId;

    @Column(name = "question_text", nullable = false, columnDefinition = "TEXT")
    @NotBlank
    private String questionText;

    @Column(name = "option_a", nullable = false, length = 500)
    @NotBlank
    private String optionA;

    @Column(name = "option_b", nullable = false, length = 500)
    @NotBlank
    private String optionB;

    @Column(name = "option_c", nullable = false, length = 500)
    @NotBlank
    private String optionC;

    @Column(name = "correct_answer", nullable = false, length = 1)
    @NotBlank
    private String correctAnswer;

    @Column(name = "major_category", nullable = false, length = 50)
    @NotBlank
    private String majorCategory;

    @Column(name = "minor_category", nullable = false, length = 50)
    @NotBlank
    private String minorCategory;

    @Column(name = "question_type", nullable = false, length = 50)
    @NotBlank
    private String questionType;

    @Column(name = "explanation", columnDefinition = "TEXT")
    private String explanation;

    @Column(name = "difficulty_level", nullable = false)
    @NotNull
    @Builder.Default
    private Integer difficultyLevel = 1;

    @CreationTimestamp
    @Column(name = "created_at", updatable = false, columnDefinition = "DATETIME(6)")
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at", columnDefinition = "DATETIME(6)")
    private LocalDateTime updatedAt;
}