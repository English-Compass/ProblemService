package com.problemservice.ProblemService.repository;

import com.problemservice.ProblemService.model.entity.QuestionAnswer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionAnswerRepository extends JpaRepository<QuestionAnswer, Long> {
    
    List<QuestionAnswer> findBySessionId(String sessionId);
    
    List<QuestionAnswer> findByQuestionId(String questionId);
    
    List<QuestionAnswer> findBySessionIdAndQuestionId(String sessionId, String questionId);
    
    List<QuestionAnswer> findBySessionType(String sessionType);
    
    List<QuestionAnswer> findBySessionIdAndIsCorrect(String sessionId, Boolean isCorrect);
}