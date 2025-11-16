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
@RequestMapping("/problem/questions")
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
     * 언어학습 퀴즈 문제를 조회합니다 (Query Parameter로 필터링 지원)
     * 
     * @param category 카테고리로 필터링 (선택)
     * @param level 난이도로 필터링 (선택)
     * @param type 문제 유형으로 필터링 (선택)
     * @param pageable 페이지네이션 설정 (페이지 번호, 크기, 정렬 조건)
     * @return 필터링된 문제 목록 (필터가 있으면 List, 없으면 Page)
     */
    @GetMapping
    public ResponseEntity<?> getQuestions(
            @RequestParam(required = false) String category,
            @RequestParam(required = false) String level,
            @RequestParam(required = false) String type,
            Pageable pageable) {
        
        // 필터링 조건에 따라 적절한 서비스 메서드 호출
        if (category != null) {
            List<QuestionResponseDto> questions = questionService.getQuestionsByCategory(category);
            return ResponseEntity.ok(questions);
        } else if (level != null) {
            List<QuestionResponseDto> questions = questionService.getQuestionsByDifficultyLevel(level);
            return ResponseEntity.ok(questions);
        } else if (type != null) {
            List<QuestionResponseDto> questions = questionService.getQuestionsByQuestionType(type);
            return ResponseEntity.ok(questions);
        } else {
            // 필터 없음 - 전체 조회 (페이지네이션)
            Page<QuestionResponseDto> questions = questionService.getAllQuestions(pageable);
            return ResponseEntity.ok(questions);
        }
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

}