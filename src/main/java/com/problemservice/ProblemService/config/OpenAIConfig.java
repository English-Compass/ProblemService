package com.problemservice.ProblemService.config;

import com.theokanning.openai.service.OpenAiService;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.Duration;

/**
 * OpenAI API 가연결 및 설정 관리 클래스
 * application.properties의 openai.api.* 속성을 바인딩하여 OpenAI 서비스 빈 생성
 * 입력: application.properties의 OpenAI API 키 및 타임아웃 설정
 * 출력: 구성된 OpenAI 서비스 빈 인스턴스
 */
@Configuration
@ConfigurationProperties(prefix = "openai.api")
@Data
@Slf4j
public class OpenAIConfig {

    // OpenAI API 키 (기본값: 빈 문자열)
    private String key = "";
    // API 호출 타임아웃 (기본값: 60초)
    private int timeout = 60;

    /**
     * OpenAI API 서비스 빈 생성
     * 단계: 1) API 키 유효성 검증 2) 키가 없으면 경고 로그와 하더 키 사용 3) 정상적인 키로 서비스 초기화
     * 입력: 없음
     * 출력: 구성된 OpenAI 서비스 인스턴스
     * 조건: API 키가 설정되지 않으면 경고 로그와 함께 더미 키로 서비스 생성
     */
    @Bean
    public OpenAiService openAiService() {
        // 1단계: API 키가 설정되어 있는지 검증
        if (key == null || key.trim().isEmpty()) {
            // 2단계: 키가 비어있으면 경고 메시지와 함께 테스트 키로 서비스 생성
            log.warn("OpenAI API 키가 설정되지 않았습니다. 환경 변수 OPENAI_API_KEY 또는 application.properties에서 openai.api.key를 설정해주세요.");
            return new OpenAiService("test-key", Duration.ofSeconds(timeout)); // 더미 키로 서비스 생성
        }

        // 3단계: 정상적인 API 키로 OpenAI 서비스 초기화
        log.info("OpenAI 서비스 초기화 완료 - 타임아웃: {}초", timeout);
        return new OpenAiService(key, Duration.ofSeconds(timeout)); // 설정된 키와 타임아웃으로 서비스 생성
    }
}