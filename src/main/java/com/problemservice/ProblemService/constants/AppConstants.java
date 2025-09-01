package com.problemservice.ProblemService.constants;

/**
 * Application-wide constants
 */
public final class AppConstants {
    
    private AppConstants() {
        throw new UnsupportedOperationException("This is a utility class and cannot be instantiated");
    }
    
    // Session related constants
    public static final class Session {
        public static final int DEFAULT_PRACTICE_QUESTION_COUNT = 10;
        public static final int DEFAULT_REVIEW_QUESTION_COUNT = 5;
        public static final int DEFAULT_WRONG_ANSWER_QUESTION_COUNT = 5;
        public static final int MAX_SESSION_QUESTIONS = 50;
        public static final int MIN_SESSION_QUESTIONS = 1;
    }
    
    // Difficulty levels
    public static final class Difficulty {
        public static final int BEGINNER = 1;
        public static final int INTERMEDIATE = 2;
        public static final int ADVANCED = 3;
    }
    
    // API related constants
    public static final class Api {
        public static final String API_VERSION = "v1";
        public static final String BASE_PATH = "/api";
        public static final int DEFAULT_PAGE_SIZE = 20;
        public static final int MAX_PAGE_SIZE = 100;
    }
    
    // Logging related constants
    public static final class Logging {
        public static final int MAX_BODY_LOG_SIZE = 1000;
        public static final String LOG_TRUNCATION_SUFFIX = "... (truncated)";
    }
    
    // Question related constants
    public static final class Question {
        public static final int MAX_QUESTION_TEXT_LENGTH = 2000;
        public static final int MAX_OPTION_LENGTH = 500;
        public static final int MAX_EXPLANATION_LENGTH = 2000;
    }
}