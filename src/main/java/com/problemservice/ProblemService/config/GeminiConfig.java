package com.problemservice.ProblemService.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.client.WebClient;

@Configuration
@Slf4j
public class GeminiConfig {

    @Value("${gemini.api.model:gemini-2.0-flash}")
    private String model;

    @Bean("geminiWebClient")
    public WebClient geminiWebClient() {
        log.info("Gemini API 초기화: model={}", model);
        return WebClient.builder()
                .baseUrl("https://generativelanguage.googleapis.com")
                .defaultHeader("Content-Type", "application/json")
                .codecs(c -> c.defaultCodecs().maxInMemorySize(4 * 1024 * 1024)) // 4MB
                .build();
    }
}
