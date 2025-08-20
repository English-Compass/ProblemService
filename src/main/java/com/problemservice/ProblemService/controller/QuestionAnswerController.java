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
        QuestionAnswerResponseDto createdQuestionAnswer = questionAnswerService.createQuestionAnswer(createDto);
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
        QuestionAnswerResponseDto questionAnswer = questionAnswerService.getQuestionAnswerById(id);
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
        Page<QuestionAnswerResponseDto> questionAnswers = questionAnswerService.getAllQuestionAnswers(pageable);
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
        questionAnswerService.deleteQuestionAnswer(id);
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
        List<QuestionAnswerResponseDto> questionAnswers = questionAnswerService.getQuestionAnswersBySessionId(sessionId);
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
        List<QuestionAnswerResponseDto> questionAnswers = questionAnswerService.getQuestionAnswersByQuestionId(questionId);
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
        List<QuestionAnswerResponseDto> questionAnswers = questionAnswerService.getQuestionAnswersBySessionIdAndQuestionId(sessionId, questionId);
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
        List<QuestionAnswerResponseDto> questionAnswers = questionAnswerService.getQuestionAnswersBySessionType(sessionType);
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
        List<QuestionAnswerResponseDto> questionAnswers = questionAnswerService.getQuestionAnswersBySessionIdAndCorrectness(sessionId, isCorrect);
        return ResponseEntity.ok(questionAnswers);
    }
}