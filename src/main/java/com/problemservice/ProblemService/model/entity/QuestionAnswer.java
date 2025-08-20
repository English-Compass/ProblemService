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

@Entity
@Table(name = "question_answer", 
       uniqueConstraints = @UniqueConstraint(name = "uk_session_question_answer", 
                                           columnNames = {"session_id", "question_id"}))
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class QuestionAnswer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "session_id", nullable = false)
    @NotBlank
    private String sessionId;

    @Column(name = "question_id", nullable = false)
    @NotBlank
    private String questionId;

    @Column(name = "session_type", nullable = false, length = 50)
    @NotBlank
    private String sessionType;

    @Column(name = "user_answer", nullable = false, length = 1)
    @NotBlank
    private String userAnswer;

    @Column(name = "is_correct", nullable = false)
    @NotNull
    private Boolean isCorrect;

    @Column(name = "time_spent")
    private Integer timeSpent;

    @CreationTimestamp
    @Column(name = "answered_at", columnDefinition = "DATETIME(6)")
    private LocalDateTime answeredAt;

    @Column(name = "solve_count", nullable = false)
    @Builder.Default
    private Integer solveCount = 1;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "session_id", insertable = false, updatable = false)
    private LearningSession learningSession;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "question_id", insertable = false, updatable = false)
    private Question question;
}