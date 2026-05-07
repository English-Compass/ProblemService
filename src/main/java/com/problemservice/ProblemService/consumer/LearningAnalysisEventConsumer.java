package com.problemservice.ProblemService.consumer;

import com.problemservice.ProblemService.model.dto.CompleteLearningAnalysis;
import com.problemservice.ProblemService.model.dto.CompleteLearningAnalysisEvent;
import com.problemservice.ProblemService.model.entity.KafkaEventLog;
import com.problemservice.ProblemService.model.dto.LearningSessionCreateDto;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionType;
import com.problemservice.ProblemService.model.entity.QuestionAnswer;
import com.problemservice.ProblemService.model.enums.LearningPattern;
import com.problemservice.ProblemService.model.enums.QuestionType;
import com.problemservice.ProblemService.repository.QuestionAnswerRepository;
import com.problemservice.ProblemService.service.KafkaEventLogService;
import com.problemservice.ProblemService.service.LearningSessionService;
import com.problemservice.ProblemService.service.QuestionIdCacheScheduler;
import com.problemservice.ProblemService.service.UserProfileService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.kafka.support.KafkaHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;
import jakarta.annotation.PostConstruct;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 학습 분석 완료 이벤트를 실시간으로 처리하는 Kafka 컨슈머
 * LearningAnalysisService로부터 받은 분석 결과를 UserProfile에 반영
 */
@Component
@Profile("!local")
@RequiredArgsConstructor
@Slf4j
public class LearningAnalysisEventConsumer {
    
    private final LearningSessionService learningSessionService;
    private final QuestionAnswerRepository questionAnswerRepository;
    private final KafkaEventLogService kafkaEventLogService;
    private final UserProfileService userProfileService;
    private final QuestionIdCacheScheduler questionIdCacheScheduler;
    
    @PostConstruct
    public void init() {
        log.info("LearningAnalysisEventConsumer initialized - ready to consume from topic: learning-analysis-completed");
    }
    
    /**
     * 학습 분석 완료 이벤트를 실시간으로 처리
     * 분석 결과를 바탕으로 사용자의 학습 프로필과 문제 할당 전략을 즉시 업데이트
     * 
     * @param message JSON 문자열 메시지
     * @param partition 파티션 번호
     * @param offset 오프셋
     * @param acknowledgment 수동 커밋을 위한 Acknowledgment
     */
    @KafkaListener(
        topics = "learning-analysis-completed",
        groupId = "problem-service-group",
        containerFactory = "kafkaListenerContainerFactory"
    )
    public void processLearningAnalysisEvent(
            @Payload String message,
            @Header(KafkaHeaders.RECEIVED_PARTITION) int partition,
            @Header(KafkaHeaders.OFFSET) long offset,
            Acknowledgment acknowledgment) {
        
        KafkaEventLog eventLog = null;
        CompleteLearningAnalysisEvent event = null;
        
        try {
            // JSON 문자열을 파싱
            ObjectMapper mapper = new ObjectMapper();
            mapper.registerModule(new JavaTimeModule());
            event = mapper.readValue(message, CompleteLearningAnalysisEvent.class);
            
            log.info("Processing learning analysis event in real-time - userId: {}, sessionId: {}, partition: {}, offset: {}", 
                event.getUserId(), event.getSessionId(), partition, offset);
            
            // 0. 이벤트를 데이터베이스에 저장 (감사 로그 및 추적용)
            eventLog = kafkaEventLogService.saveEventFromObject(
                event, 
                "learning-analysis-completed", 
                partition, 
                offset
            );
            
            // 1. 분석 데이터 유효성 검증
            if (!isValidAnalysisEvent(event)) {
                log.warn("Invalid learning analysis event received: {}", event);
                if (eventLog != null) {
                    kafkaEventLogService.markAsFailed(eventLog.getId(), "Invalid event data");
                }
                acknowledgment.acknowledge();
                return;
            }
            
            // 이벤트 처리 중 상태로 업데이트
            if (eventLog != null) {
                eventLog.markAsProcessing();
            }
            
            // 2. 이벤트에서 CompleteLearningAnalysis 빌드 (flat 필드 우선, 없으면 nested analysisData 사용)
            CompleteLearningAnalysis analysisData = buildAnalysisData(event);

            // 3. 분석 결과를 UserProfile 엔티티에 영구 저장 (DB)
            userProfileService.updateProfileWithAnalysis(event.getUserId(), analysisData);

            // 4. 문제 ID 캐시 즉시 최신화
            refreshQuestionIdCache(event.getUserId(), analysisData);

            // 5. 사용자 답안 기록에 따라 추천 세션 자동 생성
            createRecommendedSessions(event.getUserId(), analysisData);

            // 6. 처리 완료 로그
            log.info("Learning analysis processed for userId: {}, pattern: {}, weakTypes: {}, wrongIds: {}",
                event.getUserId(),
                analysisData.getOverallLearningPattern(),
                analysisData.getWeakQuestionTypes(),
                analysisData.getWrongQuestionIds() != null ? analysisData.getWrongQuestionIds().size() : 0);
            
            // 7. 이벤트 처리 완료 상태로 업데이트
            if (eventLog != null) {
                kafkaEventLogService.markAsCompleted(eventLog.getId());
            }
            
            // 8. 메시지 처리 완료 확인
            acknowledgment.acknowledge();
            
        } catch (JsonProcessingException e) {
            log.error("Failed to parse learning analysis event JSON: message={}, error={}", message, e.getMessage(), e);
            // JSON 파싱 실패 시에도 acknowledge하여 무한 재시도 방지
            acknowledgment.acknowledge();
        } catch (Exception e) {
            log.error("Failed to process learning analysis event for user: {}, sessionId: {}", 
                event != null ? event.getUserId() : "unknown", 
                event != null ? event.getSessionId() : "unknown", e);
            
            // 이벤트 처리 실패 상태로 업데이트
            if (eventLog != null) {
                kafkaEventLogService.markAsFailed(eventLog.getId(), e.getMessage());
            }
            
            // 에러 발생 시에도 acknowledge하여 무한 재시도 방지
            acknowledgment.acknowledge();
        }
    }
    
    /**
     * 이벤트 flat 필드 또는 nested analysisData에서 CompleteLearningAnalysis를 구성
     * LearningService가 flat 필드로 보내는 새 포맷과 기존 nested 포맷 모두 수용
     */
    private CompleteLearningAnalysis buildAnalysisData(CompleteLearningAnalysisEvent event) {
        // "word"/"sentence"/"conversation" → QuestionType enum 변환
        List<QuestionType> weakTypes = event.getWeakQuestionTypes() != null
                ? event.getWeakQuestionTypes().stream()
                        .map(s -> {
                            try { return QuestionType.valueOf(s.toUpperCase()); }
                            catch (IllegalArgumentException e) { return null; }
                        })
                        .filter(java.util.Objects::nonNull)
                        .collect(Collectors.toList())
                : Collections.emptyList();

        LearningPattern pattern = mapLearningPattern(event.getLearningPattern());

        return CompleteLearningAnalysis.builder()
                .sessionId(event.getSessionId())
                .userId(event.getUserId())
                .wrongQuestionIds(event.getWrongQuestionIds() != null
                        ? event.getWrongQuestionIds() : Collections.emptyList())
                .weakQuestionTypes(weakTypes)
                .overallLearningPattern(pattern)
                .recommendedReviewQuestions(event.getRecommendedReviewQuestions() != null
                        ? event.getRecommendedReviewQuestions() : Collections.emptyList())
                .focusAreas(Collections.emptyList())
                .build();
    }

    private LearningPattern mapLearningPattern(String raw) {
        if (raw == null) return LearningPattern.NO_DATA;
        switch (raw.toUpperCase()) {
            case "IMPROVING": return LearningPattern.GOOD;
            case "STABLE":    return LearningPattern.AVERAGE;
            case "STRUGGLING":return LearningPattern.NEEDS_IMPROVEMENT;
            default:
                try { return LearningPattern.valueOf(raw.toUpperCase()); }
                catch (IllegalArgumentException e) { return LearningPattern.NO_DATA; }
        }
    }

    /**
     * 학습 분석 이벤트 유효성 검증
     */
    private boolean isValidAnalysisEvent(CompleteLearningAnalysisEvent event) {
        if (event == null) {
            return false;
        }
        String userId = event.getUserId();
        String sessionId = event.getSessionId();
        // nested analysisData 또는 flat 필드 중 하나만 있어도 유효
        boolean hasData = event.getWeakQuestionTypes() != null
                || event.getWrongQuestionIds() != null
                || event.getLearningPattern() != null;
        return userId != null && !userId.trim().isEmpty()
                && sessionId != null && !sessionId.trim().isEmpty()
                && hasData;
    }
    
    /**
     * 문제 ID 캐시를 즉시 최신화
     * 분석 결과가 새로운 문제 할당에 즉시 반영되도록 Redis 캐시를 업데이트
     * 
     * @param userId 사용자 ID
     * @param analysisData 학습 분석 데이터
     */
    private void refreshQuestionIdCache(String userId, CompleteLearningAnalysis analysisData) {
        try {
            long startTime = System.currentTimeMillis();
            
            log.info("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
            log.info("🔄 Learning analysis completed - Refreshing question ID cache immediately");
            log.info("   userId: {}, pattern: {}, weak types: {}, wrong answers: {}", 
                userId, 
                analysisData.getOverallLearningPattern(),
                analysisData.getWeakQuestionTypes().size(),
                analysisData.getWrongQuestionIds().size());
            
            // Redis 캐시 즉시 최신화 (10분 대기 없이)
            questionIdCacheScheduler.refreshQuestionIdCache();
            
            long duration = System.currentTimeMillis() - startTime;
            log.info("✅ Question ID cache refreshed successfully in {}ms", duration);
            log.info("   New analysis results are now available for next session creation");
            log.info("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
            
        } catch (Exception e) {
            log.error("Failed to refresh question ID cache after learning analysis for user: {}", userId, e);
            // 캐시 업데이트 실패해도 이벤트 처리는 계속 진행 (10분 후 스케줄러가 다시 시도)
        }
    }
    
    /**
     * 사용자의 답안 기록에 따라 추천 세션을 자동 생성
     * 기존 LearningSessionService의 세션 생성 메서드를 활용
     * 
     * @param userId 사용자 ID
     * @param analysisData 학습 분석 데이터
     */
    private void createRecommendedSessions(String userId, CompleteLearningAnalysis analysisData) {
        try {
            // 사용자의 전체 카테고리에서 기록 확인 (모든 주요 카테고리)
            List<String> allCategories = Arrays.asList("학업", "비즈니스", "여행", "일상생활");
            
            // 정답 기록이 있으면 복습 세션 생성 (분석 데이터 포함)
            List<QuestionAnswer> correctAnswers = questionAnswerRepository
                .findByUserIdAndCategoriesAndIsCorrect(userId, allCategories, true);
            
            if (!correctAnswers.isEmpty()) {
                LearningSessionCreateDto createDto = LearningSessionCreateDto.builder()
                    .userId(userId)
                    .sessionType(SessionType.REVIEW)
                    .categories(allCategories)
                    .sessionMetadata("Auto-generated review session from learning analysis")
                    .build();
                    
                learningSessionService.createReviewSession(createDto, analysisData);
                log.info("Auto-generated review session created for user: {} with analysis data", userId);
            }
            
            // 오답 기록이 있으면 오답노트 세션 생성
            List<QuestionAnswer> wrongAnswers = questionAnswerRepository
                .findWrongAnswersByUserIdAndCategories(userId, allCategories);
            
            if (!wrongAnswers.isEmpty()) {
                LearningSessionCreateDto createDto = LearningSessionCreateDto.builder()
                    .userId(userId)
                    .sessionType(SessionType.WRONG_ANSWER)
                    .categories(allCategories)
                    .sessionMetadata("Auto-generated wrong answer session")
                    .build();
                    
                learningSessionService.createWrongAnswerSession(createDto);
                log.info("Auto-generated wrong answer session created for user: {}", userId);
            }
            
        } catch (Exception e) {
            log.error("Failed to create recommended sessions for user: {}", userId, e);
        }
    }
}