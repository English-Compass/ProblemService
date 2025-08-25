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

/**
 * 문제에 대한 답변 내역 관리를 위한 REST API 컨트롤러
 * 문제 풀이 기록의 생성, 조회, 삭제 기능을 제공합니다
 */
@RestController
@RequestMapping("/api/question-answers")
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
    public ResponseEntity<QuestionAnswerResponseDto> createQuestionAnswer(@Valid @RequestBody QuestionAnswerCreateDto createDto) {
        // 1. 유효성 검증이 완료된 답변 데이터를 사용하여 새로운 문제 답변 기록을 생성
        QuestionAnswerResponseDto createdQuestionAnswer = questionAnswerService.createQuestionAnswer(createDto);
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
     * 모든 문제에 대한 답변 내역을 페이지네이션으로 조회합니다
     * 
     * @param pageable 페이지네이션 정보 (페이지 번호, 크기, 정렬 조건)
     * @return HTTP 200 OK와 함께 페이지네이션된 문제에 대한 답변 내역 목록
     */
    @GetMapping
    public ResponseEntity<Page<QuestionAnswerResponseDto>> getAllQuestionAnswers(Pageable pageable) {
        // 1. 페이지네이션 설정에 따라 모든 문제 답변 기록을 조회
        Page<QuestionAnswerResponseDto> questionAnswers = questionAnswerService.getAllQuestionAnswers(pageable);
        // 2. HTTP 200 OK 상태와 함께 페이지네이션된 답변 기록 목록을 반환
        return ResponseEntity.ok(questionAnswers);
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

    /**
     * 특정 사용자의 모든 문제에 대한 답변 내역을 조회합니다
     * 
     * @param userId 사용자의 고유 식별자
     * @return HTTP 200 OK와 함께 해당 사용자의 모든 문제에 대한 답변 내역
     */
    @GetMapping("/session/{sessionId}")
    public ResponseEntity<List<QuestionAnswerResponseDto>> getQuestionAnswersBySessionId(@PathVariable String sessionId) {
        // 1. 지정된 세션 ID에 속하는 모든 문제 답변 기록을 조회
        List<QuestionAnswerResponseDto> questionAnswers = questionAnswerService.getQuestionAnswersBySessionId(sessionId);
        // 2. HTTP 200 OK 상태와 함께 필터링된 답변 기록 목록을 반환
        return ResponseEntity.ok(questionAnswers);
    }

    /**
     * 특정 문제에 대한 모든 답변 내역을 조회합니다
     * 
     * @param questionId 문제의 고유 식별자
     * @return HTTP 200 OK와 함께 해당 문제의 모든 답변 내역
     */
    @GetMapping("/question/{questionId}")
    public ResponseEntity<List<QuestionAnswerResponseDto>> getQuestionAnswersByQuestionId(@PathVariable String questionId) {
        // 1. 지정된 문제 ID에 대한 모든 답변 기록을 조회
        List<QuestionAnswerResponseDto> questionAnswers = questionAnswerService.getQuestionAnswersByQuestionId(questionId);
        // 2. HTTP 200 OK 상태와 함께 필터링된 답변 기록 목록을 반환
        return ResponseEntity.ok(questionAnswers);
    }

    /**
     * 특정 사용자의 특정 문제에 대한 모든 답변 내역을 조회합니다
     * 
     * @param userId 사용자의 고유 식별자
     * @param questionId 문제의 고유 식별자
     * @return HTTP 200 OK와 함께 해당 조건의 모든 문제에 대한 답변 내역
     */
    @GetMapping("/session/{sessionId}/question/{questionId}")
    public ResponseEntity<List<QuestionAnswerResponseDto>> getQuestionAnswersBySessionIdAndQuestionId(
            @PathVariable String sessionId, 
            @PathVariable String questionId) {
        // 1. 지정된 세션 ID와 문제 ID 조건을 모두 만족하는 답변 기록을 조회
        List<QuestionAnswerResponseDto> questionAnswers = questionAnswerService.getQuestionAnswersBySessionIdAndQuestionId(sessionId, questionId);
        // 2. HTTP 200 OK 상태와 함께 조건에 맞는 답변 기록 목록을 반환
        return ResponseEntity.ok(questionAnswers);
    }

    /**
     * 특정 세션 타입의 모든 문제에 대한 답변 내역을 조회합니다
     * 
     * @param sessionType 세션 타입 (예: "practice", "test")
     * @return HTTP 200 OK와 함께 해당 세션 타입의 모든 문제에 대한 답변 내역
     */
    @GetMapping("/session/{sessionType}")
    public ResponseEntity<List<QuestionAnswerResponseDto>> getQuestionAnswersBySessionType(@PathVariable String sessionType) {
        // 1. 지정된 세션 타입에 해당하는 모든 답변 기록을 조회
        List<QuestionAnswerResponseDto> questionAnswers = questionAnswerService.getQuestionAnswersBySessionType(sessionType);
        // 2. HTTP 200 OK 상태와 함께 필터링된 답변 기록 목록을 반환
        return ResponseEntity.ok(questionAnswers);
    }

    /**
     * 특정 사용자의 정답/오답 여부에 따른 문제에 대한 답변 내역을 조회합니다
     * 
     * @param userId 사용자의 고유 식별자
     * @param isCorrect 정답 여부 (true: 정답, false: 오답)
     * @return HTTP 200 OK와 함께 해당 조건의 모든 문제에 대한 답변 내역
     */
    @GetMapping("/session/{sessionId}/correct/{isCorrect}")
    public ResponseEntity<List<QuestionAnswerResponseDto>> getQuestionAnswersBySessionIdAndCorrectness(
            @PathVariable String sessionId, 
            @PathVariable Boolean isCorrect) {
        // 1. 지정된 세션 ID와 정답 여부 조건을 모두 만족하는 답변 기록을 조회
        List<QuestionAnswerResponseDto> questionAnswers = questionAnswerService.getQuestionAnswersBySessionIdAndCorrectness(sessionId, isCorrect);
        // 2. HTTP 200 OK 상태와 함께 조건에 맞는 답변 기록 목록을 반환
        return ResponseEntity.ok(questionAnswers);
    }
}