package com.problemservice.ProblemService.util;

import java.util.Collection;
import java.util.function.Supplier;

/**
 * Utility class for common validation operations
 */
public final class ValidationUtils {
    
    private ValidationUtils() {
        throw new UnsupportedOperationException("This is a utility class and cannot be instantiated");
    }
    
    /**
     * Validates that a string is not null or empty
     * 
     * @param value The value to validate
     * @param fieldName The name of the field being validated
     * @throws IllegalArgumentException if value is null or empty
     */
    public static void validateNotBlank(String value, String fieldName) {
        if (value == null || value.trim().isEmpty()) {
            throw new IllegalArgumentException(fieldName + " cannot be null or empty");
        }
    }
    
    /**
     * Validates that an object is not null
     * 
     * @param value The value to validate
     * @param fieldName The name of the field being validated
     * @throws IllegalArgumentException if value is null
     */
    public static void validateNotNull(Object value, String fieldName) {
        if (value == null) {
            throw new IllegalArgumentException(fieldName + " cannot be null");
        }
    }
    
    /**
     * Validates that a collection is not null or empty
     * 
     * @param collection The collection to validate
     * @param fieldName The name of the field being validated
     * @throws IllegalArgumentException if collection is null or empty
     */
    public static void validateNotEmpty(Collection<?> collection, String fieldName) {
        if (collection == null || collection.isEmpty()) {
            throw new IllegalArgumentException(fieldName + " cannot be null or empty");
        }
    }
    
    /**
     * Validates that a number is within a specified range
     * 
     * @param value The value to validate
     * @param min Minimum allowed value (inclusive)
     * @param max Maximum allowed value (inclusive)
     * @param fieldName The name of the field being validated
     * @throws IllegalArgumentException if value is outside the range
     */
    public static void validateRange(int value, int min, int max, String fieldName) {
        if (value < min || value > max) {
            throw new IllegalArgumentException(
                String.format("%s must be between %d and %d, but was %d", fieldName, min, max, value)
            );
        }
    }
    
    /**
     * Validates that a condition is true, throwing an exception with a custom message if false
     * 
     * @param condition The condition to validate
     * @param messageSupplier Supplier for the exception message
     * @throws IllegalArgumentException if condition is false
     */
    public static void validateCondition(boolean condition, Supplier<String> messageSupplier) {
        if (!condition) {
            throw new IllegalArgumentException(messageSupplier.get());
        }
    }
}