package com.problemservice.ProblemService.model.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

/**
 * UserService로부터 받는 사용자 프로필 업데이트 이벤트 DTO
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserProfileEvent {

    @JsonProperty("eventId")
    private String eventId; // 이벤트 고유 ID

    @JsonProperty("eventType")
    private String eventType; // PROFILE_CREATED, PROFILE_UPDATED, PROFILE_DELETED

    @JsonProperty("userId")
    private String userId; // 사용자 ID

    @JsonProperty("difficultyLevel")
    private Integer difficultyLevel; // 1 (하), 2 (중), 3 (상)

    @JsonProperty("selectedCategories")
    private List<String> selectedCategories; // ["학업", "비즈니스", "여행", "일상생활"]

    @JsonProperty("preferredQuestionTypes")
    private List<String> preferredQuestionTypes; // ["WORD", "SENTENCE", "CONVERSATION"]

    @JsonProperty("eventTimestamp")
    private LocalDateTime eventTimestamp; // 이벤트 발생 시간

    @JsonProperty("eventSource")
    private String eventSource; // "User_Service"
}

