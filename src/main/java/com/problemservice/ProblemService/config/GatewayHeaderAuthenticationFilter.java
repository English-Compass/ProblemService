package com.problemservice.ProblemService.config;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * API Gateway에서 전달하는 헤더를 읽어서 인증 정보를 설정하는 필터
 * API Gateway에서 JWT 검증 후 X-User-Id, X-User-Role 헤더를 추가하여 전달
 */
@Slf4j
public class GatewayHeaderAuthenticationFilter extends OncePerRequestFilter {

    private static final String USER_ID_HEADER = "X-User-Id";
    private static final String USER_ROLE_HEADER = "X-User-Role";

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        
        String requestURI = request.getRequestURI();
        String method = request.getMethod();
        
        // 내부 API 경로는 인증 정보 설정 건너뛰기
        if (isInternalApiPath(requestURI)) {
            log.info("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
            log.info("✅ Internal API path detected: {}, method: {}", requestURI, method);
            log.info("   Skipping authentication header check");
            log.info("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
            filterChain.doFilter(request, response);
            return;
        }
        
        // API Gateway에서 전달한 헤더 읽기
        String userId = request.getHeader(USER_ID_HEADER);
        String userRole = request.getHeader(USER_ROLE_HEADER);
        
        log.debug("GatewayHeaderAuthenticationFilter - URI: {}, Method: {}, X-User-Id: {}, X-User-Role: {}", 
                requestURI, method, userId, userRole);
        
        // 헤더가 있으면 인증 정보 설정
        if (userId != null && !userId.trim().isEmpty()) {
            List<SimpleGrantedAuthority> authorities = new ArrayList<>();
            
            // 역할 헤더가 있으면 권한 추가
            if (userRole != null && !userRole.trim().isEmpty()) {
                authorities.add(new SimpleGrantedAuthority(userRole));
            } else {
                // 기본 역할 설정
                authorities.add(new SimpleGrantedAuthority("USER"));
            }
            
            // Authentication 객체 생성 및 SecurityContext에 설정
            Authentication auth = new UsernamePasswordAuthenticationToken(userId, null, authorities);
            SecurityContextHolder.getContext().setAuthentication(auth);
            
            log.debug("Authentication set for userId: {}, role: {}", userId, userRole != null ? userRole : "USER");
        } else {
            log.debug("No X-User-Id header found, proceeding without authentication");
        }
        
        // 헤더가 없어도 필터 체인 계속 진행 (permitAll 경로는 헤더 없이도 접근 가능)
        filterChain.doFilter(request, response);
    }
    
    /**
     * 내부 API 경로인지 확인
     * 내부 API는 서비스 간 통신용으로 인증 헤더 체크를 건너뛴다
     */
    private boolean isInternalApiPath(String requestURI) {
        return requestURI != null && 
               (requestURI.startsWith("/problem/internal/") ||
                requestURI.startsWith("/actuator/") ||
                requestURI.startsWith("/test/"));
    }
}
