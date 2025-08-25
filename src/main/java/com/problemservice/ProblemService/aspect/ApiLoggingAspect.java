package com.problemservice.ProblemService.aspect;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import jakarta.servlet.http.HttpServletRequest;

@Slf4j
@Aspect
@Component
@RequiredArgsConstructor
public class ApiLoggingAspect {

    private final ObjectMapper objectMapper;

    @Around("@within(org.springframework.web.bind.annotation.RestController)")
    public Object logApiCalls(ProceedingJoinPoint joinPoint) throws Throwable {
        long startTime = System.currentTimeMillis();
        
        String methodName = joinPoint.getSignature().getName();
        String className = joinPoint.getTarget().getClass().getSimpleName();
        Object[] args = joinPoint.getArgs();
        
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        String httpMethod = "";
        String requestUri = "";
        
        if (attributes != null) {
            HttpServletRequest request = attributes.getRequest();
            httpMethod = request.getMethod();
            requestUri = request.getRequestURI();
        }
        
        try {
            log.info(">>> API CALL START - {}.{}() - {} {}", 
                    className, methodName, httpMethod, requestUri);
            
            for (int i = 0; i < args.length; i++) {
                Object arg = args[i];
                if (arg != null && !isServletObject(arg)) {
                    try {
                        String argJson = objectMapper.writeValueAsString(arg);
                        log.info("Input Parameter [{}]: {}", i, argJson);
                    } catch (Exception e) {
                        log.info("Input Parameter [{}]: {} (serialization failed)", i, arg.getClass().getSimpleName());
                    }
                }
            }
            
            Object result = joinPoint.proceed();
            
            long duration = System.currentTimeMillis() - startTime;
            
            if (result != null) {
                try {
                    String resultJson = objectMapper.writeValueAsString(result);
                    log.info("Output Result: {}", resultJson);
                } catch (Exception e) {
                    log.info("Output Result: {} (serialization failed)", result.getClass().getSimpleName());
                }
            } else {
                log.info("Output Result: null");
            }
            
            log.info("<<< API CALL END - {}.{}() - Duration: {}ms", 
                    className, methodName, duration);
            
            return result;
            
        } catch (Exception e) {
            long duration = System.currentTimeMillis() - startTime;
            log.error("XXX API CALL ERROR - {}.{}() - Duration: {}ms - Error: {}", 
                    className, methodName, duration, e.getMessage());
            throw e;
        }
    }
    
    private boolean isServletObject(Object obj) {
        String className = obj.getClass().getName();
        return className.contains("HttpServletRequest") || 
               className.contains("HttpServletResponse") ||
               className.contains("Servlet") ||
               className.contains("Pageable") ||
               className.contains("Principal");
    }
}