package com.problemservice.ProblemService.model.event;

import com.problemservice.ProblemService.model.dto.SessionCompletedEventDto;
import org.springframework.context.ApplicationEvent;

/**
 * DB 커밋 이후 Kafka 발행을 보장하기 위한 Spring Application Event.
 * LearningSessionService가 발행하고, SessionCompletedEventHandler가 AFTER_COMMIT 단계에서 수신한다.
 */
public class SessionCompletedApplicationEvent extends ApplicationEvent {

    private final SessionCompletedEventDto payload;

    public SessionCompletedApplicationEvent(Object source, SessionCompletedEventDto payload) {
        super(source);
        this.payload = payload;
    }

    public SessionCompletedEventDto getPayload() {
        return payload;
    }
}
