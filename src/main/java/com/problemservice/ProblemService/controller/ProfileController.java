package com.problemservice.ProblemService.controller;

import com.problemservice.ProblemService.model.entity.UserProfile;
import com.problemservice.ProblemService.service.UserProfileService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 사용자 프로필 API 컨트롤러
 * 사용자의 학습 프로필 정보, 약점 분석, 추천 정보를 제공
 */
@RestController
@RequestMapping("/api/profile")
@RequiredArgsConstructor
public class ProfileController {

    private final UserProfileService userProfileService;

    /**
     * 내 학습 프로필 조회
     * 
     * @param authentication 인증 정보
     * @return 사용자 프로필 (UserService 설정 + LearningAnalysis 결과 통합)
     */
    @GetMapping("/analysis")
    public ResponseEntity<UserProfile> getMyLearningProfile(Authentication authentication) {
        String userId = (String) authentication.getPrincipal();
        UserProfile profile = userProfileService.getUserProfile(userId);
        
        if (profile == null) {
            return ResponseEntity.notFound().build();
        }
        
        return ResponseEntity.ok(profile);
    }

    /**
     * 내 약점 카테고리 추천
     * 
     * @param authentication 인증 정보
     * @return 약점 카테고리 리스트
     */
    @GetMapping("/weak-categories")
    public ResponseEntity<List<String>> getMyWeakCategories(Authentication authentication) {
        String userId = (String) authentication.getPrincipal();
        List<String> weakCategories = userProfileService.getWeakCategories(userId);
        return ResponseEntity.ok(weakCategories);
    }

    /**
     * 내 추천 문제 ID 조회
     * 
     * @param authentication 인증 정보
     * @return 추천 문제 ID 리스트
     */
    @GetMapping("/recommended-questions")
    public ResponseEntity<List<String>> getMyRecommendedQuestions(Authentication authentication) {
        String userId = (String) authentication.getPrincipal();
        List<String> recommendedQuestionIds = userProfileService.getRecommendedQuestionIds(userId);
        return ResponseEntity.ok(recommendedQuestionIds);
    }

    /**
     * 내가 선택한 카테고리 조회
     * 
     * @param authentication 인증 정보
     * @return 선택한 카테고리 리스트
     */
    @GetMapping("/selected-categories")
    public ResponseEntity<List<String>> getMySelectedCategories(Authentication authentication) {
        String userId = (String) authentication.getPrincipal();
        List<String> selectedCategories = userProfileService.getSelectedCategories(userId);
        return ResponseEntity.ok(selectedCategories);
    }
}
