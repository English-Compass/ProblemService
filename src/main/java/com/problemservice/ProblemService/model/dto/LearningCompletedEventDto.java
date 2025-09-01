package com.problemservice.ProblemService.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Map;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class LearningCompletedEventDto {

    private String eventId;
    private LocalDateTime timestamp;
    private String sessionId;
    private String userId;
    private String eventType = "SESSION_COMPLETED";
    private String eventSource = "Problem_Service";
    private Map<String, Object> metadata;
}