package com.problemservice.ProblemService.controller;

import com.problemservice.ProblemService.model.dto.GeneratedQuestionDto;
import com.problemservice.ProblemService.model.dto.QuestionGenerationRequestDto;
import com.problemservice.ProblemService.model.dto.QuestionGenerationResponseDto;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.service.QuestionGenerationService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * OpenAI를 활용한 문제 생성 API 컨트롤러
 * AI 기반 문제 생성 및 저장 기능 제공
 */
@RestController
@RequestMapping("/api/questions/generate")
@RequiredArgsConstructor
@Slf4j
public class QuestionGenerationController {
    
    private final QuestionGenerationService questionGenerationService;
    
    /**
     * AI로 문제를 생성하고 데이터베이스에 저장
     * 
     * @param request 문제 생성 요청 정보
     * @return 생성되어 저장된 문제들의 응답
     */
    @PostMapping
    public ResponseEntity<QuestionGenerationResponseDto> generateAndSaveQuestions(
            @Valid @RequestBody 
 
            QuestionGenerationRequestDto request) {
        
        try {
            log.info("문제 생성 및 저장 요청 - 유형: {}, 개수: {}, 카테고리: {}", 
                request.getQuestionType(), request.getQuestionCount(), request.getMajorCategory());
                
            // 1. 문제 생성
            QuestionGenerationResponseDto response = questionGenerationService.generateQuestions(request);
            
            // 2. 생성된 문제들 저장
            List<String> savedQuestionIds = new ArrayList<>();
            for (GeneratedQuestionDto generatedQuestion : response.getQuestions()) {
                if (generatedQuestion.isValid()) {
                    try {
                        Question savedQuestion = questionGenerationService.saveGeneratedQuestion(generatedQuestion);
                        savedQuestionIds.add(savedQuestion.getQuestionId());
                        log.debug("문제 저장 성공: {}", savedQuestion.getQuestionId());
                    } catch (Exception e) {
                        log.error("문제 저장 실패: {}", generatedQuestion.getQuestionText(), e);
                        response.getErrorMessages().add("문제 저장 실패: " + e.getMessage());
                    }
                }
            }
            
            log.info("문제 생성 및 저장 완료 - 생성: {}, 저장: {}", 
                response.getSuccessfullyGenerated(), savedQuestionIds.size());
            
            if (response.isSuccess() && !savedQuestionIds.isEmpty()) {
                return ResponseEntity.status(HttpStatus.CREATED).body(response);
            } else {
                return ResponseEntity.status(HttpStatus.PARTIAL_CONTENT).body(response);
            }
            
        } catch (IllegalArgumentException e) {
            log.error("잘못된 문제 생성 요청", e);
            return ResponseEntity.badRequest()
                .body(createErrorResponse(request, "잘못된 요청: " + e.getMessage()));
                
        } catch (Exception e) {
            log.error("문제 생성 및 저장 중 예상치 못한 오류", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(createErrorResponse(request, "서버 내부 오류가 발생했습니다"));
        }
    }
    
    /**
     * 특정 주제에 대한 빠른 문제 생성
     * 간단한 파라미터로 기본 설정의 문제를 빠르게 생성하고 저장
     * 
     * @param questionType 문제 유형 (word, sentence, conversation)
     * @param difficulty 난이도 (A, B, C)
     * @param topic 주제
     * @param count 생성할 문제 수 (기본값: 1)
     * @return 생성되어 저장된 문제들의 응답
     */
    @PostMapping("/quick")
    public ResponseEntity<QuestionGenerationResponseDto> quickGenerate(
            @RequestParam String questionType,
            @RequestParam String difficulty,
            @RequestParam String topic,
            @RequestParam(defaultValue = "1") Integer count) {
        
        try {
            // 간단한 요청을 전체 요청 DTO로 변환
            QuestionGenerationRequestDto request = QuestionGenerationRequestDto.builder()
                .questionType(parseQuestionType(questionType))
                .difficulty(parseDifficulty(difficulty))
                .majorCategory(topic)
                .questionCount(count)
                .build();
                
            return generateAndSaveQuestions(request);
            
        } catch (IllegalArgumentException e) {
            log.error("빠른 문제 생성 요청 파라미터 오류", e);
            return ResponseEntity.badRequest()
                .body(createErrorResponse(null, "잘못된 파라미터: " + e.getMessage()));
        }
    }
    
    /**
     * 에러 응답 생성 헬퍼 메서드
     */
    private QuestionGenerationResponseDto createErrorResponse(QuestionGenerationRequestDto request, String errorMessage) {
        return QuestionGenerationResponseDto.builder()
            .questions(new ArrayList<>())
            .requestedCount(request != null ? request.getQuestionCount() : 0)
            .successfullyGenerated(0)
            .failedCount(request != null ? request.getQuestionCount() : 1)
            .success(false)
            .errorMessages(List.of(errorMessage))
            .build();
    }
    
    /**
     * 문자열을 QuestionType enum으로 변환
     */
    private com.problemservice.ProblemService.model.enums.QuestionType parseQuestionType(String type) {
        switch (type.toLowerCase()) {
            case "word": return com.problemservice.ProblemService.model.enums.QuestionType.WORD;
            case "sentence": return com.problemservice.ProblemService.model.enums.QuestionType.SENTENCE;
            case "conversation": return com.problemservice.ProblemService.model.enums.QuestionType.CONVERSATION;
            default: throw new IllegalArgumentException("지원하지 않는 문제 유형: " + type);
        }
    }
    
    /**
     * 문자열을 Difficulty enum으로 변환
     */
    private com.problemservice.ProblemService.model.enums.Difficulty parseDifficulty(String diff) {
        switch (diff.toUpperCase()) {
            case "A": return com.problemservice.ProblemService.model.enums.Difficulty.A;
            case "B": return com.problemservice.ProblemService.model.enums.Difficulty.B;
            case "C": return com.problemservice.ProblemService.model.enums.Difficulty.C;
            default: throw new IllegalArgumentException("지원하지 않는 난이도: " + diff);
        }
    }
}