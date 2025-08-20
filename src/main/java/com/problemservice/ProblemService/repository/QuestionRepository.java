package com.problemservice.ProblemService.repository;

import com.problemservice.ProblemService.model.entity.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionRepository extends JpaRepository<Question, String> {
    
    List<Question> findByMajorCategory(String majorCategory);
    
    List<Question> findByMinorCategory(String minorCategory);
    
    List<Question> findByDifficultyLevel(Integer difficultyLevel);
    
    List<Question> findByQuestionType(String questionType);
}