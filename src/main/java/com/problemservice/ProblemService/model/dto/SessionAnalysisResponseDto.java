package com.problemservice.ProblemService.model.dto;

import com.problemservice.ProblemService.model.entity.LearningSession.SessionStatus;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

/**
 * 학습 분석 서비스에서 요구하는 세션/문항/이벤트 정보를 제공하기 위한 응답 DTO.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SessionAnalysisResponseDto {

    private SessionInfo session;
    private List<QuestionRecord> questions;
    private List<EventRecord> events;

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class SessionInfo {
        private String sessionId;
        private String userId;
        private SessionType sessionType;
        private SessionStatus status;
        private LocalDateTime startedAt;
        private LocalDateTime completedAt;
        private LocalDateTime createdAt;
        private LocalDateTime updatedAt;
        private Map<String, Object> metadata;
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class QuestionRecord {
        private String questionId;
        private String questionType;
        private String majorCategory;
        private String minorCategory;
        private Integer difficultyLevel;
        private String userAnswer;
        private Boolean isCorrect;
        private Integer timeSpent;
        private LocalDateTime answeredAt;
        private Integer solveCount;
        private Map<String, Object> metadata;
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class EventRecord {
        private String eventId;
        private String eventType;
        private String sessionId;
        private String userId;
        private String sessionType;
        private LocalDateTime createdAt;
        private Map<String, Object> metadata;
    }
}

