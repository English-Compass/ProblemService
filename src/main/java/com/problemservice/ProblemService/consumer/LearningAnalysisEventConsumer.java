package com.problemservice.ProblemService.consumer;

import com.problemservice.ProblemService.model.dto.CompleteLearningAnalysis;
import com.problemservice.ProblemService.model.dto.CompleteLearningAnalysisEvent;
import com.problemservice.ProblemService.model.dto.LearningSessionCreateDto;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionType;
import com.problemservice.ProblemService.model.entity.QuestionAnswer;
import com.problemservice.ProblemService.repository.QuestionAnswerRepository;
import com.problemservice.ProblemService.service.LearningSessionService;
import com.problemservice.ProblemService.service.QuestionAssignmentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.kafka.support.KafkaHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

/**
 * 학습 분석 완료 이벤트를 실시간으로 처리하는 Kafka 컨슈머
 * 분석 데이터를 저장하지 않고 즉시 처리하여 사용자 학습 프로필을 업데이트
 */
@Component
@RequiredArgsConstructor
@Slf4j
public class LearningAnalysisEventConsumer {
    
    private final QuestionAssignmentService questionAssignmentService;
    private final LearningSessionService learningSessionService;
    private final QuestionAnswerRepository questionAnswerRepository;
    
    /**
     * 학습 분석 완료 이벤트를 실시간으로 처리
     * 분석 결과를 바탕으로 사용자의 학습 프로필과 문제 할당 전략을 즉시 업데이트
     * 
     * @param event 학습 분석 완료 이벤트 데이터
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
            @Payload CompleteLearningAnalysisEvent event,
            @Header(KafkaHeaders.RECEIVED_PARTITION) int partition,
            @Header(KafkaHeaders.OFFSET) long offset,
            Acknowledgment acknowledgment) {
        
        try {
            log.info("Processing learning analysis event in real-time - userId: {}, sessionId: {}, partition: {}, offset: {}", 
                event.getUserId(), event.getSessionId(), partition, offset);
            
            // 1. 분석 데이터 유효성 검증
            if (!isValidAnalysisEvent(event)) {
                log.warn("Invalid learning analysis event received: {}", event);
                acknowledgment.acknowledge();
                return;
            }
            
            // 2. 분석 결과를 바탕으로 사용자 학습 프로필 실시간 업데이트
            questionAssignmentService.updateUserLearningProfile(event.getUserId(), event.getAnalysisData());
            
            // 3. 사용자 답안 기록에 따라 자동으로 추천 세션 생성
            createRecommendedSessions(event.getUserId(), event.getAnalysisData());
            
            // 4. 처리 완료 로그
            log.info("Learning analysis processed and user profile updated for userId: {}, pattern: {}, consistency: {}", 
                event.getUserId(), 
                event.getAnalysisData().getOverallLearningPattern(),
                event.getAnalysisData().getConsistencyScore());
            
            // 5. 메시지 처리 완료 확인
            acknowledgment.acknowledge();
            
        } catch (Exception e) {
            log.error("Failed to process learning analysis event for user: {}, sessionId: {}", 
                event.getUserId(), event.getSessionId(), e);
            
            // 에러 발생 시에도 acknowledge하여 무한 재시도 방지
            acknowledgment.acknowledge();
        }
    }
    
    /**
     * 학습 분석 이벤트 유효성 검증
     * @param event 검증할 이벤트
     * @return 유효성 검증 결과
     */
    private boolean isValidAnalysisEvent(CompleteLearningAnalysisEvent event) {
        if (event == null || event.getAnalysisData() == null) {
            return false;
        }
        
        String userId = event.getUserId();
        String sessionId = event.getSessionId();
        
        return userId != null && !userId.trim().isEmpty() 
            && sessionId != null && !sessionId.trim().isEmpty()
            && event.getTimestamp() > 0;
    }
    
    /**
     * 사용자의 답안 기록에 따라 추천 세션을 자동 생성
     * @param userId 사용자 ID
     * @param analysisData 분석 데이터
     */
    private void createRecommendedSessions(String userId, CompleteLearningAnalysis analysisData) {
        try {
            // 사용자의 전체 카테고리에서 기록 확인 (모든 주요 카테고리)
            List<String> allCategories = Arrays.asList("학업", "비즈니스", "여행", "일상생활");
            
            // 정답 기록이 있으면 복습 세션 생성
            List<QuestionAnswer> correctAnswers = questionAnswerRepository
                .findByUserIdAndCategoriesAndIsCorrect(userId, allCategories, true);
            
            if (!correctAnswers.isEmpty()) {
                createReviewSession(userId, allCategories);
            }
            
            // 오답 기록이 있으면 오답노트 세션 생성
            List<QuestionAnswer> wrongAnswers = questionAnswerRepository
                .findWrongAnswersByUserIdAndCategories(userId, allCategories);
            
            if (!wrongAnswers.isEmpty()) {
                createWrongAnswerSession(userId, allCategories);
            }
            
        } catch (Exception e) {
            log.error("Failed to create recommended sessions for user: {}", userId, e);
        }
    }
    
    /**
     * 복습 세션 자동 생성
     */
    private void createReviewSession(String userId, List<String> categories) {
        try {
            LearningSessionCreateDto createDto = LearningSessionCreateDto.builder()
                .userId(userId)
                .sessionType(SessionType.REVIEW)
                .categories(categories)
                .sessionMetadata("Auto-generated review session")
                .build();
                
            learningSessionService.createReviewSession(createDto);
            log.info("Auto-generated review session created for user: {}", userId);
            
        } catch (Exception e) {
            log.warn("Could not auto-create review session for user: {} - {}", userId, e.getMessage());
        }
    }
    
    /**
     * 오답노트 세션 자동 생성
     */
    private void createWrongAnswerSession(String userId, List<String> categories) {
        try {
            LearningSessionCreateDto createDto = LearningSessionCreateDto.builder()
                .userId(userId)
                .sessionType(SessionType.WRONG_ANSWER)
                .categories(categories)
                .sessionMetadata("Auto-generated wrong answer session")
                .build();
                
            learningSessionService.createWrongAnswerSession(createDto);
            log.info("Auto-generated wrong answer session created for user: {}", userId);
            
        } catch (Exception e) {
            log.warn("Could not auto-create wrong answer session for user: {} - {}", userId, e.getMessage());
        }
    }
}