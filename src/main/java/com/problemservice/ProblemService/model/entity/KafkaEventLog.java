package com.problemservice.ProblemService.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

/**
 * Kafka 이벤트 로그 엔티티
 * Problem Service에서 수신한 Kafka 이벤트를 저장하여 이벤트 추적 및 감사 로그 제공
 */
@Entity
@Table(name = "problem_service_event_log")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class KafkaEventLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    /**
     * 이벤트 고유 ID (이벤트 내부에 포함된 경우)
     */
    @Column(name = "event_id")
    private String eventId;

    /**
     * 이벤트 타입 (SESSION_COMPLETED, QUESTION_ANSWERED, ANALYSIS_COMPLETED 등)
     */
    @Column(name = "event_type", nullable = false, length = 100)
    private String eventType;

    /**
     * 이벤트 발생 소스
     */
    @Column(name = "event_source", nullable = false, length = 100)
    @Builder.Default
    private String eventSource = "Problem_Service";

    /**
     * Kafka 토픽 이름
     */
    @Column(name = "topic_name", nullable = false)
    private String topicName;

    /**
     * Kafka 파티션 번호
     */
    @Column(name = "partition_num")
    private Integer partitionNum;

    /**
     * Kafka 오프셋
     */
    @Column(name = "offset_num")
    private Long offsetNum;

    /**
     * 관련 사용자 ID
     */
    @Column(name = "user_id")
    private String userId;

    /**
     * 관련 세션 ID
     */
    @Column(name = "session_id")
    private String sessionId;

    /**
     * 관련 문제 ID
     */
    @Column(name = "question_id")
    private String questionId;

    /**
     * 전체 이벤트 데이터 (JSON 형태)
     */
    @Column(name = "event_payload", nullable = false, columnDefinition = "TEXT")
    private String eventPayload;

    /**
     * 처리 상태
     */
    @Enumerated(EnumType.STRING)
    @Column(name = "processing_status", nullable = false)
    @Builder.Default
    private ProcessingStatus processingStatus = ProcessingStatus.RECEIVED;

    /**
     * 에러 메시지 (처리 실패 시)
     */
    @Column(name = "error_message", columnDefinition = "TEXT")
    private String errorMessage;

    /**
     * 재시도 횟수
     */
    @Column(name = "retry_count")
    @Builder.Default
    private Integer retryCount = 0;

    /**
     * 이벤트 발생 시간 (이벤트 내부 타임스탬프)
     */
    @Column(name = "event_timestamp")
    private LocalDateTime eventTimestamp;

    /**
     * 이벤트 수신 시간
     */
    @CreationTimestamp
    @Column(name = "received_at", nullable = false, updatable = false)
    private LocalDateTime receivedAt;

    /**
     * 이벤트 처리 완료 시간
     */
    @Column(name = "processed_at")
    private LocalDateTime processedAt;

    /**
     * 처리 상태 Enum
     */
    public enum ProcessingStatus {
        RECEIVED,    // 수신됨
        PROCESSING,  // 처리 중
        COMPLETED,   // 처리 완료
        FAILED       // 처리 실패
    }

    /**
     * 처리 완료 상태로 업데이트
     */
    public void markAsCompleted() {
        this.processingStatus = ProcessingStatus.COMPLETED;
        this.processedAt = LocalDateTime.now();
    }

    /**
     * 처리 실패 상태로 업데이트
     */
    public void markAsFailed(String errorMessage) {
        this.processingStatus = ProcessingStatus.FAILED;
        this.errorMessage = errorMessage;
        this.processedAt = LocalDateTime.now();
        this.retryCount++;
    }

    /**
     * 처리 중 상태로 업데이트
     */
    public void markAsProcessing() {
        this.processingStatus = ProcessingStatus.PROCESSING;
    }
}

