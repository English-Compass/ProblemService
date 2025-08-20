package com.problemservice.ProblemService.model.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "session_question",
       uniqueConstraints = {
           @UniqueConstraint(name = "uk_session_question", columnNames = {"session_id", "question_id"}),
           @UniqueConstraint(name = "uk_session_order", columnNames = {"session_id", "question_order"})
       })
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class SessionQuestion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "session_id", nullable = false)
    @NotBlank
    private String sessionId;

    @Column(name = "question_id", nullable = false)
    @NotBlank
    private String questionId;

    @Column(name = "question_order", nullable = false)
    @NotNull
    private Integer questionOrder;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "session_id", insertable = false, updatable = false)
    private LearningSession learningSession;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "question_id", insertable = false, updatable = false)
    private Question question;
}