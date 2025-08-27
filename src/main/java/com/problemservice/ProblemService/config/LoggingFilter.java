package com.problemservice.ProblemService.config;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.util.ContentCachingRequestWrapper;
import org.springframework.web.util.ContentCachingResponseWrapper;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

/**
 * HTTP 요청 및 응답 로깅을 위한 서블릿 필터
 * /api/** 경로에 대해 요청/응답 내용, 시간, IP 주소를 기록
 * 입력: HTTP 요청 (메소드, URI, 헤더, 바디)
 * 출력: 로깅된 HTTP 요청/응답 정보
 */
@Slf4j
public class LoggingFilter implements Filter {

    /**
     * 대상 요청에 대해 로깅 수행 및 요청 처리
     * 단계: 1) API 경로 확인 2) 요청/응답 래퍼 생성 3) 요청 로깅 4) 요청 처리 5) 응답 로깅
     * 입력: 서블릿 요청, 응답, 필터 체인
     * 출력: 로깅된 요청/응답 정보
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        
        // 1단계: HTTP 요청/응답으로 캐스팅
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        // 2단계: API 경로 확인 - /api/로 시작하지 않으면 로깅 없이 통과
        String requestURI = httpRequest.getRequestURI();
        if (!requestURI.startsWith("/api/")) {
            chain.doFilter(request, response);
            return;
        }
        
        // 3단계: 요청/응답 내용을 캐시할 수 있는 래퍼 생성
        ContentCachingRequestWrapper wrappedRequest = new ContentCachingRequestWrapper(httpRequest);
        ContentCachingResponseWrapper wrappedResponse = new ContentCachingResponseWrapper(httpResponse);
        
        // 4단계: 요청 시작 시간 기록
        long startTime = System.currentTimeMillis();
        
        try {
            // 5단계: 요청 정보 로깅
            logRequest(wrappedRequest);
            // 6단계: 다음 필터로 요청 전달 (실제 요청 처리)
            chain.doFilter(wrappedRequest, wrappedResponse);
        } finally {
            // 7단계: 요청 처리 시간 계산 및 응답 로깅
            long duration = System.currentTimeMillis() - startTime;
            logResponse(wrappedResponse, duration);
            // 8단계: 응답 바디를 실제 응답으로 복사
            wrappedResponse.copyBodyToResponse();
        }
    }

    /**
     * HTTP 요청 정보를 로깅하는 메소드
     * 단계: 1) 요청 기본 정보 추출 2) 기본 정보 로깅 3) 대상 메소드에 대해 바디 로깅
     * 입력: 콘텐츠 캐시를 지원하는 HTTP 요청 래퍼
     * 출력: 로깅된 요청 정보
     */
    private void logRequest(ContentCachingRequestWrapper request) {
        // 1단계: 요청에서 기본 정보 추출
        String method = request.getMethod(); // HTTP 메소드 (GET, POST 등)
        String uri = request.getRequestURI(); // 요청 URI
        String queryString = request.getQueryString(); // 쿼리 파라미터
        String clientIp = getClientIpAddress(request); // 클라이언트 IP 주소
        
        // 2단계: 요청 기본 정보 로깅
        log.info("=== API REQUEST === Method: {}, URI: {}, Query: {}, Client IP: {}", 
                method, uri, queryString, clientIp);
        
        // 3단계: 데이터를 전송하는 메소드의 경우 요청 바디 로깅
        if ("POST".equals(method) || "PUT".equals(method) || "PATCH".equals(method)) {
            String requestBody = getRequestBody(request); // 요청 바디 추출
            if (!requestBody.isEmpty()) {
                log.info("Request Body: {}", requestBody);
            }
        }
    }

    private void logResponse(ContentCachingResponseWrapper response, long duration) {
        int status = response.getStatus();
        String responseBody = getResponseBody(response);
        
        log.info("=== API RESPONSE === Status: {}, Duration: {}ms", status, duration);
        
        if (!responseBody.isEmpty()) {
            if (responseBody.length() > 1000) {
                log.info("Response Body: {}... (truncated)", responseBody.substring(0, 1000));
            } else {
                log.info("Response Body: {}", responseBody);
            }
        }
        
        log.info("=== END API CALL ===");
    }

    private String getRequestBody(ContentCachingRequestWrapper request) {
        byte[] content = request.getContentAsByteArray();
        if (content.length > 0) {
            String body = new String(content, StandardCharsets.UTF_8);
            return body.length() > 1000 ? body.substring(0, 1000) + "... (truncated)" : body;
        }
        return "";
    }

    private String getResponseBody(ContentCachingResponseWrapper response) {
        byte[] content = response.getContentAsByteArray();
        if (content.length > 0) {
            return new String(content, StandardCharsets.UTF_8);
        }
        return "";
    }

    private String getClientIpAddress(HttpServletRequest request) {
        String xForwardedFor = request.getHeader("X-Forwarded-For");
        if (xForwardedFor != null && !xForwardedFor.isEmpty()) {
            return xForwardedFor.split(",")[0].trim();
        }
        
        String xRealIp = request.getHeader("X-Real-IP");
        if (xRealIp != null && !xRealIp.isEmpty()) {
            return xRealIp;
        }
        
        return request.getRemoteAddr();
    }
}