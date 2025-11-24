package com.problemservice.ProblemService.consumer;

import com.problemservice.ProblemService.model.dto.UserProfileEvent;
import com.problemservice.ProblemService.model.entity.KafkaEventLog;
import com.problemservice.ProblemService.service.KafkaEventLogService;
import com.problemservice.ProblemService.service.UserProfileService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Profile;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.kafka.support.KafkaHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Component;
import jakarta.annotation.PostConstruct;

/**
 * UserService로부터 사용자 프로필 업데이트 이벤트를 구독하는 Kafka Consumer
 * 사용자가 프로필을 업데이트할 때마다 해당 정보를 받아 ProblemService의 UserProfile에 반영
 */
@Component
@Profile("!local")
@RequiredArgsConstructor
@Slf4j
@ConditionalOnProperty(name = "spring.kafka.bootstrap-servers", matchIfMissing = false)
public class UserProfileEventConsumer {

    private final UserProfileService userProfileService;
    private final KafkaEventLogService kafkaEventLogService;

    @PostConstruct
    public void init() {
        log.info("UserProfileEventConsumer initialized - ready to consume from topic: user-profile-events");
    }

    /**
     * user-profile-events 토픽에서 사용자 프로필 업데이트 이벤트를 구독
     * UserService가 StringSerializer로 JSON 문자열을 보내므로, String으로 받아서 수동 파싱
     * 
     * @param message JSON 문자열 메시지
     * @param partition Kafka 파티션 번호
     * @param offset Kafka 오프셋
     * @param acknowledgment 수동 커밋을 위한 Acknowledgment
     */
    @KafkaListener(
        topics = "${spring.kafka.topic.user-profile:user-profile-events}",
        groupId = "${spring.kafka.consumer.group-id:problem-service-group}",
        containerFactory = "kafkaListenerContainerFactory"
    )
    public void consumeUserProfileEvent(
            @Payload String message,
            @Header(KafkaHeaders.RECEIVED_PARTITION) int partition,
            @Header(KafkaHeaders.OFFSET) long offset,
            Acknowledgment acknowledgment) {

        KafkaEventLog eventLog = null;
        UserProfileEvent event = null;

        try {
            // UserService가 StringSerializer로 보낸 JSON 문자열을 파싱
            ObjectMapper mapper = new ObjectMapper();
            mapper.registerModule(new JavaTimeModule());
            event = mapper.readValue(message, UserProfileEvent.class);
            
            log.info("Received user profile event: type={}, userId={}, partition={}, offset={}", 
                    event.getEventType(), event.getUserId(), partition, offset);

            // 0. 이벤트를 데이터베이스에 저장 (감사 로그 및 추적용)
            eventLog = kafkaEventLogService.saveEventFromObject(
                event, 
                "user-profile-events", 
                partition, 
                offset
            );

            // 1. 이벤트 유효성 검증
            if (!isValidProfileEvent(event)) {
                log.warn("Invalid user profile event received: {}", event);
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

            // 2. 프로필 이벤트 처리
            userProfileService.handleUserProfileEvent(event);

            // 3. 처리 완료 로그
            log.info("User profile event processed successfully: userId={}, type={}", 
                    event.getUserId(), event.getEventType());

            // 4. 이벤트 처리 완료 상태로 업데이트
            if (eventLog != null) {
                kafkaEventLogService.markAsCompleted(eventLog.getId());
            }

            // 5. 메시지 처리 완료 확인
            acknowledgment.acknowledge();

        } catch (JsonProcessingException e) {
            log.error("Failed to parse user profile event JSON: message={}, error={}", message, e.getMessage(), e);
            // JSON 파싱 실패 시에도 acknowledge하여 무한 재시도 방지
            acknowledgment.acknowledge();
        } catch (Exception e) {
            log.error("Failed to process user profile event: userId={}, type={}", 
                    event != null ? event.getUserId() : "unknown", 
                    event != null ? event.getEventType() : "unknown", e);

            // 이벤트 처리 실패 상태로 업데이트
            if (eventLog != null) {
                kafkaEventLogService.markAsFailed(eventLog.getId(), e.getMessage());
            }

            // 에러 발생 시에도 acknowledge하여 무한 재시도 방지
            acknowledgment.acknowledge();
        }
    }

    /**
     * 사용자 프로필 이벤트 유효성 검증
     * 
     * @param event 검증할 이벤트
     * @return 유효성 검증 결과
     */
    private boolean isValidProfileEvent(UserProfileEvent event) {
        if (event == null) {
            return false;
        }

        String userId = event.getUserId();
        String eventType = event.getEventType();

        if (userId == null || userId.trim().isEmpty()) {
            log.warn("User profile event has null or empty userId");
            return false;
        }

        if (eventType == null || eventType.trim().isEmpty()) {
            log.warn("User profile event has null or empty eventType");
            return false;
        }

        // PROFILE_CREATED, PROFILE_UPDATED의 경우 필수 필드 검증
        if ("PROFILE_CREATED".equals(eventType) || "PROFILE_UPDATED".equals(eventType)) {
            if (event.getDifficultyLevel() == null || event.getSelectedCategories() == null) {
                log.warn("User profile event is missing required fields: difficultyLevel or selectedCategories");
                return false;
            }
        }

        return true;
    }
}

