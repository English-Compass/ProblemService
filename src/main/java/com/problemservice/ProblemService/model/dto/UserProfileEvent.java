package com.problemservice.ProblemService.model.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

/**
 * UserService로부터 받는 사용자 프로필 업데이트 이벤트 DTO
 * 
 * 실제 이벤트 형식:
 * {
 *   "userId": "...",
 *   "categories": {"TRAVEL": ["BACKPACKING"], "STUDY": ["DEPARTMENT_CONVERSATION"]},
 *   "difficulty": 2,
 *   "updatedAt": "2025-11-20T08:09:54.905",
 *   "eventType": "DIFFICULTY" | "CATEGORIES"
 * }
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserProfileEvent {

    @JsonProperty("eventId")
    private String eventId; // 이벤트 고유 ID (선택)

    @JsonProperty("eventType")
    private String eventType; // DIFFICULTY, CATEGORIES, PROFILE_CREATED, PROFILE_UPDATED 등

    @JsonProperty("userId")
    private String userId; // 사용자 ID

    @JsonProperty("difficulty")
    private Integer difficulty; // 난이도 (1, 2, 3) - eventType이 "DIFFICULTY"일 때 사용

    @JsonProperty("difficultyLevel")
    private Integer difficultyLevel; // 하위 호환성을 위한 필드 (difficulty와 동일)

    @JsonProperty("categories")
    private Map<String, List<String>> categories; // {"TRAVEL": ["BACKPACKING"], "STUDY": ["DEPARTMENT_CONVERSATION"]}

    @JsonProperty("selectedCategories")
    private List<String> selectedCategories; // 하위 호환성을 위한 필드 (categories를 평탄화)

    @JsonProperty("preferredQuestionTypes")
    private List<String> preferredQuestionTypes; // ["WORD", "SENTENCE", "CONVERSATION"]

    @JsonProperty("updatedAt")
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS")
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    private LocalDateTime updatedAt; // 이벤트 발생 시간

    @JsonProperty("eventTimestamp")
    private LocalDateTime eventTimestamp; // 하위 호환성을 위한 필드 (updatedAt과 동일)

    @JsonProperty("eventSource")
    private String eventSource; // "User_Service"
}

