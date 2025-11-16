package com.problemservice.ProblemService.repository;

import com.problemservice.ProblemService.model.entity.UserProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserProfileRepository extends JpaRepository<UserProfile, Long> {
    
    /**
     * userId로 사용자 프로필 조회
     * @param userId 사용자 ID
     * @return 사용자 프로필
     */
    Optional<UserProfile> findByUserId(String userId);
    
    /**
     * userId 존재 여부 확인
     * @param userId 사용자 ID
     * @return 존재 여부
     */
    boolean existsByUserId(String userId);
}

