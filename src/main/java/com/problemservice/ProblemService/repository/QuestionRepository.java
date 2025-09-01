package com.problemservice.ProblemService.repository;

import com.problemservice.ProblemService.model.entity.Question;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 문제 엔티티에 대한 데이터 접근 레이어
 * 다양한 조건으로 문제를 조회할 수 있는 메소드들 제공
 * 입력: 검색 조건 (카테고리, 난이도, 문제 유형)
 * 출력: 조건에 맞는 문제 목록
 */
@Repository
public interface QuestionRepository extends JpaRepository<Question, String> {
    
    /**
     * 주요 카테고리별 문제 조회
     * 입력: 주요 카테고리명 (예: "학업", "비즈니스")
     * 출력: 해당 주요 카테고리의 모든 문제 목록
     */
    List<Question> findByMajorCategory(String majorCategory);
    
    /**
     * 세부 카테고리별 문제 조회
     * 입력: 세부 카테고리명
     * 출력: 해당 세부 카테고리의 모든 문제 목록
     */
    List<Question> findByMinorCategory(String minorCategory);
    
    /**
     * 난이도별 문제 조회
     * 입력: 난이도 레벨 (1=초급, 2=중급, 3=고급)
     * 출력: 해당 난이도의 모든 문제 목록
     */
    List<Question> findByDifficultyLevel(Integer difficultyLevel);
    
    /**
     * 문제 유형별 조회
     * 입력: 문제 유형 ("Word" 또는 "Sentence")
     * 출력: 해당 유형의 모든 문제 목록
     */
    List<Question> findByQuestionType(String questionType);
    
    /**
     * 주요 카테고리와 난이도 조합 조회
     * 입력: 주요 카테고리명과 난이도 레벨
     * 출력: 조건을 만족하는 문제 목록
     */
    List<Question> findByMajorCategoryAndDifficultyLevel(String majorCategory, Integer difficultyLevel);
    
    /**
     * 여러 주요 카테고리와 난이도 조합 조회
     * 입력: 주요 카테고리 목록과 난이도 레벨
     * 출력: 카테고리 목록 중 하나에 속하고 해당 난이도인 문제 목록
     */
    List<Question> findByMajorCategoryInAndDifficultyLevel(List<String> majorCategories, Integer difficultyLevel);
    
    /**
     * 문제 ID 목록과 카테고리로 조회
     * 입력: 문제 ID 목록과 주요 카테고리 목록
     * 출력: ID 목록에 있고 카테고리 목록 중 하나에 속하는 문제 목록
     */
    List<Question> findByQuestionIdInAndMajorCategoryIn(List<String> questionIds, List<String> majorCategories);
    
    /**
     * 여러 주요 카테고리로 조회
     * 입력: 주요 카테고리 목록
     * 출력: 카테고리 목록 중 하나에 속하는 모든 문제 목록
     */
    List<Question> findByMajorCategoryIn(List<String> majorCategories);
    
    /**
     * 주요 카테고리와 문제 유형으로 조회
     * 입력: 주요 카테고리 목록과 문제 유형
     * 출력: 카테고리 목록 중 하나에 속하고 해당 유형인 문제 목록
     */
    List<Question> findByMajorCategoryInAndQuestionType(List<String> majorCategories, String questionType);
    
    /**
     * 주요 카테고리, 문제 유형, 난이도로 조회
     * 입력: 주요 카테고리 목록, 문제 유형, 난이도 레벨
     * 출력: 모든 조건을 만족하는 문제 목록
     */
    List<Question> findByMajorCategoryInAndQuestionTypeAndDifficultyLevel(List<String> majorCategories, String questionType, Integer difficultyLevel);
    
    /**
     * 카테고리별 문제 수 조회 (페이징 지원)
     */
    Page<Question> findByMajorCategoryIn(List<String> majorCategories, Pageable pageable);
    
    /**
     * 카테고리와 난이도별 문제 수 조회 (페이징 지원)
     */
    Page<Question> findByMajorCategoryInAndDifficultyLevel(List<String> majorCategories, Integer difficultyLevel, Pageable pageable);
    
    /**
     * 최근 생성된 문제 조회
     */
    @Query("SELECT q FROM Question q ORDER BY q.createdAt DESC")
    List<Question> findRecentQuestions(Pageable pageable);
    
    /**
     * 카테고리별 문제 개수 조회
     */
    @Query("SELECT COUNT(q) FROM Question q WHERE q.majorCategory = :category")
    Long countByMajorCategory(@Param("category") String category);
    
    /**
     * 난이도별 문제 개수 조회
     */
    @Query("SELECT COUNT(q) FROM Question q WHERE q.difficultyLevel = :level")
    Long countByDifficultyLevel(@Param("level") Integer level);
    
    /**
     * 특정 카테고리에서 랜덤하게 문제 선택 (페이징 사용)
     */
    @Query("SELECT q FROM Question q WHERE q.majorCategory IN (:categories) AND q.difficultyLevel = :difficultyLevel ORDER BY FUNCTION('RAND')")
    List<Question> findRandomQuestionsByCategories(@Param("categories") List<String> categories, @Param("difficultyLevel") Integer difficultyLevel, Pageable pageable);
    
    /**
     * 사용자가 아직 풀지 않은 문제 조회 (카테고리, 난이도 필터링)
     * 사용자가 답변한 적 없는 문제들을 카테고리와 난이도로 필터링하여 반환
     * 입력: 사용자 ID, 주요 카테고리 목록, 난이도 레벨
     * 출력: 사용자가 풀지 않은 문제 목록
     */
    @Query("SELECT q FROM Question q WHERE q.majorCategory IN (:categories) AND q.difficultyLevel = :difficultyLevel " +
           "AND q.questionId NOT IN (SELECT DISTINCT qa.questionId FROM QuestionAnswer qa " +
           "JOIN LearningSession ls ON qa.sessionId = ls.sessionId WHERE ls.userId = :userId)")
    List<Question> findUnsolvedQuestionsByUserAndCategoriesAndDifficulty(@Param("userId") String userId, 
                                                                         @Param("categories") List<String> categories, 
                                                                         @Param("difficultyLevel") Integer difficultyLevel);
}