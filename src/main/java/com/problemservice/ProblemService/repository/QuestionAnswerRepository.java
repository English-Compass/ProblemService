package com.problemservice.ProblemService.repository;

import com.problemservice.ProblemService.model.entity.QuestionAnswer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
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
    
    /**
     * 특정 사용자의 모든 답안 조회 (학습 프로필 분석용)
     * 학습 세션을 통해 사용자 ID로 필터링하여 모든 답안 조회
     * 입력: 사용자 ID
     * 출력: 해당 사용자의 모든 답안 목록
     */
    @Query("SELECT qa FROM QuestionAnswer qa JOIN LearningSession ls ON qa.sessionId = ls.sessionId WHERE ls.userId = :userId ORDER BY qa.answeredAt DESC")
    List<QuestionAnswer> findByUserId(@Param("userId") String userId);
    
    /**
     * 특정 사용자의 정답 답안들 조회 (복습용)
     * 학습 세션을 통해 사용자 ID로 필터링하여 정답인 답안들만 조회
     * 입력: 사용자 ID, 정답 여부 (true)
     * 출력: 해당 사용자가 정답을 맞힌 문제들의 답안 목록
     */
    @Query("SELECT qa FROM QuestionAnswer qa JOIN LearningSession ls ON qa.sessionId = ls.sessionId WHERE ls.userId = :userId AND qa.isCorrect = :isCorrect")
    List<QuestionAnswer> findByUserIdAndIsCorrect(@Param("userId") String userId, @Param("isCorrect") Boolean isCorrect);
    
    /**
     * 특정 사용자의 정답 답안들을 카테고리별로 조회 (복습용)
     * 입력: 사용자 ID, 카테고리 목록, 정답 여부
     * 출력: 해당 사용자가 해당 카테고리에서 정답을 맞힌 문제들의 답안 목록
     */
    @Query("SELECT qa FROM QuestionAnswer qa JOIN LearningSession ls ON qa.sessionId = ls.sessionId JOIN qa.question q WHERE ls.userId = :userId AND q.majorCategory IN :categories AND qa.isCorrect = :isCorrect ORDER BY qa.answeredAt DESC")
    List<QuestionAnswer> findByUserIdAndCategoriesAndIsCorrect(@Param("userId") String userId, @Param("categories") List<String> categories, @Param("isCorrect") Boolean isCorrect);
    
    /**
     * 특정 사용자의 오답 답안들을 카테고리별로 조회 (오답노트용)
     * 틀린 횟수가 많은 순서로 정렬하여 반환
     * 입력: 사용자 ID, 카테고리 목록, 오답 여부 (false)
     * 출력: 해당 사용자가 해당 카테고리에서 틀린 문제들의 답안 목록
     */
    @Query("SELECT qa FROM QuestionAnswer qa JOIN LearningSession ls ON qa.sessionId = ls.sessionId JOIN qa.question q WHERE ls.userId = :userId AND q.majorCategory IN :categories AND qa.isCorrect = false ORDER BY qa.solveCount DESC, qa.answeredAt DESC")
    List<QuestionAnswer> findWrongAnswersByUserIdAndCategories(@Param("userId") String userId, @Param("categories") List<String> categories);
}