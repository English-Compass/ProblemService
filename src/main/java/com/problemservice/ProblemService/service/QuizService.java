package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.dto.QuizCreateDto;
import com.problemservice.ProblemService.model.dto.QuizResponseDto;
import com.problemservice.ProblemService.model.dto.QuizUpdateDto;
import com.problemservice.ProblemService.model.entity.Quiz;
import com.problemservice.ProblemService.model.entity.QuizCategory;
import com.problemservice.ProblemService.repository.QuizCategoryRepository;
import com.problemservice.ProblemService.repository.QuizRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class QuizService {

    private final QuizRepository quizRepository;
    private final QuizCategoryRepository quizCategoryRepository;

    @Transactional
    public QuizResponseDto createQuiz(QuizCreateDto createDto) {
        QuizCategory category = quizCategoryRepository.findById(createDto.getCategoryId())
                .orElseThrow(() -> new RuntimeException("Category not found"));

        Quiz quiz = Quiz.builder()
                .category(category)
                .question(createDto.getQuestion())
                .answer(createDto.getAnswer())
                .difficultyLevel(createDto.getDifficultyLevel())
                .questionType(createDto.getQuestionType())
                .keyword(createDto.getKeyword())
                .build();

        Quiz savedQuiz = quizRepository.save(quiz);
        return convertToResponseDto(savedQuiz);
    }

    public QuizResponseDto getQuizById(Long id) {
        Quiz quiz = quizRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Quiz not found"));
        return convertToResponseDto(quiz);
    }

    public Page<QuizResponseDto> getAllQuizzes(Pageable pageable) {
        Page<Quiz> quizPage = quizRepository.findAll(pageable);
        return quizPage.map(this::convertToResponseDto);
    }

    @Transactional
    public QuizResponseDto updateQuiz(Long id, QuizUpdateDto updateDto) {
        Quiz quiz = quizRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Quiz not found"));

        QuizCategory category = quizCategoryRepository.findById(updateDto.getCategoryId())
                .orElseThrow(() -> new RuntimeException("Category not found"));

        quiz.setCategory(category);
        quiz.setQuestion(updateDto.getQuestion());
        quiz.setAnswer(updateDto.getAnswer());
        quiz.setDifficultyLevel(updateDto.getDifficultyLevel());
        quiz.setQuestionType(updateDto.getQuestionType());
        quiz.setKeyword(updateDto.getKeyword());

        Quiz savedQuiz = quizRepository.save(quiz);
        return convertToResponseDto(savedQuiz);
    }

    @Transactional
    public void deleteQuiz(Long id) {
        Quiz quiz = quizRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Quiz not found"));
        quizRepository.deleteById(id);
    }

    public List<QuizResponseDto> getQuizzesByCategory(Long categoryId) {
        List<Quiz> quizzes = quizRepository.findByCategoryId(categoryId);
        return quizzes.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    public List<QuizResponseDto> getQuizzesByDifficultyLevel(String difficultyLevel) {
        List<Quiz> quizzes = quizRepository.findByDifficultyLevel(difficultyLevel);
        return quizzes.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    public List<QuizResponseDto> getQuizzesByQuestionType(String questionType) {
        List<Quiz> quizzes = quizRepository.findByQuestionType(questionType);
        return quizzes.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    private QuizResponseDto convertToResponseDto(Quiz quiz) {
        return QuizResponseDto.builder()
                .id(quiz.getId())
                .categoryId(quiz.getCategory().getId())
                .categoryName(quiz.getCategory().getName())
                .question(quiz.getQuestion())
                .answer(quiz.getAnswer())
                .difficultyLevel(quiz.getDifficultyLevel())
                .questionType(quiz.getQuestionType())
                .keyword(quiz.getKeyword())
                .createdAt(quiz.getCreatedAt())
                .updatedAt(quiz.getUpdatedAt())
                .build();
    }
}