package com.problemservice.ProblemService.repository;

import com.problemservice.ProblemService.model.entity.Question;
import org.springframework.data.jpa.repository.JpaRepository;
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
}