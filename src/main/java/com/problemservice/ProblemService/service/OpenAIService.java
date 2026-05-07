package com.problemservice.ProblemService.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.problemservice.ProblemService.model.dto.OpenAIRequestDto;
import com.problemservice.ProblemService.model.dto.OpenAIResponseDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClientResponseException;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Gemini API 기반 텍스트 생성 서비스
 * OpenAI 인터페이스를 유지하여 기존 호출부 변경 최소화
 */
@Service
@Slf4j
public class OpenAIService {

    private final WebClient webClient;
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Value("${gemini.api.key:}")
    private String apiKey;

    @Value("${gemini.api.model:gemini-2.0-flash}")
    private String model;

    @Value("${gemini.api.timeout:60}")
    private int timeoutSeconds;

    public OpenAIService(@Qualifier("geminiWebClient") WebClient webClient) {
        this.webClient = webClient;
    }

    /**
     * Gemini API 호출 — OpenAIRequestDto 인터페이스 유지
     */
    public OpenAIResponseDto generateResponse(OpenAIRequestDto requestDto) {
        if (apiKey == null || apiKey.isBlank()) {
            log.warn("Gemini API 키 미설정 (GEMINI_API_KEY)");
            return error("Gemini API 키가 설정되지 않았습니다. 환경변수 GEMINI_API_KEY를 설정해주세요.");
        }

        try {
            String url = String.format("/v1beta/models/%s:generateContent?key=%s", model, apiKey);

            double temperature = requestDto.getTemperature() != null ? requestDto.getTemperature() : 0.8;
            // Gemini temperature 범위: 0.0 ~ 2.0
            temperature = Math.min(temperature, 2.0);
            int maxTokens = requestDto.getMaxTokens() != null ? requestDto.getMaxTokens() : 2048;

            Map<String, Object> body = buildRequestBody(requestDto.getPrompt(), temperature, maxTokens);

            log.info("Gemini API 호출: model={}, maxTokens={}, temperature={}", model, maxTokens, temperature);

            String raw = webClient.post()
                    .uri(url)
                    .bodyValue(body)
                    .retrieve()
                    .bodyToMono(String.class)
                    .timeout(Duration.ofSeconds(timeoutSeconds))
                    .block();

            return parseResponse(raw);

        } catch (WebClientResponseException e) {
            log.error("Gemini API HTTP 오류: status={}, body={}", e.getStatusCode(), e.getResponseBodyAsString());
            return error("Gemini API 오류 " + e.getStatusCode() + ": " + e.getResponseBodyAsString());
        } catch (Exception e) {
            log.error("Gemini API 호출 실패", e);
            return error("Gemini API 호출 중 오류: " + e.getMessage());
        }
    }

    private Map<String, Object> buildRequestBody(String prompt, double temperature, int maxTokens) {
        Map<String, Object> part = Map.of("text", prompt);
        Map<String, Object> content = Map.of("parts", List.of(part));

        Map<String, Object> generationConfig = new HashMap<>();
        generationConfig.put("temperature", temperature);
        generationConfig.put("maxOutputTokens", maxTokens);
        // gemini-2.5-flash는 Thinking 모드가 기본 활성화 → 토큰 대부분을 추론에 소모
        // 문제/단어 생성 용도에는 불필요하므로 비활성화
        generationConfig.put("thinkingConfig", Map.of("thinkingBudget", 0));

        Map<String, Object> safetySettings = new HashMap<>();
        // 학습 콘텐츠 생성이므로 안전 필터 완화
        List<Map<String, String>> safety = List.of(
            Map.of("category", "HARM_CATEGORY_HARASSMENT", "threshold", "BLOCK_NONE"),
            Map.of("category", "HARM_CATEGORY_HATE_SPEECH", "threshold", "BLOCK_NONE"),
            Map.of("category", "HARM_CATEGORY_SEXUALLY_EXPLICIT", "threshold", "BLOCK_NONE"),
            Map.of("category", "HARM_CATEGORY_DANGEROUS_CONTENT", "threshold", "BLOCK_NONE")
        );

        Map<String, Object> body = new HashMap<>();
        body.put("contents", List.of(content));
        body.put("generationConfig", generationConfig);
        body.put("safetySettings", safety);
        return body;
    }

    private OpenAIResponseDto parseResponse(String raw) throws Exception {
        JsonNode root = objectMapper.readTree(raw);

        // 안전 필터로 차단된 경우
        JsonNode candidates = root.path("candidates");
        if (candidates.isEmpty()) {
            String blocked = root.path("promptFeedback").path("blockReason").asText("UNKNOWN");
            return error("Gemini 응답 차단됨: " + blocked);
        }

        String text = candidates.path(0)
                .path("content").path("parts").path(0)
                .path("text").asText();

        int totalTokens = root.path("usageMetadata").path("totalTokenCount").asInt(0);

        log.info("Gemini 응답 완료: tokens={}", totalTokens);

        return OpenAIResponseDto.builder()
                .response(text)
                .model(model)
                .tokensUsed(totalTokens)
                .createdAt(LocalDateTime.now())
                .success(true)
                .build();
    }

    private OpenAIResponseDto error(String message) {
        return OpenAIResponseDto.builder()
                .success(false)
                .errorMessage(message)
                .createdAt(LocalDateTime.now())
                .build();
    }
}
