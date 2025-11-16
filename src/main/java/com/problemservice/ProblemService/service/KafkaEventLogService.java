package com.problemservice.ProblemService.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.problemservice.ProblemService.model.entity.KafkaEventLog;
import com.problemservice.ProblemService.model.entity.KafkaEventLog.ProcessingStatus;
import com.problemservice.ProblemService.repository.KafkaEventLogRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * Kafka 이벤트 로그 서비스
 * Kafka 이벤트의 저장, 조회, 통계 기능 제공
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class KafkaEventLogService {

    private final KafkaEventLogRepository eventLogRepository;
    private final ObjectMapper objectMapper;

    /**
     * 이벤트 저장 (중복 체크 포함)
     * @param eventLog 저장할 이벤트 로그
     * @return 저장된 이벤트 로그
     */
    @Transactional
    public KafkaEventLog saveEvent(KafkaEventLog eventLog) {
        try {
            // 중복 체크 (토픽 + 파티션 + 오프셋)
            if (eventLog.getTopicName() != null && eventLog.getPartitionNum() != null && eventLog.getOffsetNum() != null) {
                Optional<KafkaEventLog> existing = eventLogRepository
                    .findByTopicNameAndPartitionNumAndOffsetNum(
                        eventLog.getTopicName(), 
                        eventLog.getPartitionNum(), 
                        eventLog.getOffsetNum()
                    );
                
                if (existing.isPresent()) {
                    log.debug("Duplicate event detected, skipping: topic={}, partition={}, offset={}", 
                        eventLog.getTopicName(), eventLog.getPartitionNum(), eventLog.getOffsetNum());
                    return existing.get();
                }
            }

            KafkaEventLog saved = eventLogRepository.save(eventLog);
            log.debug("Event saved successfully: id={}, type={}, userId={}", 
                saved.getId(), saved.getEventType(), saved.getUserId());
            return saved;

        } catch (Exception e) {
            log.error("Failed to save event: type={}, topic={}", 
                eventLog.getEventType(), eventLog.getTopicName(), e);
            throw new RuntimeException("Failed to save event log", e);
        }
    }

    /**
     * 이벤트 객체를 JSON으로 변환하여 저장
     * @param event 이벤트 객체
     * @param topicName 토픽 이름
     * @param partition 파티션 번호
     * @param offset 오프셋
     * @return 저장된 이벤트 로그
     */
    @Transactional
    public KafkaEventLog saveEventFromObject(Object event, String topicName, Integer partition, Long offset) {
        try {
            // ObjectMapper에 JavaTimeModule 등록 (LocalDateTime 직렬화 지원)
            ObjectMapper mapper = new ObjectMapper();
            mapper.registerModule(new JavaTimeModule());
            
            String eventPayload = mapper.writeValueAsString(event);
            
            // 이벤트에서 공통 필드 추출 (리플렉션 사용)
            String eventType = extractEventType(event);
            String userId = extractUserId(event);
            String sessionId = extractSessionId(event);
            String questionId = extractQuestionId(event);
            LocalDateTime eventTimestamp = extractEventTimestamp(event);
            
            KafkaEventLog eventLog = KafkaEventLog.builder()
                .eventType(eventType)
                .topicName(topicName)
                .partitionNum(partition)
                .offsetNum(offset)
                .userId(userId)
                .sessionId(sessionId)
                .questionId(questionId)
                .eventPayload(eventPayload)
                .eventTimestamp(eventTimestamp)
                .processingStatus(ProcessingStatus.RECEIVED)
                .build();

            return saveEvent(eventLog);

        } catch (JsonProcessingException e) {
            log.error("Failed to serialize event to JSON: topic={}", topicName, e);
            throw new RuntimeException("Failed to serialize event", e);
        }
    }

    /**
     * 이벤트 처리 완료 마킹
     */
    @Transactional
    public void markAsCompleted(Long eventLogId) {
        eventLogRepository.findById(eventLogId).ifPresent(eventLog -> {
            eventLog.markAsCompleted();
            eventLogRepository.save(eventLog);
            log.debug("Event marked as completed: id={}", eventLogId);
        });
    }

    /**
     * 이벤트 처리 실패 마킹
     */
    @Transactional
    public void markAsFailed(Long eventLogId, String errorMessage) {
        eventLogRepository.findById(eventLogId).ifPresent(eventLog -> {
            eventLog.markAsFailed(errorMessage);
            eventLogRepository.save(eventLog);
            log.warn("Event marked as failed: id={}, error={}", eventLogId, errorMessage);
        });
    }

    /**
     * 특정 사용자의 이벤트 조회
     */
    public List<KafkaEventLog> getUserEvents(String userId) {
        return eventLogRepository.findByUserIdOrderByEventTimestampDesc(userId);
    }

    /**
     * 특정 사용자의 이벤트 페이징 조회
     */
    public Page<KafkaEventLog> getUserEvents(String userId, Pageable pageable) {
        return eventLogRepository.findByUserId(userId, pageable);
    }

    /**
     * 특정 세션의 이벤트 조회
     */
    public List<KafkaEventLog> getSessionEvents(String sessionId) {
        return eventLogRepository.findBySessionIdOrderByEventTimestampAsc(sessionId);
    }

    /**
     * 이벤트 타입별 통계
     */
    public Map<String, Long> getEventTypeStatistics() {
        return eventLogRepository.countByEventType().stream()
            .collect(Collectors.toMap(
                result -> (String) result[0],
                result -> (Long) result[1]
            ));
    }

    /**
     * 처리 상태별 통계
     */
    public Map<String, Long> getProcessingStatusStatistics() {
        return eventLogRepository.countByProcessingStatus().stream()
            .collect(Collectors.toMap(
                result -> result[0].toString(),
                result -> (Long) result[1]
            ));
    }

    /**
     * 실패한 이벤트 재시도
     */
    @Transactional
    public List<KafkaEventLog> getFailedEventsForRetry(int maxRetry) {
        return eventLogRepository.findFailedEventsForRetry(maxRetry);
    }

    /**
     * 오래된 이벤트 정리 (보관 기간 초과)
     */
    @Transactional
    public int cleanupOldEvents(int retentionDays) {
        LocalDateTime cutoffDate = LocalDateTime.now().minusDays(retentionDays);
        List<KafkaEventLog> oldEvents = eventLogRepository.findOldEvents(cutoffDate);
        
        if (!oldEvents.isEmpty()) {
            eventLogRepository.deleteAll(oldEvents);
            log.info("Cleaned up {} old events (older than {} days)", oldEvents.size(), retentionDays);
            return oldEvents.size();
        }
        
        return 0;
    }

    // ==================== Private Helper Methods ====================

    /**
     * 이벤트 객체에서 eventType 추출
     */
    private String extractEventType(Object event) {
        try {
            return (String) event.getClass().getMethod("getEventType").invoke(event);
        } catch (Exception e) {
            // eventType이 없으면 클래스 이름 사용
            return event.getClass().getSimpleName();
        }
    }

    /**
     * 이벤트 객체에서 userId 추출
     */
    private String extractUserId(Object event) {
        try {
            return (String) event.getClass().getMethod("getUserId").invoke(event);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 이벤트 객체에서 sessionId 추출
     */
    private String extractSessionId(Object event) {
        try {
            return (String) event.getClass().getMethod("getSessionId").invoke(event);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 이벤트 객체에서 questionId 추출
     */
    private String extractQuestionId(Object event) {
        try {
            return (String) event.getClass().getMethod("getQuestionId").invoke(event);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 이벤트 객체에서 eventTimestamp 추출
     */
    private LocalDateTime extractEventTimestamp(Object event) {
        try {
            // eventTimestamp 시도
            Object timestamp = event.getClass().getMethod("getEventTimestamp").invoke(event);
            if (timestamp instanceof LocalDateTime) {
                return (LocalDateTime) timestamp;
            }
        } catch (Exception e1) {
            try {
                // timestamp 시도
                Object timestamp = event.getClass().getMethod("getTimestamp").invoke(event);
                if (timestamp instanceof LocalDateTime) {
                    return (LocalDateTime) timestamp;
                } else if (timestamp instanceof Long) {
                    // Unix timestamp (milliseconds)
                    return LocalDateTime.ofInstant(
                        java.time.Instant.ofEpochMilli((Long) timestamp),
                        java.time.ZoneId.systemDefault()
                    );
                }
            } catch (Exception e2) {
                // 둘 다 실패하면 현재 시간 사용
            }
        }
        return LocalDateTime.now();
    }
}

