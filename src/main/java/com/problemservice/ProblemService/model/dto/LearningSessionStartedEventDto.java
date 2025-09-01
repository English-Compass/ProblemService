package com.problemservice.ProblemService.model.dto;

import com.problemservice.ProblemService.model.entity.LearningSession.SessionType;
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
public class LearningSessionStartedEventDto {

    private String sessionId;
    private String userId;
    private SessionType sessionType;
    private String difficultyLevel;
    private Map<String, Object> selectedCategories;
    private Integer totalQuestions;
    private LocalDateTime startedAt;
    private String eventType = "SESSION_STARTED";
    private LocalDateTime eventTimestamp;
}