package com.problemservice.ProblemService.exception;

/**
 * Exception thrown when a requested entity is not found
 */
public class EntityNotFoundException extends RuntimeException {
    
    public EntityNotFoundException(String message) {
        super(message);
    }
    
    public EntityNotFoundException(String entityType, String id) {
        super(String.format("%s not found with ID: %s", entityType, id));
    }
    
    public EntityNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }
}