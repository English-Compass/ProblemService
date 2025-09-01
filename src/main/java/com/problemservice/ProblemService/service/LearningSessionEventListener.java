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

@Service
@RequiredArgsConstructor
@Slf4j
@ConditionalOnProperty(name = "spring.kafka.bootstrap-servers", matchIfMissing = false)
public class LearningSessionEventListener {

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
        // TODO: Implement session completion analytics
        // This could include:
        // 1. Storing session results for analysis
        // 2. Triggering pattern analysis
        // 3. Updating user learning metrics
        // 4. Generating recommendations
        
        log.debug("Processing session completion for session: {} user: {} with metadata: {}",
                event.getSessionId(), event.getUserId(), event.getMetadata());
    }

    private void processQuestionAnsweredEvent(Map<String, Object> eventData) {
        // TODO: Implement real-time question analytics
        // This could include:
        // 1. Real-time difficulty adjustment
        // 2. Question performance tracking
        // 3. User progress monitoring
        // 4. Immediate feedback processing
        
        String sessionId = (String) eventData.get("sessionId");
        String questionId = (String) eventData.get("questionId");
        Boolean isCorrect = (Boolean) eventData.get("isCorrect");
        
        log.debug("Processing question answered event - Session: {}, Question: {}, Correct: {}",
                sessionId, questionId, isCorrect);
    }

    private void processSessionStartedEvent(Map<String, Object> eventData) {
        // TODO: Implement session start tracking
        // This could include:
        // 1. Session initialization logging
        // 2. User activity tracking
        // 3. Performance monitoring
        // 4. Resource allocation
        
        String sessionId = (String) eventData.get("sessionId");
        String sessionType = (String) eventData.get("sessionType");
        
        log.debug("Processing session started event - Session: {}, Type: {}",
                sessionId, sessionType);
    }
}