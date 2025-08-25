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

/**
 * 언어학습 퀴즈 문제 관리를 위한 REST API 컨트롤러
 * 문제 생성, 조회, 수정, 삭제 및 다양한 필터링 기능을 제공합니다.
 */
@RestController
@RequestMapping("/api/questions")
@RequiredArgsConstructor
public class QuestionController {

    private final QuestionService questionService;

    /**
     * 새로운 언어학습 퀴즈 문제를 생성합니다
     * 
     * @param createDto 문제 생성에 필요한 데이터 (제목, 내용, 분류, 난이도, 유형, 선택지 등)
     * @return 생성된 문제 정보를 포함한 ResponseEntity
     */
    @PostMapping
    public ResponseEntity<QuestionResponseDto> createQuestion(@Valid @RequestBody QuestionCreateDto createDto) {
        // 1. 유효성 검증이 완료된 문제 생성 데이터로 새 문제를 생성
        QuestionResponseDto createdQuestion = questionService.createQuestion(createDto);
        // 2. HTTP 201 Created 상태와 함께 생성된 문제 정보를 반환
        return ResponseEntity.status(HttpStatus.CREATED).body(createdQuestion);
    }

    /**
     * 문제 ID로 특정 언어학습 퀴즈 문제를 조회합니다
     * 
     * @param id 조회할 문제의 고유 식별자
     * @return 조회된 문제 정보를 포함한 ResponseEntity
     */
    @GetMapping("/{id}")
    public ResponseEntity<QuestionResponseDto> getQuestionById(@PathVariable String id) {
        // 1. 제공된 문제 ID로 데이터베이스에서 문제를 조회
        QuestionResponseDto question = questionService.getQuestionById(id);
        // 2. HTTP 200 OK 상태와 함께 조회된 문제 정보를 반환
        return ResponseEntity.ok(question);
    }

    /**
     * 모든 언어학습 퀴즈 문제를 페이지네이션을 지원하여 조회합니다
     * 
     * @param pageable 페이지네이션 설정 (페이지 번호, 크기, 정렬 조건)
     * @return 페이지네이션된 문제 목록을 포함한 ResponseEntity
     */
    @GetMapping
    public ResponseEntity<Page<QuestionResponseDto>> getAllQuestions(Pageable pageable) {
        // 1. 페이지네이션 설정에 따라 모든 문제를 조회
        Page<QuestionResponseDto> questions = questionService.getAllQuestions(pageable);
        // 2. HTTP 200 OK 상태와 함께 페이지네이션된 문제 목록을 반환
        return ResponseEntity.ok(questions);
    }

    /**
     * 기존 언어학습 퀴즈 문제의 정보를 업데이트합니다
     * 
     * @param id 업데이트할 문제의 고유 식별자
     * @param updateDto 업데이트할 문제 데이터 (제목, 내용, 분류, 난이도 등)
     * @return 업데이트된 문제 정보를 포함한 ResponseEntity
     */
    @PutMapping("/{id}")
    public ResponseEntity<QuestionResponseDto> updateQuestion(
            @PathVariable String id,
            @Valid @RequestBody QuestionUpdateDto updateDto) {
        // 1. 문제 ID와 유효성 검증된 업데이트 데이터로 문제 정보를 수정
        QuestionResponseDto updatedQuestion = questionService.updateQuestion(id, updateDto);
        // 2. HTTP 200 OK 상태와 함께 업데이트된 문제 정보를 반환
        return ResponseEntity.ok(updatedQuestion);
    }

    /**
     * 특정 언어학습 퀴즈 문제를 삭제합니다
     * 
     * @param id 삭제할 문제의 고유 식별자
     * @return 삭제 완료를 나타내는 빈 ResponseEntity
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteQuestion(@PathVariable String id) {
        // 1. 제공된 문제 ID로 해당 문제를 데이터베이스에서 삭제
        questionService.deleteQuestion(id);
        // 2. HTTP 204 No Content 상태로 삭제 완료를 반환 (응답 본문 없음)
        return ResponseEntity.noContent().build();
    }

    /**
     * 특정 분류(카테고리)에 해당하는 언어학습 퀴즈 문제들을 조회합니다
     * 
     * @param category 필터링할 문제 분류 (예: 학업, 비즈니스, 여행, 일상생활)
     * @return 해당 분류의 문제 목록을 포함한 ResponseEntity
     */
    @GetMapping("/category/{category}")
    public ResponseEntity<List<QuestionResponseDto>> getQuestionsByCategory(@PathVariable String category) {
        // 1. 지정된 카테고리에 속하는 모든 문제를 조회
        List<QuestionResponseDto> questions = questionService.getQuestionsByCategory(category);
        // 2. HTTP 200 OK 상태와 함께 필터링된 문제 목록을 반환
        return ResponseEntity.ok(questions);
    }

    /**
     * 특정 난이도 레벨에 해당하는 언어학습 퀴즈 문제들을 조회합니다
     * 
     * @param level 필터링할 난이도 레벨 (A: 초급, B: 중급, C: 고급)
     * @return 해당 난이도의 문제 목록을 포함한 ResponseEntity
     */
    @GetMapping("/difficulty/{level}")
    public ResponseEntity<List<QuestionResponseDto>> getQuestionsByDifficultyLevel(@PathVariable String level) {
        // 1. 지정된 난이도 레벨에 해당하는 모든 문제를 조회
        List<QuestionResponseDto> questions = questionService.getQuestionsByDifficultyLevel(level);
        // 2. HTTP 200 OK 상태와 함께 필터링된 문제 목록을 반환
        return ResponseEntity.ok(questions);
    }

    /**
     * 특정 문제 유형에 해당하는 언어학습 퀴즈 문제들을 조회합니다
     * 
     * @param type 필터링할 문제 유형 (Word: 빈칸 채우기, Sentence: 동의어 매칭)
     * @return 해당 유형의 문제 목록을 포함한 ResponseEntity
     */
    @GetMapping("/type/{type}")
    public ResponseEntity<List<QuestionResponseDto>> getQuestionsByQuestionType(@PathVariable String type) {
        // 1. 지정된 문제 유형에 해당하는 모든 문제를 조회
        List<QuestionResponseDto> questions = questionService.getQuestionsByQuestionType(type);
        // 2. HTTP 200 OK 상태와 함께 필터링된 문제 목록을 반환
        return ResponseEntity.ok(questions);
    }
}