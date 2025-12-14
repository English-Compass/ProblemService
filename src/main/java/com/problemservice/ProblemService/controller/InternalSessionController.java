package com.problemservice.ProblemService.controller;

import com.problemservice.ProblemService.model.dto.SessionAnalysisResponseDto;
import com.problemservice.ProblemService.service.LearningSessionAnalysisService;
import jakarta.validation.constraints.NotBlank;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 학습 분석 서비스에서 사용할 내부 세션 조회 API.
 */
@RestController
@RequestMapping("/api/problem/internal/sessions")
@RequiredArgsConstructor
@Validated
public class InternalSessionController {

    private final LearningSessionAnalysisService sessionAnalysisService;

    @GetMapping("/{sessionId}")
    public ResponseEntity<SessionAnalysisResponseDto> getSessionForAnalysis(
            @PathVariable String sessionId,
            @RequestParam @NotBlank String userId) {

        SessionAnalysisResponseDto response = sessionAnalysisService.getSessionAnalysisData(sessionId, userId);
        return ResponseEntity.ok(response);
    }
}

