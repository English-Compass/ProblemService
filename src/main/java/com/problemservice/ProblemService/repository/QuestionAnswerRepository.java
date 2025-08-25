package com.problemservice.ProblemService.repository;

import com.problemservice.ProblemService.model.entity.QuestionAnswer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 문제 답안 엔티티에 대한 데이터 접근 레이어
 * 사용자 답안 조회 및 정답/오답 통계 분석 기능 제공
 * 입력: 세션 ID, 문제 ID, 세션 유형, 정답 여부
 * 출력: 조건에 맞는 답안 목록
 */
@Repository
public interface QuestionAnswerRepository extends JpaRepository<QuestionAnswer, Long> {
    
    /**
     * 특정 세션의 모든 답안 조회
     * 입력: 세션 ID
     * 출력: 해당 세션에서 제출된 모든 답안 목록
     */
    List<QuestionAnswer> findBySessionId(String sessionId);
    
    /**
     * 특정 문제에 대한 모든 답안 조회
     * 입력: 문제 ID
     * 출력: 해당 문제에 대해 제출된 모든 답안 목록 (모든 세션 포함)
     */
    List<QuestionAnswer> findByQuestionId(String questionId);
    
    /**
     * 특정 세션의 특정 문제에 대한 답안 조회
     * 입력: 세션 ID, 문제 ID
     * 출력: 해당 세션에서 해당 문제에 대해 제출된 답안 목록
     */
    List<QuestionAnswer> findBySessionIdAndQuestionId(String sessionId, String questionId);
    
    /**
     * 특정 세션 유형의 모든 답안 조회
     * 입력: 세션 유형 ("PRACTICE", "REVIEW", "WRONG_ANSWER")
     * 출력: 해당 유형 세션에서 제출된 모든 답안 목록
     */
    List<QuestionAnswer> findBySessionType(String sessionType);
    
    /**
     * 세션 내 정답/오답 답안 필터링 조회
     * 입력: 세션 ID, 정답 여부 (true=정답, false=오답)
     * 출력: 해당 세션에서 정답 여부 조건을 만족하는 답안 목록
     */
    List<QuestionAnswer> findBySessionIdAndIsCorrect(String sessionId, Boolean isCorrect);
}