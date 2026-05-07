package com.problemservice.ProblemService.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.problemservice.ProblemService.model.dto.CompleteLearningAnalysis;
import com.problemservice.ProblemService.model.dto.UserProfileEvent;
import com.problemservice.ProblemService.model.entity.UserProfile;
import com.problemservice.ProblemService.repository.UserProfileRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 사용자 프로필 관리 서비스
 * UserService로부터 받은 이벤트와 LearningAnalysisService로부터 받은 분석 결과를 통합 관리
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class UserProfileService {

    private final UserProfileRepository userProfileRepository;
    private final ObjectMapper objectMapper;

    /**
     * UserService로부터 받은 프로필 이벤트 처리
     * @param event 사용자 프로필 이벤트
     */
    @Transactional
    public void handleUserProfileEvent(UserProfileEvent event) {
        String userId = event.getUserId();
        String eventType = event.getEventType();

        log.info("Processing user profile event: type={}, userId={}", eventType, userId);

        try {
            switch (eventType) {
                case "PROFILE_CREATED":
                case "PROFILE_UPDATED":
                    createOrUpdateProfile(event);
                    break;
                case "DIFFICULTY":
                    updateDifficulty(event);
                    break;
                case "CATEGORIES":
                    updateCategories(event);
                    break;
                case "PROFILE_DELETED":
                    deleteProfile(userId);
                    break;
                default:
                    log.warn("Unknown event type: {} for userId: {}", eventType, userId);
            }
        } catch (Exception e) {
            log.error("Failed to handle user profile event for userId: {}", userId, e);
            throw new RuntimeException("Failed to process user profile event", e);
        }
    }

    /**
     * 프로필 생성 또는 업데이트
     */
    private void createOrUpdateProfile(UserProfileEvent event) {
        String userId = event.getUserId();
        
        UserProfile profile = userProfileRepository.findByUserId(userId)
                .orElse(UserProfile.builder().userId(userId).build());

        // UserService로부터 받은 정보 업데이트
        // difficulty와 difficultyLevel 모두 지원 (하위 호환성)
        Integer difficulty = event.getDifficulty() != null ? event.getDifficulty() : event.getDifficultyLevel();
        profile.setDifficultyLevel(difficulty);
        
        try {
            // categories (Map) 또는 selectedCategories (List) 모두 지원
            if (event.getCategories() != null && !event.getCategories().isEmpty()) {
                // Map을 JSON으로 저장
                profile.setSelectedCategories(objectMapper.writeValueAsString(event.getCategories()));
            } else if (event.getSelectedCategories() != null && !event.getSelectedCategories().isEmpty()) {
                // List를 JSON으로 저장
                profile.setSelectedCategories(objectMapper.writeValueAsString(event.getSelectedCategories()));
            }
            
            if (event.getPreferredQuestionTypes() != null) {
                profile.setPreferredQuestionTypes(objectMapper.writeValueAsString(event.getPreferredQuestionTypes()));
            }
        } catch (JsonProcessingException e) {
            log.error("Failed to serialize profile data for userId: {}", userId, e);
            throw new RuntimeException("Failed to serialize profile data", e);
        }

        profile.incrementVersion();
        userProfileRepository.save(profile);

        log.info("User profile updated for userId: {}, version: {}", userId, profile.getProfileVersion());
    }

    /**
     * 난이도만 업데이트 (DIFFICULTY 이벤트)
     */
    private void updateDifficulty(UserProfileEvent event) {
        String userId = event.getUserId();
        Integer difficulty = event.getDifficulty() != null ? event.getDifficulty() : event.getDifficultyLevel();
        
        if (difficulty == null) {
            log.warn("Difficulty event received but difficulty is null for userId: {}", userId);
            return;
        }

        UserProfile profile = userProfileRepository.findByUserId(userId)
                .orElse(UserProfile.builder().userId(userId).build());

        profile.setDifficultyLevel(difficulty);
        profile.incrementVersion();
        userProfileRepository.save(profile);

        log.info("Difficulty updated for userId: {}, difficulty: {}", userId, difficulty);
    }

    /**
     * 카테고리만 업데이트 (CATEGORIES 이벤트)
     */
    private void updateCategories(UserProfileEvent event) {
        String userId = event.getUserId();
        
        UserProfile profile = userProfileRepository.findByUserId(userId)
                .orElse(UserProfile.builder().userId(userId).build());

        try {
            // categories (Map) 또는 selectedCategories (List) 모두 지원
            if (event.getCategories() != null && !event.getCategories().isEmpty()) {
                // Map을 JSON으로 저장
                profile.setSelectedCategories(objectMapper.writeValueAsString(event.getCategories()));
            } else if (event.getSelectedCategories() != null && !event.getSelectedCategories().isEmpty()) {
                // List를 JSON으로 저장
                profile.setSelectedCategories(objectMapper.writeValueAsString(event.getSelectedCategories()));
            } else {
                log.warn("Categories event received but categories is null/empty for userId: {}", userId);
                return;
            }
        } catch (JsonProcessingException e) {
            log.error("Failed to serialize categories for userId: {}", userId, e);
            throw new RuntimeException("Failed to serialize categories", e);
        }

        profile.incrementVersion();
        userProfileRepository.save(profile);

        log.info("Categories updated for userId: {}, categories: {}", userId, profile.getSelectedCategories());
    }

    /**
     * 프로필 삭제
     */
    private void deleteProfile(String userId) {
        userProfileRepository.findByUserId(userId).ifPresent(profile -> {
            userProfileRepository.delete(profile);
            log.info("User profile deleted for userId: {}", userId);
        });
    }

    /**
     * LearningAnalysisService로부터 받은 분석 결과로 프로필 업데이트
     * @param userId 사용자 ID
     * @param analysisData 학습 분석 데이터
     */
    @Transactional
    public void updateProfileWithAnalysis(String userId, CompleteLearningAnalysis analysisData) {
        log.info("Updating profile with analysis data for userId: {}", userId);

        UserProfile profile = userProfileRepository.findByUserId(userId)
                .orElse(UserProfile.builder().userId(userId).build());

        try {
            // 분석 결과 업데이트
            if (analysisData.getWeakQuestionTypes() != null && !analysisData.getWeakQuestionTypes().isEmpty()) {
                List<String> weakTypes = analysisData.getWeakQuestionTypes().stream()
                        .map(Enum::name)
                        .toList();
                profile.setWeakQuestionTypes(objectMapper.writeValueAsString(weakTypes));
            }

            if (analysisData.getRecommendedReviewQuestions() != null) {
                profile.setRecommendedQuestionIds(objectMapper.writeValueAsString(analysisData.getRecommendedReviewQuestions()));
            }

            if (analysisData.getFocusAreas() != null) {
                profile.setFocusAreas(objectMapper.writeValueAsString(analysisData.getFocusAreas()));
            }

            profile.setConsistencyScore(analysisData.getConsistencyScore());
            profile.setOverallLearningPattern(analysisData.getOverallLearningPattern() != null ? 
                    analysisData.getOverallLearningPattern().name() : null);
            profile.setAverageTimePerQuestion(analysisData.getAverageTimePerQuestion());
            profile.setLastAnalysisAt(LocalDateTime.now());

            profile.incrementVersion();
            userProfileRepository.save(profile);

            log.info("Profile analysis data updated for userId: {}, pattern: {}, consistency: {}", 
                    userId, profile.getOverallLearningPattern(), profile.getConsistencyScore());

        } catch (JsonProcessingException e) {
            log.error("Failed to serialize analysis data for userId: {}", userId, e);
            throw new RuntimeException("Failed to update profile with analysis data", e);
        }
    }

    /**
     * 사용자 프로필 조회
     * @param userId 사용자 ID
     * @return 사용자 프로필
     */
    @Transactional(readOnly = true)
    public UserProfile getUserProfile(String userId) {
        return userProfileRepository.findByUserId(userId)
                .orElse(null);
    }

    /**
     * 사용자의 선택된 카테고리 조회 (JSON 파싱)
     * @param userId 사용자 ID
     * @return 카테고리 리스트
     */
    @Transactional(readOnly = true)
    public List<String> getSelectedCategories(String userId) {
        UserProfile profile = getUserProfile(userId);
        if (profile == null || profile.getSelectedCategories() == null) {
            return List.of();
        }

        try {
            return objectMapper.readValue(profile.getSelectedCategories(), 
                    objectMapper.getTypeFactory().constructCollectionType(List.class, String.class));
        } catch (JsonProcessingException e) {
            log.error("Failed to parse selected categories for userId: {}", userId, e);
            return List.of();
        }
    }

    /**
     * 사용자의 약점 카테고리 조회 (JSON 파싱)
     * @param userId 사용자 ID
     * @return 약점 카테고리 리스트
     */
    @Transactional(readOnly = true)
    public List<String> getWeakCategories(String userId) {
        UserProfile profile = getUserProfile(userId);
        if (profile == null || profile.getWeakCategories() == null) {
            return List.of();
        }

        try {
            return objectMapper.readValue(profile.getWeakCategories(), 
                    objectMapper.getTypeFactory().constructCollectionType(List.class, String.class));
        } catch (JsonProcessingException e) {
            log.error("Failed to parse weak categories for userId: {}", userId, e);
            return List.of();
        }
    }

    /**
     * 사용자의 추천 문제 ID 조회 (JSON 파싱)
     * @param userId 사용자 ID
     * @return 추천 문제 ID 리스트
     */
    @Transactional(readOnly = true)
    public List<String> getRecommendedQuestionIds(String userId) {
        UserProfile profile = getUserProfile(userId);
        if (profile == null || profile.getRecommendedQuestionIds() == null) {
            return List.of();
        }

        try {
            return objectMapper.readValue(profile.getRecommendedQuestionIds(), 
                    objectMapper.getTypeFactory().constructCollectionType(List.class, String.class));
        } catch (JsonProcessingException e) {
            log.error("Failed to parse recommended question IDs for userId: {}", userId, e);
            return List.of();
        }
    }
}

