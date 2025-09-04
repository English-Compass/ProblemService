package com.problemservice.ProblemService.config;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Spring MVC 웹 계층 설정 클래스
 * API 엔드포인트에 대한 HTTP 요청/응답 로깅 필터를 등록하여 
 * 디버깅과 모니터링을 위한 상세한 로그 수집 기능 제공
 */
@Configuration
@RequiredArgsConstructor
public class WebConfig implements WebMvcConfigurer {

    private final AppProperties appProperties;

    /**
     * CORS 정책 설정
     * 프론트엔드(React 개발 서버)에서 백엔드 API 호출을 허용하기 위한 CORS 설정
     * @param registry CORS 레지스트리
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**")
                .allowedOrigins("http://localhost:5173", "http://localhost:3000")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("*")
                .allowCredentials(true)
                .maxAge(3600);
    }

    /**
     * API 엔드포인트에 대한 HTTP 요청/응답 로깅 필터 등록
     * /api/* 패턴의 모든 요청에 대해 메서드, URI, 클라이언트 IP, 요청/응답 바디를 로깅
     * 필터 실행 순서를 1로 설정하여 다른 필터들보다 먼저 실행되도록 구성
     * @return 구성된 로깅 필터 등록 빈
     */
    @Bean
    public FilterRegistrationBean<LoggingFilter> loggingFilter() {
        FilterRegistrationBean<LoggingFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new LoggingFilter(appProperties));
        registrationBean.addUrlPatterns("/api/*");
        registrationBean.setOrder(1);
        return registrationBean;
    }
}