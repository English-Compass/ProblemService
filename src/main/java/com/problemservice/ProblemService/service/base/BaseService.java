package com.problemservice.ProblemService.service.base;

import lombok.extern.slf4j.Slf4j;

/**
 * Base service class providing common functionality for all service classes
 */
@Slf4j
public abstract class BaseService {
    
    /**
     * Validates that the given ID is not null or empty
     * 
     * @param id The ID to validate
     * @param entityType The type of entity (for error messages)
     * @throws IllegalArgumentException if ID is null or empty
     */
    protected void validateId(String id, String entityType) {
        if (id == null || id.trim().isEmpty()) {
            String message = String.format("%s ID cannot be null or empty", entityType);
            log.error(message);
            throw new IllegalArgumentException(message);
        }
    }
    
    
    /**
     * Logs service method entry
     * 
     * @param methodName The name of the method being called
     * @param params Parameters passed to the method
     */
    protected void logMethodEntry(String methodName, Object... params) {
        log.debug("Entering {}, parameters: {}", methodName, params);
    }
    
    /**
     * Logs service method exit
     * 
     * @param methodName The name of the method being called
     * @param result The result being returned
     */
    protected void logMethodExit(String methodName, Object result) {
        log.debug("Exiting {}, result: {}", methodName, result);
    }
}