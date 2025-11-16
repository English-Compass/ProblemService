package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.dto.CompleteLearningAnalysis;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionType;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.model.enums.Difficulty;
import com.problemservice.ProblemService.model.enums.LearningPattern;
import com.problemservice.ProblemService.model.enums.QuestionType;
import com.problemservice.ProblemService.repository.QuestionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

/**
 * 실시간 학습 분석 데이터를 기반으로 한 문제 할당 서비스
 * Kafka 이벤트로 받은 분석 결과를 즉시 처리하여 사용자별 최적화된 문제를 선택
 * 
 * 사용자 프로필 정보:
 * - UserService로부터: difficultyLevel, selectedCategories (DB에 저장)
 * - LearningAnalysisService로부터: 약점 분석, 추천 문제 (메모리 + DB에 저장)
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class QuestionAssignmentService {
    
    private final QuestionRepository questionRepository;
    private final UserProfileService userProfileService; // TODO: DB fallback 로직 추가 예정
    
    // 사용자별 학습 분석 프로필 (메모리 캐시, 성능 최적화)
    // DB의 UserProfile은 영구 저장용, 메모리 캐시는 빠른 문제 선택용
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
                .recommendedReviewQuestionIds(new HashSet<>(analysisData.getRecommendedReviewQuestions())) // 향후 개인화된 복습 문제 추천에 사용 예정
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
        log.info("selectOptimalQuestions: userId={}, sessionType={}, categories={}, count={}, hasProfile={}",
            userId, sessionType, categories, questionCount, profile != null);
        
        if (profile == null) {
            // 프로필이 없으면 사용자 설정 기반으로만 선택 (연습 세션의 경우 풀지 않은 문제만)
            log.debug("No learning profile found for user: {}, using default strategy", userId);
            if (sessionType == SessionType.PRACTICE) {
                return selectDefaultPracticeQuestions(userId, categories, questionCount, userPreferredDifficulty);
            }
            return selectDefaultQuestions(categories, questionCount, userPreferredDifficulty);
        }
        
        // 세션 타입별 문제 선택
        switch (sessionType) {
            case PRACTICE:
                return selectPracticeQuestions(profile, categories, questionCount, userPreferredDifficulty);
            case REVIEW:
                return selectReviewQuestions(profile, categories, questionCount, userPreferredDifficulty);
            case WRONG_ANSWER:
                List<Question> wa = selectWrongAnswerQuestions(profile, categories, questionCount, userPreferredDifficulty);
                try {
                    System.out.println("WRONG_ANSWER picked IDs: " + wa.stream().map(Question::getQuestionId).collect(Collectors.toList()));
                } catch (Exception ignore) { }
                return wa;
            default:
                return selectDefaultQuestions(categories, questionCount, userPreferredDifficulty);
        }
    }
    
    /**
     * 연습 세션용 문제 선택 (사용자가 풀지 않은 문제만, 사용자 선택 난이도와 카테고리만 사용)
     */
    private List<Question> selectPracticeQuestions(UserLearningProfile profile, List<String> categories, 
                                                  int questionCount, Difficulty userPreferredDifficulty) {
        
        String userId = profile.getUserId();
        Integer difficultyLevel = userPreferredDifficulty.getLevel();
        
        // 중복 방지를 위해 최근 3일 동안 출제된 문제 제외
        LocalDateTime recentCutoff = LocalDateTime.now().minusDays(3);
        
        // 최근 출제된 문제를 제외하고 조회 시도
        List<Question> unsolvedQuestions = questionRepository.findUnsolvedQuestionsExcludingRecent(
            userId, categories, difficultyLevel, recentCutoff);
        
        // 최근 제외 조회에서 충분한 문제가 없으면 기본 조회 사용
        if (unsolvedQuestions.size() < questionCount) {
            log.debug("최근 제외 조회에서 문제 부족, 기본 조회로 전환: userId={}, available={}, required={}", 
                userId, unsolvedQuestions.size(), questionCount);
            unsolvedQuestions = questionRepository.findUnsolvedQuestionsByUserAndCategoriesAndDifficulty(
                userId, categories, difficultyLevel);
        }
        
        // 데이터베이스에서 이미 랜덤 정렬되어 반환되므로 바로 제한된 수만큼 반환
        return unsolvedQuestions.stream()
            .limit(questionCount)
            .collect(Collectors.toList());
    }
    
    /**
     * 복습 세션용 문제 선택 (취약 유형 우선, 사용자 선택 난이도만 사용)
     */
    private List<Question> selectReviewQuestions(UserLearningProfile profile, List<String> categories, 
                                                int questionCount, Difficulty userPreferredDifficulty) {
        
        List<Question> reviewQuestions = new ArrayList<>();
        
        // 1. 취약 유형 문제를 60% 비율로 포함
        if (!profile.getWeakQuestionTypes().isEmpty()) {
            int weakCount = (int)(questionCount * 0.6);
            reviewQuestions.addAll(selectWeakAreaQuestions(profile.getWeakQuestionTypes(), 
                categories, weakCount, userPreferredDifficulty));
        }
        
        // 2. 나머지는 사용자 선택 난이도로만 선택
        int remainingCount = questionCount - reviewQuestions.size();
        if (remainingCount > 0) {
            reviewQuestions.addAll(selectQuestionsByUserDifficulty(categories, remainingCount, userPreferredDifficulty));
        }
        
        return reviewQuestions;
    }
    
    /**
     * 오답노트 세션용 문제 선택 (오답 문제 + 취약 유형, 사용자 선택 난이도만 사용)
     */
    private List<Question> selectWrongAnswerQuestions(UserLearningProfile profile, List<String> categories, 
                                                     int questionCount, Difficulty userPreferredDifficulty) {
        
        List<Question> wrongAnswerQuestions = new ArrayList<>();
        
        // 1. 오답 문제를 70% 비율로 포함 (ID 우선 포함 보장)
        if (!profile.getWrongQuestionIds().isEmpty()) {
            int wrongCount = (int) Math.ceil(questionCount * 0.7);
            if (wrongCount <= 0 && questionCount > 0) wrongCount = 1;
            wrongCount = Math.min(wrongCount, profile.getWrongQuestionIds().size());

            // ID 기반으로 우선 조회하여 포함 보장
            List<Question> wrongQuestionsById = profile.getWrongQuestionIds().stream()
                .map(qid -> questionRepository.findById(qid).orElse(null))
                .filter(Objects::nonNull)
                .collect(Collectors.toList());

            // 카테고리 필터가 있는 경우 적용하되, 오답 ID 포함을 우선시
            List<Question> filtered = wrongQuestionsById;
            if (categories != null && !categories.isEmpty()) {
                List<String> categorySet = new ArrayList<>(categories);
                filtered = wrongQuestionsById.stream()
                    .filter(q -> categorySet.contains(q.getMajorCategory()))
                    .collect(Collectors.toList());

                // 카테고리 필터링 후 결과가 비어있다면 카테고리 제한 없이 오답 ID 포함
                if (filtered.isEmpty()) {
                    filtered = wrongQuestionsById;
                }
            }

            // 추가 랜덤성을 위해 섞은 후 제한된 수만큼 선택
            Collections.shuffle(filtered);
            wrongAnswerQuestions.addAll(filtered.stream().limit(wrongCount).collect(Collectors.toList()));
        }
        
        // 2. 취약 유형 문제로 나머지 채우기 (30%)
        int remainingCount = questionCount - wrongAnswerQuestions.size();
        if (remainingCount > 0 && !profile.getWeakQuestionTypes().isEmpty()) {
            wrongAnswerQuestions.addAll(selectWeakAreaQuestions(profile.getWeakQuestionTypes(), 
                categories, remainingCount, userPreferredDifficulty));
        }
        
        return wrongAnswerQuestions;
    }
    
    /**
     * 취약 영역 문제 선택 (사용자 선택 난이도만 사용)
     */
    private List<Question> selectWeakAreaQuestions(Set<QuestionType> weakTypes, List<String> categories, 
                                                  int count, Difficulty userPreferredDifficulty) {
        List<Question> weakQuestions = new ArrayList<>();
        Integer difficultyLevel = userPreferredDifficulty.getLevel();
        
        for (QuestionType weakType : weakTypes) {
            String questionTypeStr = weakType.name().toLowerCase();
            List<Question> typeQuestions = questionRepository.findByMajorCategoryInAndQuestionTypeAndDifficultyLevel(
                categories, questionTypeStr, difficultyLevel);
            
            int questionsPerType = count / weakTypes.size();
            weakQuestions.addAll(typeQuestions.stream().limit(questionsPerType).collect(Collectors.toList()));
        }
        
        return weakQuestions;
    }
    
    /**
     * 사용자 선택 난이도에 따른 문제 선택
     */
    private List<Question> selectQuestionsByUserDifficulty(List<String> categories, int count, Difficulty userPreferredDifficulty) {
        Integer difficultyLevel = userPreferredDifficulty.getLevel();
        List<Question> questions = questionRepository.findByMajorCategoryInAndDifficultyLevel(categories, difficultyLevel);
        
        return questions.stream()
            .limit(count)
            .collect(Collectors.toList());
    }
    
    /**
     * 기본 연습 세션용 문제 선택 (프로필이 없는 경우, 풀지 않은 문제만)
     */
    private List<Question> selectDefaultPracticeQuestions(String userId, List<String> categories, int questionCount, Difficulty userPreferredDifficulty) {
        Integer difficultyLevel = userPreferredDifficulty.getLevel();
        
        // 중복 방지를 위해 최근 3일 동안 출제된 문제 제외
        LocalDateTime recentCutoff = LocalDateTime.now().minusDays(3);
        
        // 최근 출제된 문제를 제외하고 조회 시도
        List<Question> unsolvedQuestions = questionRepository.findUnsolvedQuestionsExcludingRecent(
            userId, categories, difficultyLevel, recentCutoff);
        
        // 최근 제외 조회에서 충분한 문제가 없으면 기본 조회 사용
        if (unsolvedQuestions.size() < questionCount) {
            unsolvedQuestions = questionRepository.findUnsolvedQuestionsByUserAndCategoriesAndDifficulty(
                userId, categories, difficultyLevel);
        }
        
        // 데이터베이스에서 이미 랜덤 정렬되어 반환되므로 바로 제한된 수만큼 반환
        return unsolvedQuestions.stream()
            .limit(questionCount)
            .collect(Collectors.toList());
    }
    
    /**
     * 기본 문제 선택 (프로필이 없는 경우, 사용자 선택 난이도만 사용)
     */
    private List<Question> selectDefaultQuestions(List<String> categories, int questionCount, Difficulty userPreferredDifficulty) {
        return selectQuestionsByUserDifficulty(categories, questionCount, userPreferredDifficulty);
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
        private Set<String> recommendedReviewQuestionIds; // 향후 개인화된 복습 문제 추천에 사용 예정
        private Set<String> focusAreas;
        private long lastUpdated; // 프로필 업데이트 시간 추적용 (향후 만료 정책에 사용)
    }
}