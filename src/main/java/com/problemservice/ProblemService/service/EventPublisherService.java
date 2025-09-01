package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.dto.LearningCompletedEventDto;
import com.problemservice.ProblemService.model.dto.LearningQuestionAnsweredEventDto;
import com.problemservice.ProblemService.model.dto.LearningSessionStartedEventDto;
import com.problemservice.ProblemService.model.dto.SessionCompletedEventDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.UUID;
import java.util.concurrent.CompletableFuture;

/**
 * Kafka 를 통해 다양한 비즈니스 이벤트를 발행하는 서비스
 * 현재는 학습 세션 완료 이벤트 발행 기능을 제공
 * 입력: 세션 완료 이벤트 DTO
 * 출력: Kafka 로 발행된 이벤트 메시지
 */
@Service
@RequiredArgsConstructor
@Slf4j
@ConditionalOnProperty(name = "spring.kafka.bootstrap-servers", matchIfMissing = false)
public class EventPublisherService {

    private final KafkaTemplate<String, Object> kafkaTemplate;

    @Value("${app.kafka.topic.session-completed:learning-session-completed}")
    private String sessionCompletedTopic;

    @Value("${app.kafka.topic.session-started:learning-session-started}")
    private String sessionStartedTopic;

    @Value("${app.kafka.topic.question-answered:learning-question-answered}")
    private String questionAnsweredTopic;

    /**
     * 학습 세션 완료 이벤트를 Kafka로 발행
     * 단계: 1) 이벤트 메타데이터 설정 2) Kafka로 비동 전송 3) 결과 처리 및 로깅 4) 예외 처리
     * 입력: 세션 완료 이벤트 DTO (세션 ID, 사용자 ID, 진행률, 정답 수 등)
     * 출력: 없음 (void) - Kafka로 비동 전송
     * 조건: 전송 실패 시 에러 로그 기록
     */
    public void publishSessionCompletedEvent(SessionCompletedEventDto event) {
        try {
            // 1단계: 이벤트에 필수 메타데이터 설정
            event.setEventTimestamp(LocalDateTime.now()); // 이벤트 발생 시간 설정
            event.setEventType("SESSION_COMPLETED"); // 이벤트 타입 설정
            
            // 2단계: Kafka로 비동 메시지 전송 (세션 ID를 메시지 키로 사용)
            CompletableFuture<SendResult<String, Object>> future = kafkaTemplate.send(
                sessionCompletedTopic, // 대상 토픽
                event.getSessionId(), // 메시지 키 (파티셔닝을 위한 세션 ID)
                event // 전송할 이벤트 데이터
            );
            
            // 3단계: 비동 전송 결과 처리 및 로깅
            future.whenComplete((result, exception) -> {
                if (exception == null) {
                    // 전송 성공 시 성공 로그 기록
                    log.info("Session completed event published successfully for session: {} to topic: {} with offset: {}", 
                        event.getSessionId(), 
                        sessionCompletedTopic, 
                        result.getRecordMetadata().offset() // Kafka 오프셋 정보
                    );
                } else {
                    // 전송 실패 시 에러 로그 기록
                    log.error("Failed to publish session completed event for session: {} to topic: {}", 
                        event.getSessionId(), 
                        sessionCompletedTopic, 
                        exception
                    );
                }
            });
            
        } catch (Exception e) {
            // 4단계: 전송 과정에서 발생한 예외 처리
            log.error("Error occurred while publishing session completed event for session: {}", 
                event.getSessionId(), e);
        }
    }

    public void publishSessionStartedEvent(LearningSessionStartedEventDto event) {
        try {
            event.setEventTimestamp(LocalDateTime.now());
            event.setEventType("SESSION_STARTED");
            
            CompletableFuture<SendResult<String, Object>> future = kafkaTemplate.send(
                sessionStartedTopic,
                event.getSessionId(),
                event
            );
            
            future.whenComplete((result, exception) -> {
                if (exception == null) {
                    log.info("Session started event published successfully for session: {} to topic: {} with offset: {}", 
                        event.getSessionId(), 
                        sessionStartedTopic, 
                        result.getRecordMetadata().offset()
                    );
                } else {
                    log.error("Failed to publish session started event for session: {} to topic: {}", 
                        event.getSessionId(), 
                        sessionStartedTopic, 
                        exception
                    );
                }
            });
            
        } catch (Exception e) {
            log.error("Error occurred while publishing session started event for session: {}", 
                event.getSessionId(), e);
        }
    }

    public void publishQuestionAnsweredEvent(LearningQuestionAnsweredEventDto event) {
        try {
            event.setEventTimestamp(LocalDateTime.now());
            event.setEventType("QUESTION_ANSWERED");
            
            CompletableFuture<SendResult<String, Object>> future = kafkaTemplate.send(
                questionAnsweredTopic,
                event.getQuestionId(),
                event
            );
            
            future.whenComplete((result, exception) -> {
                if (exception == null) {
                    log.info("Question answered event published successfully for question: {} in session: {} to topic: {} with offset: {}", 
                        event.getQuestionId(),
                        event.getSessionId(),
                        questionAnsweredTopic, 
                        result.getRecordMetadata().offset()
                    );
                } else {
                    log.error("Failed to publish question answered event for question: {} in session: {} to topic: {}", 
                        event.getQuestionId(),
                        event.getSessionId(),
                        questionAnsweredTopic, 
                        exception
                    );
                }
            });
            
        } catch (Exception e) {
            log.error("Error occurred while publishing question answered event for question: {} in session: {}", 
                event.getQuestionId(), event.getSessionId(), e);
        }
    }

    public void publishLearningCompletedEvent(LearningCompletedEventDto event) {
        try {
            if (event.getEventId() == null) {
                event.setEventId(UUID.randomUUID().toString());
            }
            event.setTimestamp(LocalDateTime.now());
            event.setEventType("SESSION_COMPLETED");
            event.setEventSource("Problem_Service");
            
            CompletableFuture<SendResult<String, Object>> future = kafkaTemplate.send(
                sessionCompletedTopic,
                event.getSessionId(),
                event
            );
            
            future.whenComplete((result, exception) -> {
                if (exception == null) {
                    log.info("Learning completed event published successfully for session: {} to topic: {} with offset: {}", 
                        event.getSessionId(), 
                        sessionCompletedTopic, 
                        result.getRecordMetadata().offset()
                    );
                } else {
                    log.error("Failed to publish learning completed event for session: {} to topic: {}", 
                        event.getSessionId(), 
                        sessionCompletedTopic, 
                        exception
                    );
                }
            });
            
        } catch (Exception e) {
            log.error("Error occurred while publishing learning completed event for session: {}", 
                event.getSessionId(), e);
        }
    }
}