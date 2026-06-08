package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.event.SessionCompletedApplicationEvent;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.transaction.event.TransactionPhase;
import org.springframework.transaction.event.TransactionalEventListener;

/**
 * DB 커밋 완료 후 Kafka 이벤트를 발행하는 핸들러.
 * AFTER_COMMIT 단계에서 실행되므로 DB 롤백 시 Kafka 발행이 일어나지 않는다.
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class SessionCompletedEventHandler {

    private final EventPublisherService eventPublisherService;

    @Async
    @TransactionalEventListener(phase = TransactionPhase.AFTER_COMMIT)
    public void handle(SessionCompletedApplicationEvent event) {
        log.info("DB commit confirmed. Publishing Kafka event for session: {}",
                event.getPayload().getSessionId());
        eventPublisherService.publishSessionCompletedEvent(event.getPayload());
    }
}
