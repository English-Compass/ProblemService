package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.dto.SessionCompletedEventDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.concurrent.CompletableFuture;

/**
 * Kafka를 통해 학습 세션 완료 이벤트를 발행하는 서비스
 * 세션 완료 이벤트만 발행하며, 개별 문제 답변 이벤트는 발행하지 않음
 * (모든 답변 정보는 세션 완료 이벤트에 포함됨)
 */
@Service
@Profile("!local")
@RequiredArgsConstructor
@Slf4j
@ConditionalOnProperty(name = "spring.kafka.bootstrap-servers", matchIfMissing = false)
public class EventPublisherService {

    private final KafkaTemplate<String, Object> kafkaTemplate;

    @Value("${app.kafka.topic.session-completed:learning-session-completed}")
    private String sessionCompletedTopic;

    /**
     * 학습 세션 완료 이벤트를 Kafka로 발행
     * 세션의 모든 답변 정보와 통계가 포함됨
     * 
     * @param event 세션 완료 이벤트 DTO (세션 ID, 사용자 ID, 진행률, 정답 수 등)
     */
    public void publishSessionCompletedEvent(SessionCompletedEventDto event) {
        try {
            // 이벤트 메타데이터 설정
            event.setEventTimestamp(LocalDateTime.now());
            event.setEventType("SESSION_COMPLETED");
            
            // Kafka로 비동기 메시지 전송
            CompletableFuture<SendResult<String, Object>> future = kafkaTemplate.send(
                sessionCompletedTopic,
                event.getSessionId(), // 파티셔닝을 위한 키
                event
            );
            
            // 전송 결과 처리
            future.whenComplete((result, exception) -> {
                if (exception == null) {
                    log.info("Session completed event published successfully for session: {} to topic: {} with offset: {}", 
                        event.getSessionId(), 
                        sessionCompletedTopic, 
                        result.getRecordMetadata().offset()
                    );
                } else {
                    log.error("Failed to publish session completed event for session: {} to topic: {}", 
                        event.getSessionId(), 
                        sessionCompletedTopic, 
                        exception
                    );
                }
            });
            
        } catch (Exception e) {
            log.error("Error occurred while publishing session completed event for session: {}", 
                event.getSessionId(), e);
        }
    }
}
