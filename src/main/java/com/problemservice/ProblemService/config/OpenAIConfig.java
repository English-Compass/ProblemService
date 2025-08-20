package com.problemservice.ProblemService.config;

import com.theokanning.openai.service.OpenAiService;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.Duration;

@Configuration
@ConfigurationProperties(prefix = "openai.api")
@Data
@Slf4j
public class OpenAIConfig {

    private String key = "";
    private int timeout = 60;

    /**
     * OpenAI 서비스 Bean을 생성합니다
     * 
     * @return OpenAI API 클라이언트 서비스
     */
    @Bean
    public OpenAiService openAiService() {
        if (key == null || key.trim().isEmpty()) {
            log.warn("OpenAI API 키가 설정되지 않았습니다. 환경 변수 OPENAI_API_KEY 또는 application.properties에서 openai.api.key를 설정해주세요.");
            // 테스트 환경에서는 Mock을 사용하므로 빈 키로도 생성
            return new OpenAiService("test-key", Duration.ofSeconds(timeout));
        }

        log.info("OpenAI 서비스 초기화 완료 - 타임아웃: {}초", timeout);
        return new OpenAiService(key, Duration.ofSeconds(timeout));
    }
}