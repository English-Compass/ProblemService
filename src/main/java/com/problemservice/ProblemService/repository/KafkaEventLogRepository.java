package com.problemservice.ProblemService.repository;

import com.problemservice.ProblemService.model.entity.KafkaEventLog;
import com.problemservice.ProblemService.model.entity.KafkaEventLog.ProcessingStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

/**
 * Kafka 이벤트 로그 리포지토리
 * 이벤트 조회 및 통계를 위한 데이터 접근 계층
 */
@Repository
public interface KafkaEventLogRepository extends JpaRepository<KafkaEventLog, Long> {

    /**
     * 이벤트 타입별 조회
     */
    List<KafkaEventLog> findByEventType(String eventType);

    /**
     * 특정 사용자의 이벤트 조회
     */
    List<KafkaEventLog> findByUserIdOrderByEventTimestampDesc(String userId);

    /**
     * 특정 사용자의 이벤트 페이징 조회
     */
    Page<KafkaEventLog> findByUserId(String userId, Pageable pageable);

    /**
     * 특정 세션의 이벤트 조회
     */
    List<KafkaEventLog> findBySessionIdOrderByEventTimestampAsc(String sessionId);

    /**
     * 토픽별 이벤트 조회
     */
    List<KafkaEventLog> findByTopicNameOrderByReceivedAtDesc(String topicName);

    /**
     * 처리 상태별 조회
     */
    List<KafkaEventLog> findByProcessingStatus(ProcessingStatus status);

    /**
     * 실패한 이벤트 조회 (재시도 가능)
     */
    @Query("SELECT e FROM KafkaEventLog e WHERE e.processingStatus = 'FAILED' AND e.retryCount < :maxRetry ORDER BY e.receivedAt DESC")
    List<KafkaEventLog> findFailedEventsForRetry(@Param("maxRetry") int maxRetry);

    /**
     * 특정 사용자의 특정 타입 이벤트 조회
     */
    List<KafkaEventLog> findByUserIdAndEventTypeOrderByEventTimestampDesc(String userId, String eventType);

    /**
     * 기간별 이벤트 조회
     */
    @Query("SELECT e FROM KafkaEventLog e WHERE e.receivedAt BETWEEN :startDate AND :endDate ORDER BY e.receivedAt DESC")
    List<KafkaEventLog> findByDateRange(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

    /**
     * 특정 사용자의 기간별 이벤트 조회
     */
    @Query("SELECT e FROM KafkaEventLog e WHERE e.userId = :userId AND e.receivedAt BETWEEN :startDate AND :endDate ORDER BY e.receivedAt DESC")
    List<KafkaEventLog> findByUserIdAndDateRange(
        @Param("userId") String userId, 
        @Param("startDate") LocalDateTime startDate, 
        @Param("endDate") LocalDateTime endDate
    );

    /**
     * 이벤트 ID로 조회 (중복 체크용)
     */
    Optional<KafkaEventLog> findByEventId(String eventId);

    /**
     * 토픽과 오프셋으로 조회 (중복 체크용)
     */
    Optional<KafkaEventLog> findByTopicNameAndPartitionNumAndOffsetNum(String topicName, Integer partitionNum, Long offsetNum);

    /**
     * 이벤트 타입별 개수 조회
     */
    @Query("SELECT e.eventType, COUNT(e) FROM KafkaEventLog e GROUP BY e.eventType")
    List<Object[]> countByEventType();

    /**
     * 처리 상태별 개수 조회
     */
    @Query("SELECT e.processingStatus, COUNT(e) FROM KafkaEventLog e GROUP BY e.processingStatus")
    List<Object[]> countByProcessingStatus();

    /**
     * 특정 사용자의 최근 이벤트 N개 조회
     */
    Page<KafkaEventLog> findByUserIdOrderByReceivedAtDesc(String userId, Pageable pageable);

    /**
     * 오래된 이벤트 삭제를 위한 조회 (보관 기간 초과)
     */
    @Query("SELECT e FROM KafkaEventLog e WHERE e.receivedAt < :cutoffDate")
    List<KafkaEventLog> findOldEvents(@Param("cutoffDate") LocalDateTime cutoffDate);

    /**
     * 특정 세션의 완료 이벤트 존재 여부 확인
     */
    boolean existsBySessionIdAndEventType(String sessionId, String eventType);
}

