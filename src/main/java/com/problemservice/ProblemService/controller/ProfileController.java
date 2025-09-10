package com.problemservice.ProblemService.controller;

import com.problemservice.ProblemService.model.entity.UserLearningProfile;
import com.problemservice.ProblemService.repository.UserLearningProfileRepository;
import com.problemservice.ProblemService.service.RecommendationService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/profile")
@RequiredArgsConstructor
public class ProfileController {

    private final UserLearningProfileRepository profileRepository;
    private final RecommendationService recommendationService;

    @GetMapping("/analysis")
    public ResponseEntity<UserLearningProfile> getMyLearningProfile(Authentication authentication) {
        String userId = (String) authentication.getPrincipal();
        return profileRepository.findByUserId(userId)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/recommendations")
    public ResponseEntity<List<String>> getMyRecommendations(Authentication authentication) {
        String userId = (String) authentication.getPrincipal();
        List<String> recommendations = recommendationService.recommendWeakestCategories(userId);
        return ResponseEntity.ok(recommendations);
    }
}
