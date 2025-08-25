package com.problemservice.ProblemService.repository;

import com.problemservice.ProblemService.model.entity.SessionQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * 세션-문제 연관관계 엔티티에 대한 데이터 접근 레이어
 * 세션 내 문제 순서 관리 및 문제-세션 연결 정보 처리
 * 입력: 세션 ID, 문제 ID, 문제 순서
 * 출력: 세션별 문제 목록 및 순서 정보
 */
@Repository
public interface SessionQuestionRepository extends JpaRepository<SessionQuestion, Long> {

    /**
     * 세션의 모든 문제를 순서대로 조회
     * 입력: 세션 ID
     * 출력: 문제 순서로 정렬된 세션-문제 연관관계 목록
     */
    List<SessionQuestion> findBySessionIdOrderByQuestionOrder(String sessionId);

    /**
     * 특정 세션의 모든 문제 조회 (순서 정렬 없음)
     * 입력: 세션 ID
     * 출력: 해당 세션의 모든 세션-문제 연관관계 목록
     */
    List<SessionQuestion> findBySessionId(String sessionId);

    /**
     * 세션과 문제 ID로 특정 연관관계 조회
     * 입력: 세션 ID, 문제 ID
     * 출력: 조건을 만족하는 세션-문제 연관관계 (Optional로 래핑)
     */
    Optional<SessionQuestion> findBySessionIdAndQuestionId(String sessionId, String questionId);

    /**
     * 세션 내 특정 순서의 문제 조회
     * 입력: 세션 ID, 문제 순서
     * 출력: 해당 순서의 세션-문제 연관관계 (Optional로 래핑)
     */
    Optional<SessionQuestion> findBySessionIdAndQuestionOrder(String sessionId, Integer questionOrder);

    /**
     * 특정 세션의 문제 총 개수 조회 (JPQL 사용)
     * 입력: 세션 ID
     * 출력: 해당 세션에 포함된 문제의 총 개수
     */
    @Query("SELECT COUNT(sq) FROM SessionQuestion sq WHERE sq.sessionId = :sessionId")
    Long countBySessionId(@Param("sessionId") String sessionId);

    /**
     * 세션 내 문제의 최대 순서 번호 조회 (JPQL 사용)
     * 입력: 세션 ID
     * 출력: 해당 세션에서 가장 큰 문제 순서 번호
     */
    @Query("SELECT MAX(sq.questionOrder) FROM SessionQuestion sq WHERE sq.sessionId = :sessionId")
    Integer getMaxQuestionOrderBySessionId(@Param("sessionId") String sessionId);

    /**
     * 특정 세션의 모든 문제 연관관계 삭제
     * 입력: 세션 ID
     * 출력: 없음 (해당 세션의 모든 문제 연관관계가 삭제됨)
     */
    void deleteBySessionId(String sessionId);
}