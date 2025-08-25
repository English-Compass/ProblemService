package com.problemservice.ProblemService.config;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 웹 MVC 설정 클래스
 * 스프링 웹 애플리케이션의 인터셉터와 필터를 설정하여 API 요청/응답 로깅 기능 제공
 * 입력: 없음 (설정 클래스)
 * 출력: 구성된 인터셉터와 필터 빈
 */
@Configuration
@RequiredArgsConstructor
public class WebConfig implements WebMvcConfigurer {

    // API 요청/응답 로깅을 위한 인터셉터
    private final LoggingInterceptor loggingInterceptor;

    /**
     * 웹 MVC 인터셉터 등록
     * 단계: 1) 로깅 인터셉터 등록 2) API 경로 패턴 매핑
     * 입력: 인터셉터 레지스트리
     * 출력: 없음 (설정 메서드)
     * 조건: /api/** 경로에 대해서만 인터셉터 적용
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 1단계: 로깅 인터셉터를 레지스트리에 등록
        registry.addInterceptor(loggingInterceptor)
                // 2단계: /api/로 시작하는 모든 경로에 인터셉터 적용
                .addPathPatterns("/api/**");
    }

    /**
     * HTTP 요청/응답 로깅 필터 빈 생성
     * 단계: 1) 필터 등록 빈 생성 2) 로깅 필터 인스턴스 설정 3) URL 패턴 매핑 4) 필터 우선순위 설정
     * 입력: 없음
     * 출력: 구성된 필터 등록 빈
     * 조건: /api/* 경로에 대해서만 필터 적용, 우선순위 1번으로 설정
     */
    @Bean
    public FilterRegistrationBean<LoggingFilter> loggingFilter() {
        // 1단계: 필터 등록을 위한 등록 빈 생성
        FilterRegistrationBean<LoggingFilter> registrationBean = new FilterRegistrationBean<>();
        // 2단계: 새로운 로깅 필터 인스턴스 설정
        registrationBean.setFilter(new LoggingFilter());
        // 3단계: /api/로 시작하는 URL 패턴에 필터 적용
        registrationBean.addUrlPatterns("/api/*");
        // 4단계: 필터 실행 순서를 1번으로 설정 (가장 먼저 실행)
        registrationBean.setOrder(1);
        return registrationBean;
    }
}