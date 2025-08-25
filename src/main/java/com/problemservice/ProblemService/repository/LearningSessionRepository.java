package com.problemservice.ProblemService.repository;

import com.problemservice.ProblemService.model.entity.LearningSession;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionStatus;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

/**
 * 학습 세션 엔티티에 대한 데이터 접근 레이어
 * 사용자별 세션 조회, 상태별 필터링, 통계 쿼리 기능 제공
 * 입력: 사용자 ID, 세션 상태, 세션 유형, 날짜 범위
 * 출력: 조건에 맞는 학습 세션 목록 및 통계 데이터
 */
@Repository
public interface LearningSessionRepository extends JpaRepository<LearningSession, String> {

    /**
     * 특정 사용자의 모든 학습 세션 조회
     * 입력: 사용자 ID
     * 출력: 해당 사용자의 모든 학습 세션 목록
     */
    List<LearningSession> findByUserId(String userId);

    /**
     * 특정 사용자의 학습 세션을 페이지 단위로 조회
     * 입력: 사용자 ID, 페이징 정보 (페이지 번호, 크기, 정렬)
     * 출력: 페이징 처리된 학습 세션 목록
     */
    Page<LearningSession> findByUserId(String userId, Pageable pageable);

    /**
     * 사용자와 세션 상태로 필터링하여 조회
     * 입력: 사용자 ID, 세션 상태 (STARTED, IN_PROGRESS, COMPLETED)
     * 출력: 조건을 만족하는 학습 세션 목록
     */
    List<LearningSession> findByUserIdAndStatus(String userId, SessionStatus status);

    /**
     * 사용자와 세션 유형으로 필터링하여 조회
     * 입력: 사용자 ID, 세션 유형 (PRACTICE, REVIEW, WRONG_ANSWER)
     * 출력: 조건을 만족하는 학습 세션 목록
     */
    List<LearningSession> findByUserIdAndSessionType(String userId, SessionType sessionType);

    /**
     * 사용자, 세션 유형, 상태로 필터링하여 조회
     * 입력: 사용자 ID, 세션 유형, 세션 상태
     * 출력: 모든 조건을 만족하는 학습 세션 목록
     */
    List<LearningSession> findByUserIdAndSessionTypeAndStatus(String userId, SessionType sessionType, SessionStatus status);

    /**
     * 특정 상태의 첫 번째 세션 조회 (가장 최근 세션)
     * 입력: 사용자 ID, 세션 상태
     * 출력: 조건을 만족하는 첫 번째 세션 (Optional로 래핑)
     */
    Optional<LearningSession> findFirstByUserIdAndStatus(String userId, SessionStatus status);

    /**
     * 날짜 범위 내의 사용자 세션 조회 (JPQL 사용)
     * 입력: 사용자 ID, 시작 날짜, 종료 날짜
     * 출력: 해당 기간 내에 생성된 학습 세션 목록
     */
    @Query("SELECT ls FROM LearningSession ls WHERE ls.userId = :userId AND ls.createdAt BETWEEN :startDate AND :endDate")
    List<LearningSession> findByUserIdAndDateRange(@Param("userId") String userId, 
                                                    @Param("startDate") LocalDateTime startDate, 
                                                    @Param("endDate") LocalDateTime endDate);

    /**
     * 사용자의 특정 상태 세션 개수 조회 (JPQL 사용)
     * 입력: 사용자 ID, 세션 상태
     * 출력: 해당 상태의 세션 총 개수
     */
    @Query("SELECT COUNT(ls) FROM LearningSession ls WHERE ls.userId = :userId AND ls.status = :status")
    Long countByUserIdAndStatus(@Param("userId") String userId, @Param("status") SessionStatus status);

    /**
     * 사용자의 완료된 세션들의 평균 진행률 계산 (JPQL 사용)
     * 입력: 사용자 ID
     * 출력: 완료된 세션들의 평균 진행률 (0.0 ~ 100.0)
     */
    @Query("SELECT AVG(ls.progressPercentage) FROM LearningSession ls WHERE ls.userId = :userId AND ls.status = 'COMPLETED'")
    Double getAverageProgressByUserId(@Param("userId") String userId);
}