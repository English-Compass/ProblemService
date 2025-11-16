package com.problemservice.ProblemService.controller;

import com.problemservice.ProblemService.model.dto.*;
import com.problemservice.ProblemService.model.entity.SessionQuestion;
import com.problemservice.ProblemService.service.QuestionAnswerService;
import com.problemservice.ProblemService.service.QuestionService;
import com.problemservice.ProblemService.service.SessionQuestionService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 퀴즈 관련 API 컨트롤러
 * 대시보드에서 요구하는 표준 형식의 퀴즈 데이터 제공
 * 
 * Note: 세션 생성은 LearningSessionController에서 처리해야 합니다.
 * 이 컨트롤러는 기존 세션의 문제를 조회하거나 오답 목록을 제공합니다.
 */
@RestController
@RequestMapping("/problem/quiz")
@RequiredArgsConstructor
public class QuizController {

    private final SessionQuestionService sessionQuestionService;
    private final QuestionService questionService;
    private final QuestionAnswerService questionAnswerService;

    /**
     * 세션의 문제들을 퀴즈 형식으로 조회
     * 
     * @param sessionId 조회할 세션 ID
     * @return 퀴즈 형식의 문제 목록
     */
    @GetMapping("/sessions/{sessionId}")
    public ResponseEntity<List<QuizQuestionDto>> getQuizBySessionId(@PathVariable String sessionId) {
        // 1. 세션의 문제들 조회
        List<SessionQuestion> sessionQuestions = sessionQuestionService.getSessionQuestions(sessionId);
        
        // 2. 문제 ID를 사용하여 실제 문제 데이터 조회 및 표준 형식으로 변환
        List<QuizQuestionDto> quizQuestions = sessionQuestions.stream()
                .map(sq -> {
                    QuestionResponseDto question = questionService.getQuestionById(sq.getQuestionId());
                    return QuizQuestionDto.fromQuestionResponseDto(question);
                })
                .collect(Collectors.toList());
        
        return ResponseEntity.ok(quizQuestions);
    }

    /**
     * 사용자의 틀린 문제 목록 조회
     * 
     * @param userId 사용자 ID
     * @return 틀린 문제 목록
     */
    @GetMapping("/users/{userId}/wrong-questions")
    public ResponseEntity<List<WrongAnswerQuestionDto>> getUserWrongQuestions(@PathVariable String userId) {
        // 1. 사용자의 모든 오답 기록 조회
        List<QuestionAnswerResponseDto> wrongAnswers = questionAnswerService.getWrongAnswersByUserId(userId);
        
        // 2. 오답 기록을 표준 형식으로 변환
        List<WrongAnswerQuestionDto> wrongQuestionList = wrongAnswers.stream()
                .map(WrongAnswerQuestionDto::fromQuestionAnswerResponseDto)
                .distinct() // 중복 문제 제거
                .collect(Collectors.toList());
        
        return ResponseEntity.ok(wrongQuestionList);
    }
}