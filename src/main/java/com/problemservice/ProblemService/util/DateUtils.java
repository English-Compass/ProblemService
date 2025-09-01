package com.problemservice.ProblemService.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

/**
 * Utility class for date and time operations
 */
public final class DateUtils {
    
    private static final DateTimeFormatter ISO_FORMATTER = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
    private static final DateTimeFormatter DISPLAY_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    
    private DateUtils() {
        throw new UnsupportedOperationException("This is a utility class and cannot be instantiated");
    }
    
    /**
     * Parses a date string in ISO format to LocalDateTime
     * 
     * @param dateString The date string to parse
     * @return LocalDateTime object
     * @throws IllegalArgumentException if the date string is invalid
     */
    public static LocalDateTime parseIsoDateTime(String dateString) {
        try {
            return LocalDateTime.parse(dateString, ISO_FORMATTER);
        } catch (DateTimeParseException e) {
            throw new IllegalArgumentException("Invalid date format. Expected ISO format (yyyy-MM-ddTHH:mm:ss)", e);
        }
    }
    
    /**
     * Formats a LocalDateTime to a display-friendly string
     * 
     * @param dateTime The LocalDateTime to format
     * @return Formatted date string
     */
    public static String formatForDisplay(LocalDateTime dateTime) {
        if (dateTime == null) {
            return null;
        }
        return dateTime.format(DISPLAY_FORMATTER);
    }
    
    /**
     * Formats a LocalDateTime to ISO string
     * 
     * @param dateTime The LocalDateTime to format
     * @return ISO formatted date string
     */
    public static String formatToIso(LocalDateTime dateTime) {
        if (dateTime == null) {
            return null;
        }
        return dateTime.format(ISO_FORMATTER);
    }
    
    /**
     * Gets the current date and time
     * 
     * @return Current LocalDateTime
     */
    public static LocalDateTime now() {
        return LocalDateTime.now();
    }
    
    /**
     * Checks if a date is within a specified range
     * 
     * @param date The date to check
     * @param startDate The start of the range (inclusive)
     * @param endDate The end of the range (inclusive)
     * @return true if the date is within the range
     */
    public static boolean isWithinRange(LocalDateTime date, LocalDateTime startDate, LocalDateTime endDate) {
        if (date == null || startDate == null || endDate == null) {
            return false;
        }
        return !date.isBefore(startDate) && !date.isAfter(endDate);
    }
}