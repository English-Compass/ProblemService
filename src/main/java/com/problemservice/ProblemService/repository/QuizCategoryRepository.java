package com.problemservice.ProblemService.repository;

import com.problemservice.ProblemService.model.entity.QuizCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuizCategoryRepository extends JpaRepository<QuizCategory, Long> {
}