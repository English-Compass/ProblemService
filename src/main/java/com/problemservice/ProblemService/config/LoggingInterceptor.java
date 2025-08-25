package com.problemservice.ProblemService.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.ContentCachingRequestWrapper;
import org.springframework.web.util.ContentCachingResponseWrapper;

import java.nio.charset.StandardCharsets;

/**
 * HTTP 요청/응답 로깅을 위한 인터셉터
 * Spring MVC HandlerInterceptor를 구현하여 API 호출 전후에 로깅 처리
 * 입력: HTTP 요청/응답 객체
 * 출력: 로그 파일에 요청/응답 정보 기록
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class LoggingInterceptor implements HandlerInterceptor {

    // JSON 직렬화/역직렬화를 위한 ObjectMapper (현재 미사용)
    private final ObjectMapper objectMapper;

    /**
     * 요청 처리 전 실행되는 메서드
     * 단계: 1) 시작 시간 기록 2) 요청 속성에 시간 저장 3) 요청 로깅 처리
     * 입력: HTTP 요청, 응답, 핸들러 객체
     * 출력: true (계속 처리) 또는 false (처리 중단)
     * 조건: ContentCachingRequestWrapper인 경우에만 요청 로깅 수행
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        // 1. 요청 처리 시작 시간 기록
        long startTime = System.currentTimeMillis();
        // 2. 요청 속성에 시작 시간 저장 (응답 시간 계산용)
        request.setAttribute("startTime", startTime);
        
        // 3. ContentCachingRequestWrapper인 경우 요청 정보 로깅
        if (request instanceof ContentCachingRequestWrapper) {
            logRequest((ContentCachingRequestWrapper) request);
        }
        
        // 4. true 반환으로 요청 처리 계속 진행
        return true;
    }

    /**
     * 요청 처리 완료 후 실행되는 메서드
     * 단계: 1) 시작 시간 조회 2) 처리 시간 계산 3) 응답 로깅 처리
     * 입력: HTTP 요청, 응답, 핸들러 객체, 예외 정보
     * 출력: 없음 (로깅만 수행)
     * 조건: ContentCachingResponseWrapper인 경우에만 응답 로깅 수행
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        // 1. 요청 속성에서 시작 시간 조회
        long startTime = (Long) request.getAttribute("startTime");
        // 2. 현재 시간과 시작 시간 차이로 처리 시간 계산
        long duration = System.currentTimeMillis() - startTime;
        
        // 3. ContentCachingResponseWrapper인 경우 응답 정보와 처리 시간 로깅
        if (response instanceof ContentCachingResponseWrapper) {
            logResponse((ContentCachingResponseWrapper) response, duration);
        }
    }

    /**
     * HTTP 요청 정보를 로깅하는 메서드
     * 단계: 1) 요청 메타데이터 추출 2) 요청 바디 추출 3) 로그 출력
     * 입력: ContentCachingRequestWrapper 객체
     * 출력: 없음 (로깅만 수행)
     */
    private void logRequest(ContentCachingRequestWrapper request) {
        // 1. HTTP 메서드 추출 (GET, POST, PUT 등)
        String method = request.getMethod();
        // 2. 요청 URI 추출
        String uri = request.getRequestURI();
        // 3. 쿼리 스트링 추출 (있는 경우)
        String queryString = request.getQueryString();
        // 4. 요청 바디 내용 추출
        String requestBody = getRequestBody(request);
        
        // 5. 요청 정보를 INFO 레벨로 로깅
        log.info("API Request - Method: {}, URI: {}, Query: {}, Body: {}", 
                method, uri, queryString, requestBody);
    }

    /**
     * HTTP 응답 정보를 로깅하는 메서드
     * 단계: 1) 응답 상태 코드 추출 2) 응답 바디 추출 3) 로그 출력
     * 입력: ContentCachingResponseWrapper 객체, 처리 시간
     * 출력: 없음 (로깅만 수행)
     */
    private void logResponse(ContentCachingResponseWrapper response, long duration) {
        // 1. HTTP 응답 상태 코드 추출 (200, 404, 500 등)
        int status = response.getStatus();
        // 2. 응답 바디 내용 추출
        String responseBody = getResponseBody(response);
        
        // 3. 응답 정보와 처리 시간을 INFO 레벨로 로깅
        log.info("API Response - Status: {}, Duration: {}ms, Body: {}", 
                status, duration, responseBody);
    }

    /**
     * HTTP 요청 바디를 문자열로 변환하는 메서드
     * 단계: 1) 캐시된 바이트 배열 조회 2) 바이트 배열을 UTF-8 문자열로 변환
     * 입력: ContentCachingRequestWrapper 객체
     * 출력: 요청 바디 문자열 (없으면 빈 문자열)
     * 조건: 바이트 배열 길이가 0보다 큰 경우에만 변환 수행
     */
    private String getRequestBody(ContentCachingRequestWrapper request) {
        // 1. 캐시된 요청 바디를 바이트 배열로 조회
        byte[] content = request.getContentAsByteArray();
        // 2. 바이트 배열에 내용이 있는 경우 UTF-8로 문자열 변환
        if (content.length > 0) {
            return new String(content, StandardCharsets.UTF_8);
        }
        // 3. 내용이 없는 경우 빈 문자열 반환
        return "";
    }

    /**
     * HTTP 응답 바디를 문자열로 변환하는 메서드
     * 단계: 1) 캐시된 바이트 배열 조회 2) 바이트 배열을 UTF-8 문자열로 변환
     * 입력: ContentCachingResponseWrapper 객체
     * 출력: 응답 바디 문자열 (없으면 빈 문자열)
     * 조건: 바이트 배열 길이가 0보다 큰 경우에만 변환 수행
     */
    private String getResponseBody(ContentCachingResponseWrapper response) {
        // 1. 캐시된 응답 바디를 바이트 배열로 조회
        byte[] content = response.getContentAsByteArray();
        // 2. 바이트 배열에 내용이 있는 경우 UTF-8로 문자열 변환
        if (content.length > 0) {
            return new String(content, StandardCharsets.UTF_8);
        }
        // 3. 내용이 없는 경우 빈 문자열 반환
        return "";
    }
}