package com.problemservice.ProblemService.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * SessionQuestion 응답 DTO
 * 세션에 포함된 문제 정보를 클라이언트에게 전달하기 위한 DTO
 * Hibernate lazy loading 문제를 해결하고 필요한 데이터만 노출
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class SessionQuestionResponseDto {

    /**
     * 세션-문제 연결 테이블의 고유 ID
     */
    private Long sessionQuestionId;

    /**
     * 학습 세션 ID
     */
    private String sessionId;

    /**
     * 문제 ID
     */
    private String questionId;

    /**
     * 세션 내에서의 문제 순서
     */
    private Integer questionOrder;

    /**
     * 문제가 속한 카테고리 목록
     */
    private List<String> categories;

    /**
     * 문제 상세 정보
     */
    private QuestionResponseDto question;
}