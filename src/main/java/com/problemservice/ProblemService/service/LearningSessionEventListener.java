package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.dto.LearningCompletedEventDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.kafka.support.KafkaHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Objects;
import java.util.stream.Collectors;

import com.problemservice.ProblemService.model.dto.CompleteLearningAnalysis;

@Service
@RequiredArgsConstructor
@Slf4j
@ConditionalOnProperty(name = "spring.kafka.bootstrap-servers", matchIfMissing = false)
public class LearningSessionEventListener {

    private final LearningAnalysisService learningAnalysisService;
    private final QuestionAssignmentService questionAssignmentService;
    private final UserLearningProfileService userLearningProfileService;

    @KafkaListener(topics = "learning-session-completed", groupId = "problem-service-analytics-group")
    @Transactional
    public void handleLearningSessionCompleted(
            @Payload LearningCompletedEventDto event,
            @Header(KafkaHeaders.RECEIVED_TOPIC) String topic,
            @Header(KafkaHeaders.RECEIVED_PARTITION) int partition,
            @Header(KafkaHeaders.OFFSET) long offset,
            Acknowledgment acknowledgment
    ) {
        try {
            log.info("Received learning session completed event for session: {} from topic: {} partition: {} offset: {}",
                    event.getSessionId(), topic, partition, offset);

            // Process the session completion event
            processSessionCompletionEvent(event);

            // Acknowledge successful processing
            acknowledgment.acknowledge();
            log.info("Successfully processed learning session completed event for session: {}", event.getSessionId());

        } catch (Exception e) {
            log.error("Failed to process learning session completed event for session: {} from topic: {}",
                    event.getSessionId(), topic, e);
            // Don't acknowledge - message will be retried or sent to DLQ
        }
    }

    @KafkaListener(topics = "learning-question-answered", groupId = "problem-service-analytics-group")
    public void handleQuestionAnswered(
            @Payload Map<String, Object> eventData,
            @Header(KafkaHeaders.RECEIVED_TOPIC) String topic,
            @Header(KafkaHeaders.RECEIVED_PARTITION) int partition,
            @Header(KafkaHeaders.OFFSET) long offset,
            Acknowledgment acknowledgment
    ) {
        try {
            String sessionId = (String) eventData.get("sessionId");
            String questionId = (String) eventData.get("questionId");
            Boolean isCorrect = (Boolean) eventData.get("isCorrect");

            log.info("Received question answered event for question: {} in session: {} from topic: {} partition: {} offset: {}",
                    questionId, sessionId, topic, partition, offset);

            // Process the question answered event for real-time analytics
            processQuestionAnsweredEvent(eventData);

            acknowledgment.acknowledge();
            log.info("Successfully processed question answered event for question: {} in session: {}", questionId, sessionId);

        } catch (Exception e) {
            log.error("Failed to process question answered event from topic: {}", topic, e);
        }
    }

    @KafkaListener(topics = "learning-session-started", groupId = "problem-service-session-tracking-group")
    public void handleSessionStarted(
            @Payload Map<String, Object> eventData,
            @Header(KafkaHeaders.RECEIVED_TOPIC) String topic,
            Acknowledgment acknowledgment
    ) {
        try {
            String sessionId = (String) eventData.get("sessionId");
            String userId = (String) eventData.get("userId");

            log.info("Received session started event for session: {} user: {} from topic: {}",
                    sessionId, userId, topic);

            // Process session start for tracking purposes
            processSessionStartedEvent(eventData);

            acknowledgment.acknowledge();
            log.info("Successfully processed session started event for session: {}", sessionId);

        } catch (Exception e) {
            log.error("Failed to process session started event from topic: {}", topic, e);
        }
    }

    private void processSessionCompletionEvent(LearningCompletedEventDto event) {
        try {
            String sessionId = event.getSessionId();
            String userId = event.getUserId();
            log.info("Processing session completion analytics for session: {} user: {}", 
                    sessionId, userId);

            // metadata에서 분석 데이터 추출 (LearningSessionService와 동일한 패턴 사용)
            Map<String, Object> metadata = event.getMetadata();
            if (metadata != null) {
                // 1. CompleteLearningAnalysis 데이터가 metadata에 포함되어 있다면 저장
                Object analysisDataObj = metadata.get("analysisData");
                if (analysisDataObj != null) {
                    try {
                        // CompleteLearningAnalysis 객체로 변환 후 저장
                        CompleteLearningAnalysis analysisData = convertToAnalysisData(analysisDataObj, sessionId, userId);
                        
                        // 분석 데이터를 메모리 캐시에 저장
                        learningAnalysisService.saveAnalysisData(analysisData);
                        
                        // 사용자 학습 프로필 업데이트 (실시간 문제 추천을 위함)
                        questionAssignmentService.updateUserLearningProfile(userId, analysisData);
                        
                        log.info("Analysis data processed and saved for user: {}, sessionId: {}", userId, sessionId);
                        
                    } catch (Exception e) {
                        log.error("Failed to process analysis data for user: {}, sessionId: {}", userId, sessionId, e);
                    }
                } else {
                    log.debug("No analysis data found in metadata for user: {}, sessionId: {}", userId, sessionId);
                }
                
                // 2. 세션 타입별 추가 처리 (LearningSessionService와 일관성 유지)
                String sessionType = (String) metadata.get("sessionType");
                Integer totalQuestions = (Integer) metadata.get("totalQuestions");
                Integer correctAnswers = (Integer) metadata.get("correctAnswers");
                Integer wrongAnswers = (Integer) metadata.get("wrongAnswers");
                Double progressPercentage = (Double) metadata.get("progressPercentage");
                
                // 세션 완료 후 다음 세션 추천 로직 (향후 확장)
                processSessionRecommendation(userId, sessionType, correctAnswers, wrongAnswers);
            }
            
            // 3. 세션 완료 통계 로깅 (향후 분석용)
            logSessionCompletionStats(event);

            // 4. 사용자의 장기 학습 프로필 업데이트
            userLearningProfileService.updateUserProfile(userId);
            
        } catch (Exception e) {
            log.error("Failed to process session completion analytics for session: {} user: {}", 
                    event.getSessionId(), event.getUserId(), e);
        }
    }

    private void processQuestionAnsweredEvent(Map<String, Object> eventData) {
        try {
            String sessionId = (String) eventData.get("sessionId");
            String questionId = (String) eventData.get("questionId");
            String userId = (String) eventData.get("userId");
            Boolean isCorrect = (Boolean) eventData.get("isCorrect");
            Long responseTime = (Long) eventData.get("responseTime");
            String questionType = (String) eventData.get("questionType");
            
            log.debug("Processing real-time question analytics - Session: {}, Question: {}, User: {}, Correct: {}",
                    sessionId, questionId, userId, isCorrect);

            // 1. 실시간 문제 성능 추적 (로깅 기반)
            logQuestionPerformance(questionId, questionType, isCorrect, responseTime);
            
            // 2. 사용자 진행 상황 모니터링 (LearningSessionService의 updateSessionProgress와 연동)
            if (userId != null) {
                logUserProgress(userId, sessionId, questionId, isCorrect, responseTime);
                
                // 실시간 세션 통계 업데이트 준비
                updateRealtimeSessionStats(sessionId, isCorrect);
            }
            
            // 3. 즉각적인 피드백 처리를 위한 데이터 준비
            prepareImmediateFeedback(eventData);
            
        } catch (Exception e) {
            log.error("Failed to process real-time question analytics", e);
        }
    }

    private void processSessionStartedEvent(Map<String, Object> eventData) {
        try {
            String sessionId = (String) eventData.get("sessionId");
            String userId = (String) eventData.get("userId");
            String sessionType = (String) eventData.get("sessionType");
            Long startTimestamp = (Long) eventData.get("startTimestamp");
            Integer totalQuestions = (Integer) eventData.get("totalQuestions");
            
            log.info("Processing session start tracking - Session: {}, User: {}, Type: {}",
                    sessionId, userId, sessionType);

            // 1. 세션 초기화 로깅 (LearningSessionService의 startSession과 연동)
            logSessionInitialization(sessionId, userId, sessionType, startTimestamp);
            
            // 2. 사용자 활동 추적
            if (userId != null) {
                trackUserActivity(userId, sessionId, sessionType, "SESSION_STARTED");
                
                // 3. 세션 타입별 사전 분석 준비
                prepareSessionAnalysis(userId, sessionId, sessionType, totalQuestions);
            }
            
            // 4. 성능 모니터링을 위한 기준점 설정
            setPerformanceBaseline(sessionId, startTimestamp);
            
        } catch (Exception e) {
            log.error("Failed to process session start tracking for session: {}", 
                    eventData.get("sessionId"), e);
        }
    }
    
    // === Helper Methods ===
    
    private void logSessionCompletionStats(LearningCompletedEventDto event) {
        Map<String, Object> metadata = event.getMetadata();
        if (metadata != null) {
            String sessionType = (String) metadata.get("sessionType");
            Long duration = (Long) metadata.get("duration");
            Integer totalQuestions = (Integer) metadata.get("totalQuestions");
            Integer correctAnswers = (Integer) metadata.get("correctAnswers");
            Integer wrongAnswers = (Integer) metadata.get("wrongAnswers");
            Double progressPercentage = (Double) metadata.get("progressPercentage");
            
            log.info("SESSION_COMPLETION_STATS | SessionId: {} | UserId: {} | Type: {} | Duration: {}ms | " +
                    "TotalQuestions: {} | CorrectAnswers: {} | WrongAnswers: {} | ProgressPercentage: {}%",
                    event.getSessionId(), event.getUserId(), sessionType, duration,
                    totalQuestions, correctAnswers, wrongAnswers, progressPercentage);
        } else {
            log.info("SESSION_COMPLETION_STATS | SessionId: {} | UserId: {} | Metadata: null",
                    event.getSessionId(), event.getUserId());
        }
    }
    
    private void logQuestionPerformance(String questionId, String questionType, Boolean isCorrect, Long responseTime) {
        log.info("QUESTION_PERFORMANCE | QuestionId: {} | Type: {} | Correct: {} | ResponseTime: {}ms",
                questionId, questionType, isCorrect, responseTime);
    }
    
    private void logUserProgress(String userId, String sessionId, String questionId, Boolean isCorrect, Long responseTime) {
        log.info("USER_PROGRESS | UserId: {} | SessionId: {} | QuestionId: {} | Correct: {} | ResponseTime: {}ms",
                userId, sessionId, questionId, isCorrect, responseTime);
    }
    
    private void prepareImmediateFeedback(Map<String, Object> eventData) {
        // 즉각적인 피드백을 위한 데이터 준비 (현재는 로깅만 수행)
        log.debug("IMMEDIATE_FEEDBACK_PREPARED | EventData: {}", eventData);
    }
    
    private void logSessionInitialization(String sessionId, String userId, String sessionType, Long startTimestamp) {
        log.info("SESSION_INITIALIZATION | SessionId: {} | UserId: {} | Type: {} | StartTime: {}",
                sessionId, userId, sessionType, startTimestamp);
    }
    
    private void trackUserActivity(String userId, String sessionId, String sessionType, String activityType) {
        log.info("USER_ACTIVITY | UserId: {} | SessionId: {} | Type: {} | Activity: {}",
                userId, sessionId, sessionType, activityType);
    }
    
    private void setPerformanceBaseline(String sessionId, Long startTimestamp) {
        log.debug("PERFORMANCE_BASELINE | SessionId: {} | BaselineTime: {}", sessionId, startTimestamp);
    }
    
    // === 분석 데이터 처리를 위한 변환 메서드 ===
    
    @SuppressWarnings("unchecked")
    private CompleteLearningAnalysis convertToAnalysisData(Object analysisDataObj, String sessionId, String userId) {
        try {
            if (analysisDataObj instanceof Map) {
                Map<String, Object> dataMap = (Map<String, Object>) analysisDataObj;
                
                // Map에서 CompleteLearningAnalysis 빌드
                return CompleteLearningAnalysis.builder()
                        .sessionId(sessionId)
                        .userId(userId)
                        .totalDuration(getIntegerFromMap(dataMap, "totalDuration", 0))
                        .averageTimePerQuestion(getDoubleFromMap(dataMap, "averageTimePerQuestion", 0.0))
                        .wrongQuestionIds(getStringListFromMap(dataMap, "wrongQuestionIds"))
                        .weakQuestionTypes(convertToQuestionTypes(getStringListFromMap(dataMap, "weakQuestionTypes")))
                        .consistencyScore(getDoubleFromMap(dataMap, "consistencyScore", 0.0))
                        .recommendedReviewQuestions(getStringListFromMap(dataMap, "recommendedReviewQuestions"))
                        .learningSuggestion(getStringFromMap(dataMap, "learningSuggestion", ""))
                        .focusAreas(getStringListFromMap(dataMap, "focusAreas"))
                        .estimatedReviewTime(getIntegerFromMap(dataMap, "estimatedReviewTime", 0))
                        .build();
            } else {
                log.warn("Analysis data is not in expected Map format for user: {}", userId);
                return createDefaultAnalysisData(sessionId, userId);
            }
        } catch (Exception e) {
            log.error("Error converting analysis data for user: {}", userId, e);
            return createDefaultAnalysisData(sessionId, userId);
        }
    }
    
    private CompleteLearningAnalysis createDefaultAnalysisData(String sessionId, String userId) {
        return CompleteLearningAnalysis.builder()
                .sessionId(sessionId)
                .userId(userId)
                .totalDuration(0)
                .averageTimePerQuestion(0.0)
                .wrongQuestionIds(new ArrayList<>())
                .weakQuestionTypes(new ArrayList<>())
                .consistencyScore(50.0) // 기본값
                .recommendedReviewQuestions(new ArrayList<>())
                .learningSuggestion("Continue practicing to improve your skills!")
                .focusAreas(new ArrayList<>())
                .estimatedReviewTime(0)
                .build();
    }
    
    @SuppressWarnings("unchecked")
    private List<String> getStringListFromMap(Map<String, Object> map, String key) {
        Object value = map.get(key);
        if (value instanceof List) {
            return (List<String>) value;
        }
        return new ArrayList<>();
    }
    
    private String getStringFromMap(Map<String, Object> map, String key, String defaultValue) {
        Object value = map.get(key);
        return value != null ? value.toString() : defaultValue;
    }
    
    private Integer getIntegerFromMap(Map<String, Object> map, String key, Integer defaultValue) {
        Object value = map.get(key);
        if (value instanceof Number) {
            return ((Number) value).intValue();
        }
        return defaultValue;
    }
    
    private Double getDoubleFromMap(Map<String, Object> map, String key, Double defaultValue) {
        Object value = map.get(key);
        if (value instanceof Number) {
            return ((Number) value).doubleValue();
        }
        return defaultValue;
    }
    
    private List<com.problemservice.ProblemService.model.enums.QuestionType> convertToQuestionTypes(List<String> typeStrings) {
        if (typeStrings == null || typeStrings.isEmpty()) {
            return new ArrayList<>();
        }
        
        return typeStrings.stream()
                .map(typeStr -> {
                    try {
                        return com.problemservice.ProblemService.model.enums.QuestionType.valueOf(typeStr.toUpperCase());
                    } catch (IllegalArgumentException e) {
                        log.warn("Unknown question type: {}", typeStr);
                        return null;
                    }
                })
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
    }
    
    // === LearningSessionService와 연동을 위한 새로운 헬퍼 메서드들 ===
    
    private void processSessionRecommendation(String userId, String sessionType, Integer correctAnswers, Integer wrongAnswers) {
        // 세션 완료 후 다음 세션 추천 로직 (향후 LearningSessionService와 연동)
        if (correctAnswers != null && wrongAnswers != null) {
            double accuracy = correctAnswers.doubleValue() / (correctAnswers + wrongAnswers) * 100;
            log.info("SESSION_RECOMMENDATION_PREP | UserId: {} | SessionType: {} | Accuracy: {}%", 
                    userId, sessionType, accuracy);
        }
    }
    
    private void updateRealtimeSessionStats(String sessionId, Boolean isCorrect) {
        // 실시간 세션 통계 업데이트 (향후 LearningSessionService.updateSessionProgress와 연동)
        log.debug("REALTIME_SESSION_STATS | SessionId: {} | CorrectAnswer: {}", sessionId, isCorrect);
    }
    
    private void prepareSessionAnalysis(String userId, String sessionId, String sessionType, Integer totalQuestions) {
        // 세션 분석 준비 (LearningSessionService의 세션 생성 로직과 연동)
        log.info("SESSION_ANALYSIS_PREP | UserId: {} | SessionId: {} | Type: {} | TotalQuestions: {}", 
                userId, sessionId, sessionType, totalQuestions);
    }
}