package com.problemservice.ProblemService.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Configuration properties for the application
 */
@Data
@Component
@ConfigurationProperties(prefix = "app")
public class AppProperties {
    
    private Session session = new Session();
    private Logging logging = new Logging();
    private Api api = new Api();
    
    @Data
    public static class Session {
        private int defaultPracticeQuestionCount = 10;
        private int defaultReviewQuestionCount = 5;
        private int defaultWrongAnswerQuestionCount = 5;
        private int maxSessionQuestions = 50;
        private int minSessionQuestions = 1;
    }
    
    @Data
    public static class Logging {
        private int maxBodyLogSize = 1000;
        private String truncationSuffix = "... (truncated)";
        private boolean enableApiLogging = true;
    }
    
    @Data
    public static class Api {
        private int defaultPageSize = 20;
        private int maxPageSize = 100;
    }
}