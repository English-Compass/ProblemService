package com.problemservice.ProblemService.repository;

import com.problemservice.ProblemService.model.entity.Quiz;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuizRepository extends JpaRepository<Quiz, Long> {
    
    List<Quiz> findByCategoryId(Long categoryId);
    
    List<Quiz> findByDifficultyLevel(String difficultyLevel);
    
    List<Quiz> findByQuestionType(String questionType);
}