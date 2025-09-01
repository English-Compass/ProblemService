package com.problemservice.ProblemService.config;

import com.problemservice.ProblemService.constants.AppConstants;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.util.ContentCachingRequestWrapper;
import org.springframework.web.util.ContentCachingResponseWrapper;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

/**
 * HTTP 요청/응답 상세 로깅 서블릿 필터
 * /api/** 경로의 모든 HTTP 요청에 대해 요청 메서드, URI, 클라이언트 IP, 
 * 요청/응답 바디, 처리 시간을 상세히 기록하여 API 디버깅과 성능 모니터링 지원
 */
@Slf4j
@RequiredArgsConstructor
public class LoggingFilter implements Filter {
    
    private final AppProperties appProperties;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        // API 경로가 아니거나 로깅이 비활성화된 경우 필터링 없이 통과
        String requestURI = httpRequest.getRequestURI();
        if (!requestURI.startsWith(AppConstants.Api.BASE_PATH + "/") || 
            !appProperties.getLogging().isEnableApiLogging()) {
            chain.doFilter(request, response);
            return;
        }
        
        // 요청/응답 내용 캐싱을 위한 래퍼 생성
        ContentCachingRequestWrapper wrappedRequest = new ContentCachingRequestWrapper(httpRequest);
        ContentCachingResponseWrapper wrappedResponse = new ContentCachingResponseWrapper(httpResponse);
        
        long startTime = System.currentTimeMillis();
        
        try {
            logRequest(wrappedRequest);
            chain.doFilter(wrappedRequest, wrappedResponse);
        } finally {
            long duration = System.currentTimeMillis() - startTime;
            logResponse(wrappedResponse, duration);
            wrappedResponse.copyBodyToResponse();
        }
    }

    /**
     * HTTP 요청 상세 정보 로깅 및 기록
     * 요청 메서드, URI, 쿼리 파라미터, 클라이언트 IP를 기록하고,
     * POST/PUT/PATCH 메서드의 경우 요청 바디도 추가로 로깅
     * @param request 콘텐츠 캐싱이 가능한 HTTP 요청 래퍼
     */
    private void logRequest(ContentCachingRequestWrapper request) {
        String method = request.getMethod();
        String uri = request.getRequestURI();
        String queryString = request.getQueryString();
        String clientIp = getClientIpAddress(request);
        
        log.info("=== API REQUEST === Method: {}, URI: {}, Query: {}, Client IP: {}", 
                method, uri, queryString, clientIp);
        
        // POST, PUT, PATCH 메서드의 경우 요청 바디 로깅
        if ("POST".equals(method) || "PUT".equals(method) || "PATCH".equals(method)) {
            String requestBody = getRequestBody(request);
            if (!requestBody.isEmpty()) {
                log.info("Request Body: {}", requestBody);
            }
        }
    }

    /**
     * HTTP 응답 상세 정보 로깅 및 기록
     * 응답 상태 코드, 처리 시간, 응답 바디를 기록하며
     * 설정된 최대 크기를 초과하는 응답은 자동으로 잘라냄
     * @param response 콘텐츠 캐싱이 가능한 HTTP 응답 래퍼
     * @param duration 요청 처리 소요 시간 (밀리초)
     */
    private void logResponse(ContentCachingResponseWrapper response, long duration) {
        int status = response.getStatus();
        String responseBody = getResponseBody(response);
        
        log.info("=== API RESPONSE === Status: {}, Duration: {}ms", status, duration);
        
        if (!responseBody.isEmpty()) {
            int maxSize = appProperties.getLogging().getMaxBodyLogSize();
            if (responseBody.length() > maxSize) {
                String suffix = appProperties.getLogging().getTruncationSuffix();
                log.info("Response Body: {}{}", responseBody.substring(0, maxSize), suffix);
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
            int maxSize = appProperties.getLogging().getMaxBodyLogSize();
            String suffix = appProperties.getLogging().getTruncationSuffix();
            return body.length() > maxSize ? body.substring(0, maxSize) + suffix : body;
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

    /**
     * 실제 클라이언트 IP 주소 추출 (프록시 환경 고려)
     */
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