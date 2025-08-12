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
import java.util.List;

@Entity
@Table(name = "quiz")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class Quiz {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id", nullable = false)
    @NotNull
    private QuizCategory category;

    @Column(nullable = false, columnDefinition = "TEXT")
    @NotBlank
    private String question;

    @Column(nullable = false, columnDefinition = "TEXT")
    @NotBlank
    private String answer;

    @Column(name = "difficulty_level", nullable = false, length = 10)
    @NotBlank
    private String difficultyLevel;

    @Column(length = 500)
    private String keyword;

    @Column(name = "question_type", nullable = false, length = 50)
    @NotBlank
    private String questionType;

    @OneToMany(mappedBy = "quiz", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<QuizOptions> options;

    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
}