package com.problemservice.ProblemService.repository;

import com.problemservice.ProblemService.model.entity.UserLearningProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface UserLearningProfileRepository extends JpaRepository<UserLearningProfile, Long> {
    Optional<UserLearningProfile> findByUserId(String userId);
}
