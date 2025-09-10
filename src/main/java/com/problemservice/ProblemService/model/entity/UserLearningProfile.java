package com.problemservice.ProblemService.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(name = "user_learning_profiles", indexes = {
    @Index(name = "idx_ulp_user_id", columnList = "user_id", unique = true)
})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserLearningProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id", nullable = false, unique = true)
    private String userId;

    @Column(name = "overall_accuracy")
    private Double overallAccuracy;

    @Column(name = "total_questions_answered")
    private Integer totalQuestionsAnswered;

    @Column(name = "total_correct_answers")
    private Integer totalCorrectAnswers;

    // JSON or TEXT field to store detailed performance by category
    @Lob
    @Column(name = "category_performance", columnDefinition = "TEXT")
    private String categoryPerformance;

    @UpdateTimestamp
    @Column(name = "last_updated_at", columnDefinition = "DATETIME(6)")
    private LocalDateTime lastUpdatedAt;
}
