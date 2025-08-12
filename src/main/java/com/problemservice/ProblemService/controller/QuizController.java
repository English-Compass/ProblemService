package com.problemservice.ProblemService.controller;

import com.problemservice.ProblemService.model.dto.QuizCreateDto;
import com.problemservice.ProblemService.model.dto.QuizResponseDto;
import com.problemservice.ProblemService.model.dto.QuizUpdateDto;
import com.problemservice.ProblemService.service.QuizService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/quizzes")
@RequiredArgsConstructor
public class QuizController {

    private final QuizService quizService;

    @PostMapping
    public ResponseEntity<QuizResponseDto> createQuiz(@Valid @RequestBody QuizCreateDto createDto) {
        QuizResponseDto createdQuiz = quizService.createQuiz(createDto);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdQuiz);
    }

    @GetMapping("/{id}")
    public ResponseEntity<QuizResponseDto> getQuizById(@PathVariable Long id) {
        QuizResponseDto quiz = quizService.getQuizById(id);
        return ResponseEntity.ok(quiz);
    }

    @GetMapping
    public ResponseEntity<Page<QuizResponseDto>> getAllQuizzes(Pageable pageable) {
        Page<QuizResponseDto> quizzes = quizService.getAllQuizzes(pageable);
        return ResponseEntity.ok(quizzes);
    }

    @PutMapping("/{id}")
    public ResponseEntity<QuizResponseDto> updateQuiz(
            @PathVariable Long id,
            @Valid @RequestBody QuizUpdateDto updateDto) {
        QuizResponseDto updatedQuiz = quizService.updateQuiz(id, updateDto);
        return ResponseEntity.ok(updatedQuiz);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteQuiz(@PathVariable Long id) {
        quizService.deleteQuiz(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/category/{categoryId}")
    public ResponseEntity<List<QuizResponseDto>> getQuizzesByCategory(@PathVariable Long categoryId) {
        List<QuizResponseDto> quizzes = quizService.getQuizzesByCategory(categoryId);
        return ResponseEntity.ok(quizzes);
    }

    @GetMapping("/difficulty/{level}")
    public ResponseEntity<List<QuizResponseDto>> getQuizzesByDifficultyLevel(@PathVariable String level) {
        List<QuizResponseDto> quizzes = quizService.getQuizzesByDifficultyLevel(level);
        return ResponseEntity.ok(quizzes);
    }

    @GetMapping("/type/{type}")
    public ResponseEntity<List<QuizResponseDto>> getQuizzesByQuestionType(@PathVariable String type) {
        List<QuizResponseDto> quizzes = quizService.getQuizzesByQuestionType(type);
        return ResponseEntity.ok(quizzes);
    }
}