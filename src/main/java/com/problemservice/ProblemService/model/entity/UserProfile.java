package com.problemservice.ProblemService.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

/**
 * 사용자 프로필 엔티티
 * UserService로부터 받은 사용자 기본 정보와 LearningAnalysisService로부터 받은 분석 정보를 통합 관리
 */
@Entity
@Table(name = "user_profiles", indexes = {
    @Index(name = "idx_up_user_id", columnList = "user_id", unique = true)
})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id", nullable = false, unique = true)
    private String userId;

    // ===== UserService로부터 받는 프로필 정보 =====
    @Column(name = "difficulty_level")
    private Integer difficultyLevel; // 1 (하), 2 (중), 3 (상)

    @Lob
    @Column(name = "selected_categories", columnDefinition = "TEXT")
    private String selectedCategories; // JSON array: ["학업", "비즈니스", ...]

    @Lob
    @Column(name = "preferred_question_types", columnDefinition = "TEXT")
    private String preferredQuestionTypes; // JSON array: ["WORD", "SENTENCE", "CONVERSATION"]

    // ===== LearningAnalysisService로부터 받는 분석 정보 =====
    @Lob
    @Column(name = "weak_categories", columnDefinition = "TEXT")
    private String weakCategories; // JSON array: ["여행", "일상생활", ...]

    @Lob
    @Column(name = "weak_question_types", columnDefinition = "TEXT")
    private String weakQuestionTypes; // JSON array: ["CONVERSATION", ...]

    @Lob
    @Column(name = "recommended_question_ids", columnDefinition = "TEXT")
    private String recommendedQuestionIds; // JSON array: [123, 456, ...]

    @Lob
    @Column(name = "focus_areas", columnDefinition = "TEXT")
    private String focusAreas; // JSON array: ["grammar", "vocabulary", ...]

    @Column(name = "consistency_score")
    private Double consistencyScore; // 0.0 ~ 100.0

    @Column(name = "overall_learning_pattern")
    private String overallLearningPattern; // FAST_LEARNER, STEADY, NEEDS_SUPPORT

    @Column(name = "average_time_per_question")
    private Double averageTimePerQuestion; // 문제당 평균 소요 시간(ms)

    // ===== 메타데이터 =====
    @Column(name = "profile_version")
    @Builder.Default
    private Integer profileVersion = 1; // 프로필 업데이트 버전

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false, columnDefinition = "DATETIME(6)")
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false, columnDefinition = "DATETIME(6)")
    private LocalDateTime updatedAt;

    @Column(name = "last_analysis_at", columnDefinition = "DATETIME(6)")
    private LocalDateTime lastAnalysisAt; // 마지막 분석 시간

    public void incrementVersion() {
        this.profileVersion = this.profileVersion == null ? 1 : this.profileVersion + 1;
    }
}
