package com.problemservice.ProblemService.exception;

/**
 * 비즈니스 로직 예외
 * 비즈니스 규칙 위반이나 잘못된 요청 시 발생
 */
public class BusinessLogicException extends RuntimeException {
    
    public BusinessLogicException(String message) {
        super(message);
    }
    
    public BusinessLogicException(String message, Throwable cause) {
        super(message, cause);
    }
}

