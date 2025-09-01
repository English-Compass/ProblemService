package com.problemservice.ProblemService.controller;

import com.problemservice.ProblemService.model.dto.*;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.model.entity.SessionQuestion;
import com.problemservice.ProblemService.service.LearningSessionService;
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
 */
@RestController
@RequestMapping("/api/quiz")
@RequiredArgsConstructor
public class QuizController {

    private final LearningSessionService learningSessionService;
    private final SessionQuestionService sessionQuestionService;
    private final QuestionService questionService;
    private final QuestionAnswerService questionAnswerService;

    /**
     * API 2: 복습 퀴즈 API
     * 엔드포인트: GET /api/quiz/review?userId={userId}
     * - 헤더: Authorization Bearer Token
     * - 응답: 복습용 퀴즈 문제들
     * - 구조: { id, question, options[], correct }[]
     */
    @GetMapping("/review")
    public ResponseEntity<List<QuizQuestionDto>> getReviewQuiz(@RequestParam String userId) {
        // 1. 복습 세션 생성 DTO 준비 (기본 설정)
        LearningSessionCreateDto createDto = LearningSessionCreateDto.builder()
                .userId(userId)
                .categories(List.of("학업", "비즈니스", "여행", "일상생활")) // 모든 카테고리
                .build();
        
        // 2. 복습 세션 생성 (기존 미시작 세션이 있으면 재사용)
        LearningSessionResponseDto reviewSession = learningSessionService.createReviewSession(createDto);
        
        // 3. 생성된 세션의 문제들 조회
        List<SessionQuestion> sessionQuestions = sessionQuestionService.getSessionQuestions(reviewSession.getSessionId());
        
        // 4. 문제 ID를 사용하여 실제 문제 데이터 조회 및 표준 형식으로 변환
        List<QuizQuestionDto> quizQuestions = sessionQuestions.stream()
                .map(sq -> {
                    QuestionResponseDto question = questionService.getQuestionById(sq.getQuestionId());
                    return QuizQuestionDto.fromQuestionResponseDto(question);
                })
                .collect(Collectors.toList());
        
        return ResponseEntity.ok(quizQuestions);
    }

    /**
     * API 4: WrongAnswerCard API
     * 엔드포인트: GET /api/quiz/wrong-answers?userId={userId}
     * - 사용자의 틀린 문제 목록 조회
     * - 구조: { id, question, options[] }[]
     */
    @GetMapping("/wrong-answers")
    public ResponseEntity<List<WrongAnswerQuestionDto>> getWrongAnswers(@RequestParam String userId) {
        // 1. 오답노트 세션 생성 DTO 준비 (기본 설정)
        LearningSessionCreateDto createDto = LearningSessionCreateDto.builder()
                .userId(userId)
                .categories(List.of("학업", "비즈니스", "여행", "일상생활")) // 모든 카테고리
                .build();
        
        // 2. 오답노트 세션 생성 (기존 미시작 세션이 있으면 재사용)
        LearningSessionResponseDto wrongAnswerSession = learningSessionService.createWrongAnswerSession(createDto);
        
        // 3. 생성된 세션의 문제들 조회
        List<SessionQuestion> sessionQuestions = sessionQuestionService.getSessionQuestions(wrongAnswerSession.getSessionId());
        
        // 4. 문제 ID를 사용하여 실제 문제 데이터 조회 및 표준 형식으로 변환
        List<WrongAnswerQuestionDto> wrongAnswerQuestions = sessionQuestions.stream()
                .map(sq -> {
                    QuestionResponseDto question = questionService.getQuestionById(sq.getQuestionId());
                    return WrongAnswerQuestionDto.builder()
                            .id(question.getQuestionId())
                            .question(question.getQuestionText())
                            .options(List.of(
                                question.getOptionA(),
                                question.getOptionB(),
                                question.getOptionC()
                            ))
                            .build();
                })
                .collect(Collectors.toList());
        
        return ResponseEntity.ok(wrongAnswerQuestions);
    }

    /**
     * API 6: 틀린 문제 목록 조회
     * 엔드포인트: GET /api/quiz/user/{userId}/wrong-questions
     * - 헤더: Authorization Bearer Token
     * - 응답: 사용자가 틀린 문제들의 목록
     */
    @GetMapping("/user/{userId}/wrong-questions")
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