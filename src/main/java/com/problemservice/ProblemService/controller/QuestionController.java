package com.problemservice.ProblemService.controller;

import com.problemservice.ProblemService.model.dto.QuestionCreateDto;
import com.problemservice.ProblemService.model.dto.QuestionResponseDto;
import com.problemservice.ProblemService.model.dto.QuestionUpdateDto;
import com.problemservice.ProblemService.service.QuestionService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/questions")
@RequiredArgsConstructor
public class QuestionController {

    private final QuestionService questionService;

    @PostMapping
    public ResponseEntity<QuestionResponseDto> createQuestion(@Valid @RequestBody QuestionCreateDto createDto) {
        QuestionResponseDto createdQuestion = questionService.createQuestion(createDto);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdQuestion);
    }

    @GetMapping("/{id}")
    public ResponseEntity<QuestionResponseDto> getQuestionById(@PathVariable String id) {
        QuestionResponseDto question = questionService.getQuestionById(id);
        return ResponseEntity.ok(question);
    }

    @GetMapping
    public ResponseEntity<Page<QuestionResponseDto>> getAllQuestions(Pageable pageable) {
        Page<QuestionResponseDto> questions = questionService.getAllQuestions(pageable);
        return ResponseEntity.ok(questions);
    }

    @PutMapping("/{id}")
    public ResponseEntity<QuestionResponseDto> updateQuestion(
            @PathVariable String id,
            @Valid @RequestBody QuestionUpdateDto updateDto) {
        QuestionResponseDto updatedQuestion = questionService.updateQuestion(id, updateDto);
        return ResponseEntity.ok(updatedQuestion);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteQuestion(@PathVariable String id) {
        questionService.deleteQuestion(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/category/{category}")
    public ResponseEntity<List<QuestionResponseDto>> getQuestionsByCategory(@PathVariable String category) {
        List<QuestionResponseDto> questions = questionService.getQuestionsByCategory(category);
        return ResponseEntity.ok(questions);
    }

    @GetMapping("/difficulty/{level}")
    public ResponseEntity<List<QuestionResponseDto>> getQuestionsByDifficultyLevel(@PathVariable String level) {
        List<QuestionResponseDto> questions = questionService.getQuestionsByDifficultyLevel(level);
        return ResponseEntity.ok(questions);
    }

    @GetMapping("/type/{type}")
    public ResponseEntity<List<QuestionResponseDto>> getQuestionsByQuestionType(@PathVariable String type) {
        List<QuestionResponseDto> questions = questionService.getQuestionsByQuestionType(type);
        return ResponseEntity.ok(questions);
    }
}