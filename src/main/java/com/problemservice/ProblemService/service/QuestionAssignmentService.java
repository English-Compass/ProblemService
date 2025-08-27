package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.dto.CompleteLearningAnalysis;
import com.problemservice.ProblemService.model.dto.DifficultyStrategy;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionType;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.model.enums.Difficulty;
import com.problemservice.ProblemService.model.enums.LearningPattern;
import com.problemservice.ProblemService.model.enums.QuestionType;
import com.problemservice.ProblemService.repository.QuestionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

/**
 * 실시간 학습 분석 데이터를 기반으로 한 문제 할당 서비스
 * Kafka 이벤트로 받은 분석 결과를 즉시 처리하여 사용자별 최적화된 문제를 선택
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class QuestionAssignmentService {
    
    private final QuestionRepository questionRepository;
    
    // 사용자별 학습 프로필 (메모리 저장)
    private final Map<String, UserLearningProfile> userProfiles = new ConcurrentHashMap<>();
    
    /**
     * Kafka 이벤트로 받은 분석 데이터를 바탕으로 사용자 학습 프로필을 실시간 업데이트
     * @param userId 사용자 ID
     * @param analysisData 학습 분석 데이터
     */
    public void updateUserLearningProfile(String userId, CompleteLearningAnalysis analysisData) {
        try {
            UserLearningProfile profile = UserLearningProfile.builder()
                .userId(userId)
                .learningPattern(analysisData.getOverallLearningPattern())
                .consistencyScore(analysisData.getConsistencyScore())
                .averageTimePerQuestion(analysisData.getAverageTimePerQuestion())
                .weakQuestionTypes(new HashSet<>(analysisData.getWeakQuestionTypes()))
                .wrongQuestionIds(new HashSet<>(analysisData.getWrongQuestionIds()))
                .recommendedReviewQuestionIds(new HashSet<>(analysisData.getRecommendedReviewQuestions()))
                .focusAreas(new HashSet<>(analysisData.getFocusAreas()))
                .lastUpdated(System.currentTimeMillis())
                .build();
            
            userProfiles.put(userId, profile);
            
            log.info("Updated learning profile for user: {}, pattern: {}, weak types: {}", 
                userId, profile.getLearningPattern(), profile.getWeakQuestionTypes());
                
        } catch (Exception e) {
            log.error("Failed to update learning profile for user: {}", userId, e);
        }
    }
    
    /**
     * 사용자의 학습 분석 데이터와 난이도 설정을 기반으로 최적화된 문제를 선택
     * @param userId 사용자 ID
     * @param categories 선택할 카테고리 목록
     * @param questionCount 선택할 문제 수
     * @param sessionType 세션 유형
     * @param userPreferredDifficulty 사용자 선호 난이도
     * @return 선택된 문제 목록
     */
    public List<Question> selectOptimalQuestions(String userId, List<String> categories, 
                                                int questionCount, SessionType sessionType, 
                                                Difficulty userPreferredDifficulty) {
        
        UserLearningProfile profile = userProfiles.get(userId);
        
        if (profile == null) {
            // 프로필이 없으면 사용자 설정 기반으로만 선택
            log.debug("No learning profile found for user: {}, using default strategy", userId);
            return selectDefaultQuestions(categories, questionCount, userPreferredDifficulty);
        }
        
        // 세션 타입별 문제 선택
        switch (sessionType) {
            case PRACTICE:
                return selectPracticeQuestions(profile, categories, questionCount, userPreferredDifficulty);
            case REVIEW:
                return selectReviewQuestions(profile, categories, questionCount, userPreferredDifficulty);
            case WRONG_ANSWER:
                return selectWrongAnswerQuestions(profile, categories, questionCount, userPreferredDifficulty);
            default:
                return selectDefaultQuestions(categories, questionCount, userPreferredDifficulty);
        }
    }
    
    /**
     * 연습 세션용 문제 선택 (분석 데이터 + 사용자 선호도 조합)
     */
    private List<Question> selectPracticeQuestions(UserLearningProfile profile, List<String> categories, 
                                                  int questionCount, Difficulty userPreferredDifficulty) {
        
        DifficultyStrategy strategy = determineDifficultyStrategy(profile, userPreferredDifficulty);
        List<Question> selectedQuestions = new ArrayList<>();
        
        // 1. 취약 영역 우선 할당 (40%)
        if (!profile.getWeakQuestionTypes().isEmpty()) {
            int weakAreaCount = (int) (questionCount * 0.4);
            selectedQuestions.addAll(selectWeakAreaQuestions(profile.getWeakQuestionTypes(), 
                categories, weakAreaCount, strategy));
        }
        
        // 2. 나머지는 난이도 전략에 따라 선택
        int remainingCount = questionCount - selectedQuestions.size();
        if (remainingCount > 0) {
            selectedQuestions.addAll(selectQuestionsByDifficultyStrategy(categories, remainingCount, strategy));
        }
        
        return selectedQuestions;
    }
    
    /**
     * 복습 세션용 문제 선택 (추천 복습 문제 활용)
     */
    private List<Question> selectReviewQuestions(UserLearningProfile profile, List<String> categories, 
                                                int questionCount, Difficulty userPreferredDifficulty) {
        
        List<Question> reviewQuestions = new ArrayList<>();
        
        // 1. 추천 복습 문제를 60% 비율로 포함
        if (!profile.getRecommendedReviewQuestionIds().isEmpty()) {
            int recommendedCount = Math.min((int)(questionCount * 0.6), profile.getRecommendedReviewQuestionIds().size());
            List<Question> recommended = questionRepository.findByQuestionIdInAndMajorCategoryIn(
                new ArrayList<>(profile.getRecommendedReviewQuestionIds()), categories);
            
            reviewQuestions.addAll(recommended.stream().limit(recommendedCount).collect(Collectors.toList()));
        }
        
        // 2. 집중 학습 영역의 문제로 나머지 채우기
        int remainingCount = questionCount - reviewQuestions.size();
        if (remainingCount > 0 && !profile.getFocusAreas().isEmpty()) {
            List<String> focusCategories = categories.stream()
                .filter(profile.getFocusAreas()::contains)
                .collect(Collectors.toList());
            
            if (!focusCategories.isEmpty()) {
                List<Question> focusQuestions = questionRepository.findByMajorCategoryIn(focusCategories);
                reviewQuestions.addAll(focusQuestions.stream().limit(remainingCount).collect(Collectors.toList()));
            }
        }
        
        return reviewQuestions;
    }
    
    /**
     * 오답노트 세션용 문제 선택 (오답 문제 + 취약 유형)
     */
    private List<Question> selectWrongAnswerQuestions(UserLearningProfile profile, List<String> categories, 
                                                     int questionCount, Difficulty userPreferredDifficulty) {
        
        List<Question> wrongAnswerQuestions = new ArrayList<>();
        
        // 1. 오답 문제를 70% 비율로 포함
        if (!profile.getWrongQuestionIds().isEmpty()) {
            int wrongCount = Math.min((int)(questionCount * 0.7), profile.getWrongQuestionIds().size());
            List<Question> wrongQuestions = questionRepository.findByQuestionIdInAndMajorCategoryIn(
                new ArrayList<>(profile.getWrongQuestionIds()), categories);
            
            wrongAnswerQuestions.addAll(wrongQuestions.stream().limit(wrongCount).collect(Collectors.toList()));
        }
        
        // 2. 취약 유형의 쉬운 문제로 나머지 채우기 (30%)
        int remainingCount = questionCount - wrongAnswerQuestions.size();
        if (remainingCount > 0 && !profile.getWeakQuestionTypes().isEmpty()) {
            wrongAnswerQuestions.addAll(selectWeakAreaQuestions(profile.getWeakQuestionTypes(), 
                categories, remainingCount, DifficultyStrategy.of(0.8, 0.2, 0.0))); // 쉬운 문제 위주
        }
        
        return wrongAnswerQuestions;
    }
    
    /**
     * 사용자 설정과 분석 데이터를 결합한 난이도 전략 결정
     */
    private DifficultyStrategy determineDifficultyStrategy(UserLearningProfile profile, Difficulty userPreferredDifficulty) {
        LearningPattern pattern = profile.getLearningPattern();
        
        switch (userPreferredDifficulty) {
            case A: // 초급자 설정
                if (pattern == LearningPattern.EXCELLENT) {
                    return DifficultyStrategy.of(0.6, 0.3, 0.1); // 점진적 향상
                } else if (pattern == LearningPattern.NEEDS_IMPROVEMENT) {
                    return DifficultyStrategy.of(0.8, 0.2, 0.0); // 기초 집중
                }
                return DifficultyStrategy.of(0.7, 0.3, 0.0);
                
            case B: // 중급자 설정
                if (pattern == LearningPattern.EXCELLENT) {
                    return DifficultyStrategy.of(0.2, 0.5, 0.3); // 도전 증가
                } else if (pattern == LearningPattern.NEEDS_IMPROVEMENT) {
                    return DifficultyStrategy.of(0.5, 0.5, 0.0); // 기초 보강 후 중급
                }
                return DifficultyStrategy.of(0.3, 0.5, 0.2);
                
            case C: // 고급자 설정
                if (pattern == LearningPattern.EXCELLENT) {
                    return DifficultyStrategy.of(0.1, 0.3, 0.6); // 최고 난이도 집중
                } else if (pattern == LearningPattern.NEEDS_IMPROVEMENT) {
                    return DifficultyStrategy.of(0.4, 0.4, 0.2); // 단계적 접근
                }
                return DifficultyStrategy.of(0.2, 0.4, 0.4);
                
            default:
                return DifficultyStrategy.of(0.4, 0.4, 0.2);
        }
    }
    
    /**
     * 취약 영역 문제 선택
     */
    private List<Question> selectWeakAreaQuestions(Set<QuestionType> weakTypes, List<String> categories, 
                                                  int count, DifficultyStrategy strategy) {
        List<Question> weakQuestions = new ArrayList<>();
        
        for (QuestionType weakType : weakTypes) {
            String questionTypeStr = weakType.name().toLowerCase();
            List<Question> typeQuestions = questionRepository.findByMajorCategoryInAndQuestionType(categories, questionTypeStr);
            
            int questionsPerType = count / weakTypes.size();
            weakQuestions.addAll(typeQuestions.stream().limit(questionsPerType).collect(Collectors.toList()));
        }
        
        return weakQuestions;
    }
    
    /**
     * 난이도 전략에 따른 문제 선택
     */
    private List<Question> selectQuestionsByDifficultyStrategy(List<String> categories, int count, DifficultyStrategy strategy) {
        List<Question> selectedQuestions = new ArrayList<>();
        
        // A 난이도 문제 선택
        int easyCount = (int) (count * strategy.getEasyRatio());
        if (easyCount > 0) {
            List<Question> easyQuestions = questionRepository.findByMajorCategoryInAndDifficultyLevel(categories, 1);
            selectedQuestions.addAll(easyQuestions.stream().limit(easyCount).collect(Collectors.toList()));
        }
        
        // B 난이도 문제 선택
        int mediumCount = (int) (count * strategy.getMediumRatio());
        if (mediumCount > 0) {
            List<Question> mediumQuestions = questionRepository.findByMajorCategoryInAndDifficultyLevel(categories, 2);
            selectedQuestions.addAll(mediumQuestions.stream().limit(mediumCount).collect(Collectors.toList()));
        }
        
        // C 난이도 문제 선택
        int hardCount = count - selectedQuestions.size(); // 나머지
        if (hardCount > 0) {
            List<Question> hardQuestions = questionRepository.findByMajorCategoryInAndDifficultyLevel(categories, 3);
            selectedQuestions.addAll(hardQuestions.stream().limit(hardCount).collect(Collectors.toList()));
        }
        
        return selectedQuestions;
    }
    
    /**
     * 기본 문제 선택 (프로필이 없는 경우)
     */
    private List<Question> selectDefaultQuestions(List<String> categories, int questionCount, Difficulty userPreferredDifficulty) {
        DifficultyStrategy defaultStrategy = DifficultyStrategy.builder()
            .primaryDifficulty(userPreferredDifficulty)
            .easyRatio(0.4)
            .mediumRatio(0.4)
            .hardRatio(0.2)
            .build();
        
        return selectQuestionsByDifficultyStrategy(categories, questionCount, defaultStrategy);
    }
    
    /**
     * 사용자 학습 프로필을 나타내는 내부 클래스
     */
    @lombok.Data
    @lombok.Builder
    @lombok.AllArgsConstructor
    @lombok.NoArgsConstructor
    private static class UserLearningProfile {
        private String userId;
        private LearningPattern learningPattern;
        private double consistencyScore;
        private double averageTimePerQuestion;
        private Set<QuestionType> weakQuestionTypes;
        private Set<String> wrongQuestionIds;
        private Set<String> recommendedReviewQuestionIds;
        private Set<String> focusAreas;
        private long lastUpdated;
    }
}