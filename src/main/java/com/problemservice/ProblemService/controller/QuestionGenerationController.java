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
@RequestMapping("/problem/questions")
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
    @PostMapping("/ai-generated")
    public ResponseEntity<QuestionGenerationResponseDto> generateAndSaveQuestions(
            @Valid @RequestBody QuestionGenerationRequestDto request,
            @RequestParam(required = false, defaultValue = "false") Boolean quick) {
        
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
}