package com.problemservice.ProblemService.exception;

/**
 * 엔티티를 찾을 수 없을 때 발생하는 예외
 * 데이터베이스에서 요청한 엔티티가 존재하지 않을 때 사용
 */
public class EntityNotFoundException extends RuntimeException {
    
    public EntityNotFoundException(String message) {
        super(message);
    }
    
    public EntityNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }
    
    public EntityNotFoundException(String entityName, String id) {
        super(String.format("%s not found with id: %s", entityName, id));
    }
}

