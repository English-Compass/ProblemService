package com.problemservice.ProblemService.controller;

import com.problemservice.ProblemService.model.entity.KafkaEventLog;
import com.problemservice.ProblemService.model.entity.UserProfile;
import com.problemservice.ProblemService.service.KafkaEventLogService;
import com.problemservice.ProblemService.service.UserProfileService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 사용자 프로필 API 컨트롤러
 * 사용자의 학습 프로필 정보, 약점 분석, 추천 정보를 제공
 */
@RestController
@RequestMapping("/problem/profile")
@RequiredArgsConstructor
public class ProfileController {

    private final UserProfileService userProfileService;
    private final KafkaEventLogService kafkaEventLogService;

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

    /**
     * 디버깅용: 사용자 프로필 이벤트 로그 조회
     * 
     * @param authentication 인증 정보
     * @return 사용자 프로필 관련 이벤트 로그
     */
    @GetMapping("/events")
    public ResponseEntity<List<KafkaEventLog>> getMyProfileEvents(Authentication authentication) {
        String userId = (String) authentication.getPrincipal();
        List<KafkaEventLog> events = kafkaEventLogService.getUserEvents(userId);
        return ResponseEntity.ok(events);
    }

    /**
     * 디버깅용: user-profile-events 토픽의 최근 이벤트 조회
     * 
     * @param limit 조회할 최대 이벤트 수 (기본값: 20)
     * @return 최근 user-profile-events 이벤트 로그
     */
    @GetMapping("/events/recent")
    public ResponseEntity<List<KafkaEventLog>> getRecentProfileEvents(@RequestParam(defaultValue = "20") int limit) {
        List<KafkaEventLog> events = kafkaEventLogService.getTopicEvents("user-profile-events", limit);
        return ResponseEntity.ok(events);
    }

    /**
     * 디버깅용: 이벤트 통계 조회
     * 
     * @return 이벤트 타입별 및 처리 상태별 통계
     */
    @GetMapping("/events/stats")
    public ResponseEntity<Map<String, Object>> getEventStatistics() {
        Map<String, Long> typeStats = kafkaEventLogService.getEventTypeStatistics();
        Map<String, Long> statusStats = kafkaEventLogService.getProcessingStatusStatistics();
        
        return ResponseEntity.ok(Map.of(
            "eventTypeStatistics", typeStats,
            "processingStatusStatistics", statusStats
        ));
    }
}
