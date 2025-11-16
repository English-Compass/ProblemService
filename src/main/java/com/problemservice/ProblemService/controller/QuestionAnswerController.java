package com.problemservice.ProblemService.controller;

import com.problemservice.ProblemService.model.dto.QuestionAnswerCreateDto;
import com.problemservice.ProblemService.model.dto.QuestionAnswerResponseDto;
import com.problemservice.ProblemService.service.QuestionAnswerService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import org.springframework.security.core.Authentication;

/**
 * 문제에 대한 답변 내역 관리를 위한 REST API 컨트롤러
 * 문제 풀이 기록의 생성, 조회, 삭제 기능을 제공합니다
 */
@RestController
@RequestMapping("/problem/question-answers")
@RequiredArgsConstructor
public class QuestionAnswerController {

    private final QuestionAnswerService questionAnswerService;

    /**
     * 새로운 문제에 대한 답변 내역을 생성합니다
     * 
     * @param createDto 문제에 대한 답변 내역 생성 정보 (사용자ID, 문제ID, 세션타입, 정답여부, 사용자답안, 풀이횟수)
     * @return HTTP 201 Created와 함께 생성된 문제에 대한 답변 내역 정보
     */
    @PostMapping
    public ResponseEntity<QuestionAnswerResponseDto> createQuestionAnswer(@Valid @RequestBody QuestionAnswerCreateDto createDto, Authentication authentication) {
        String userId = (String) authentication.getPrincipal();
        // 1. 유효성 검증이 완료된 답변 데이터를 사용하여 새로운 문제 답변 기록을 생성
        QuestionAnswerResponseDto createdQuestionAnswer = questionAnswerService.createQuestionAnswer(createDto, userId);
        // 2. HTTP 201 Created 상태와 함께 생성된 답변 기록 정보를 반환
        return ResponseEntity.status(HttpStatus.CREATED).body(createdQuestionAnswer);
    }

    /**
     * ID로 특정 문제에 대한 답변 내역을 조회합니다
     * 
     * @param id 조회할 문제에 대한 답변 내역의 고유 식별자
     * @return HTTP 200 OK와 함께 문제에 대한 답변 내역 상세 정보
     */
    @GetMapping("/{id}")
    public ResponseEntity<QuestionAnswerResponseDto> getQuestionAnswerById(@PathVariable Long id) {
        // 1. 제공된 ID로 데이터베이스에서 문제 답변 기록을 조회
        QuestionAnswerResponseDto questionAnswer = questionAnswerService.getQuestionAnswerById(id);
        // 2. HTTP 200 OK 상태와 함께 조회된 답변 기록 정보를 반환
        return ResponseEntity.ok(questionAnswer);
    }

    /**
     * 문제 답변 내역을 조회합니다 (Query Parameter로 필터링 지원)
     * 
     * @param sessionId 세션 ID로 필터링 (선택)
     * @param questionId 문제 ID로 필터링 (선택)
     * @param sessionType 세션 타입으로 필터링 (선택)
     * @param isCorrect 정답 여부로 필터링 (선택)
     * @param pageable 페이지네이션 정보 (페이지 번호, 크기, 정렬 조건)
     * @return HTTP 200 OK와 함께 필터링된 문제 답변 내역 목록
     */
    @GetMapping
    public ResponseEntity<?> getQuestionAnswers(
            @RequestParam(required = false) String sessionId,
            @RequestParam(required = false) String questionId,
            @RequestParam(required = false) String sessionType,
            @RequestParam(required = false) Boolean isCorrect,
            Pageable pageable) {
        
        // 필터링 조건에 따라 적절한 서비스 메서드 호출
        if (sessionId != null && questionId != null) {
            // 세션 ID + 문제 ID 조합
            List<QuestionAnswerResponseDto> answers = questionAnswerService.getQuestionAnswersBySessionIdAndQuestionId(sessionId, questionId);
            return ResponseEntity.ok(answers);
        } else if (sessionId != null && isCorrect != null) {
            // 세션 ID + 정답 여부 조합
            List<QuestionAnswerResponseDto> answers = questionAnswerService.getQuestionAnswersBySessionIdAndCorrectness(sessionId, isCorrect);
            return ResponseEntity.ok(answers);
        } else if (sessionId != null) {
            // 세션 ID만
            List<QuestionAnswerResponseDto> answers = questionAnswerService.getQuestionAnswersBySessionId(sessionId);
            return ResponseEntity.ok(answers);
        } else if (questionId != null) {
            // 문제 ID만
            List<QuestionAnswerResponseDto> answers = questionAnswerService.getQuestionAnswersByQuestionId(questionId);
            return ResponseEntity.ok(answers);
        } else if (sessionType != null) {
            // 세션 타입만
            List<QuestionAnswerResponseDto> answers = questionAnswerService.getQuestionAnswersBySessionType(sessionType);
            return ResponseEntity.ok(answers);
        } else {
            // 필터 없음 - 전체 조회 (페이지네이션)
            Page<QuestionAnswerResponseDto> questionAnswers = questionAnswerService.getAllQuestionAnswers(pageable);
            return ResponseEntity.ok(questionAnswers);
        }
    }

    /**
     * 특정 문제에 대한 답변 내역을 삭제합니다
     * 
     * @param id 삭제할 문제에 대한 답변 내역의 고유 식별자
     * @return HTTP 204 No Content (삭제 완료)
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteQuestionAnswer(@PathVariable Long id) {
        // 1. 제공된 ID로 해당 문제 답변 기록을 데이터베이스에서 삭제
        questionAnswerService.deleteQuestionAnswer(id);
        // 2. HTTP 204 No Content 상태로 삭제 완료를 반환 (응답 본문 없음)
        return ResponseEntity.noContent().build();
    }

}