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
 * 학습 세션 데이터 접근 레이어
 * 세션 CRUD, 필터링, 통계 쿼리 제공
 */
@Repository
public interface LearningSessionRepository extends JpaRepository<LearningSession, String> {

    /**
     * 특정 사용자의 전체 학습 세션 목록 조회
     * 사용자의 학습 이력 분석이나 통계 생성에 활용
     * @param userId 대상 사용자의 식별자
     * @return 해당 사용자의 모든 학습 세션 목록
     */
    List<LearningSession> findByUserId(String userId);

    /**
     * 특정 사용자의 학습 세션을 페이지 단위로 조회
     * 대용량 데이터 처리를 위한 효율적인 조회 방식 제공
     * @param userId 대상 사용자의 식별자
     * @param pageable 페이지 설정 (페이지 수, 크기, 정렬 조건)
     * @return 페이지네이션된 학습 세션 목록
     */
    Page<LearningSession> findByUserId(String userId, Pageable pageable);

    /**
     * 사용자의 특정 상태 학습 세션 조회
     * 진행 중인 세션, 완료된 세션 등 상태별 필터링 조회
     * @param userId 대상 사용자의 식별자
     * @param status 세션 상태 (STARTED, IN_PROGRESS, COMPLETED)
     * @return 해당 상태의 학습 세션 목록
     */
    List<LearningSession> findByUserIdAndStatus(String userId, SessionStatus status);

    /**
     * 사용자의 특정 타입 학습 세션 조회
     * 연습, 복습, 오답노트 등 세션 타입별 필터링 조회
     * @param userId 대상 사용자의 식별자
     * @param sessionType 세션 타입 (PRACTICE, REVIEW, WRONG_ANSWER)
     * @return 해당 타입의 학습 세션 목록
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
    
    /**
     * 사용자의 최근 완료된 세션 조회
     */
    @Query("SELECT ls FROM LearningSession ls WHERE ls.userId = :userId AND ls.status = 'COMPLETED' ORDER BY ls.completedAt DESC")
    List<LearningSession> findRecentCompletedSessions(@Param("userId") String userId, Pageable pageable);
    
    /**
     * 세션 유형별 통계 조회
     */
    @Query("SELECT ls.sessionType, COUNT(ls), AVG(ls.progressPercentage) FROM LearningSession ls WHERE ls.userId = :userId AND ls.status = 'COMPLETED' GROUP BY ls.sessionType")
    List<Object[]> getSessionStatsByType(@Param("userId") String userId);
    
    /**
     * 활성 세션 조회 (시작됨 또는 진행 중)
     */
    @Query("SELECT ls FROM LearningSession ls WHERE ls.userId = :userId AND ls.status IN ('STARTED', 'IN_PROGRESS') ORDER BY ls.startedAt DESC")
    List<LearningSession> findActiveSessions(@Param("userId") String userId);
    
    /**
     * 기간별 세션 완료 수 조회
     */
    @Query("SELECT COUNT(ls) FROM LearningSession ls WHERE ls.userId = :userId AND ls.status = 'COMPLETED' AND ls.completedAt BETWEEN :startDate AND :endDate")
    Long countCompletedSessionsInDateRange(@Param("userId") String userId, @Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);
}