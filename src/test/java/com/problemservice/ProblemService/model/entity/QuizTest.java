package com.problemservice.ProblemService.model.entity;

import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Purpose: Test validation rules and behavior of Quiz entity
 * This test class validates that the Quiz entity properly enforces
 * validation constraints and behaves correctly with valid/invalid data
 */
class QuizTest {

    private Validator validator;
    private Quiz validQuiz;

    @BeforeEach
    void setUp() {
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        validator = factory.getValidator();

        QuizCategory category = QuizCategory.builder()
                .id(1L)
                .name("English Grammar")
                .build();

        validQuiz = Quiz.builder()
                .id(1L)
                .category(category)
                .question("What is the past tense of 'go'?")
                .answer("went")
                .difficultyLevel("A1")
                .questionType("definition")
                .keyword("verb, past tense")
                .build();
    }

    /**
     * Purpose: Verify that a valid Quiz entity passes all validation constraints
     * Input: Quiz with all required fields properly set (category, question, answer, difficultyLevel, questionType)
     * Expected output: No validation violations (empty violations set)
     */
    @Test
    @DisplayName("Valid quiz should pass validation")
    void testValidQuiz() {
        Set<ConstraintViolation<Quiz>> violations = validator.validate(validQuiz);
        assertTrue(violations.isEmpty());
    }

    /**
     * Purpose: Verify that Quiz entity fails validation when category is null
     * Input: Quiz with null category field
     * Expected output: One validation violation with message "must not be null"
     */
    @Test
    @DisplayName("Quiz with null category should fail validation")
    void testQuizWithNullCategory() {
        Quiz quiz = Quiz.builder()
                .question("What is the past tense of 'go'?")
                .answer("went")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        Set<ConstraintViolation<Quiz>> violations = validator.validate(quiz);
        assertFalse(violations.isEmpty());
        assertEquals(1, violations.size());
        assertEquals("must not be null", violations.iterator().next().getMessage());
    }

    /**
     * Purpose: Verify that Quiz entity fails validation when question is blank (empty string)
     * Input: Quiz with empty string ("") as question
     * Expected output: At least one validation violation with message "must not be blank"
     */
    @Test
    @DisplayName("Quiz with blank question should fail validation")
    void testQuizWithBlankQuestion() {
        Quiz quiz = validQuiz.toBuilder()
                .question("")
                .build();

        Set<ConstraintViolation<Quiz>> violations = validator.validate(quiz);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> v.getMessage().equals("must not be blank")));
    }

    /**
     * Purpose: Verify that Quiz entity fails validation when question is null
     * Input: Quiz with null question field
     * Expected output: At least one validation violation with message "must not be blank"
     */
    @Test
    @DisplayName("Quiz with null question should fail validation")
    void testQuizWithNullQuestion() {
        Quiz quiz = validQuiz.toBuilder()
                .question(null)
                .build();

        Set<ConstraintViolation<Quiz>> violations = validator.validate(quiz);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> v.getMessage().equals("must not be blank")));
    }

    /**
     * Purpose: Verify that Quiz entity fails validation when answer is blank (empty string)
     * Input: Quiz with empty string ("") as answer
     * Expected output: At least one validation violation with message "must not be blank"
     */
    @Test
    @DisplayName("Quiz with blank answer should fail validation")
    void testQuizWithBlankAnswer() {
        Quiz quiz = validQuiz.toBuilder()
                .answer("")
                .build();

        Set<ConstraintViolation<Quiz>> violations = validator.validate(quiz);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> v.getMessage().equals("must not be blank")));
    }

    /**
     * Purpose: Verify that Quiz entity fails validation when answer is null
     * Input: Quiz with null answer field
     * Expected output: At least one validation violation with message "must not be blank"
     */
    @Test
    @DisplayName("Quiz with null answer should fail validation")
    void testQuizWithNullAnswer() {
        Quiz quiz = validQuiz.toBuilder()
                .answer(null)
                .build();

        Set<ConstraintViolation<Quiz>> violations = validator.validate(quiz);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> v.getMessage().equals("must not be blank")));
    }

    /**
     * Purpose: Verify that Quiz entity fails validation when difficultyLevel is blank
     * Input: Quiz with empty string ("") as difficultyLevel
     * Expected output: At least one validation violation with message "must not be blank"
     */
    @Test
    @DisplayName("Quiz with blank difficulty level should fail validation")
    void testQuizWithBlankDifficultyLevel() {
        Quiz quiz = validQuiz.toBuilder()
                .difficultyLevel("")
                .build();

        Set<ConstraintViolation<Quiz>> violations = validator.validate(quiz);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> v.getMessage().equals("must not be blank")));
    }

    /**
     * Purpose: Verify that Quiz entity fails validation when questionType is blank
     * Input: Quiz with empty string ("") as questionType
     * Expected output: At least one validation violation with message "must not be blank"
     */
    @Test
    @DisplayName("Quiz with blank question type should fail validation")
    void testQuizWithBlankQuestionType() {
        Quiz quiz = validQuiz.toBuilder()
                .questionType("")
                .build();

        Set<ConstraintViolation<Quiz>> violations = validator.validate(quiz);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> v.getMessage().equals("must not be blank")));
    }

    /**
     * Purpose: Verify that Quiz builder pattern works correctly and sets all fields
     * Input: Quiz created using builder with specific values (id=1, category, question, answer, etc.)
     * Expected output: Quiz object with all specified field values correctly set
     */
    @Test
    @DisplayName("Quiz builder should work correctly")
    void testQuizBuilder() {
        QuizCategory category = QuizCategory.builder()
                .id(1L)
                .name("English Grammar")
                .build();

        Quiz quiz = Quiz.builder()
                .id(1L)
                .category(category)
                .question("What is the past tense of 'go'?")
                .answer("went")
                .difficultyLevel("A1")
                .questionType("definition")
                .keyword("verb, past tense")
                .build();

        assertNotNull(quiz);
        assertEquals(1L, quiz.getId());
        assertEquals(category, quiz.getCategory());
        assertEquals("What is the past tense of 'go'?", quiz.getQuestion());
        assertEquals("went", quiz.getAnswer());
        assertEquals("A1", quiz.getDifficultyLevel());
        assertEquals("definition", quiz.getQuestionType());
        assertEquals("verb, past tense", quiz.getKeyword());
    }

    /**
     * Purpose: Verify that Quiz equals() and hashCode() methods work correctly for object comparison
     * Input: Two Quiz objects with identical field values (same id, category, question, answer, etc.)
     * Expected output: Objects are equal (equals() returns true) and have same hash code
     */
    @Test
    @DisplayName("Quiz equals and hashCode should work correctly")
    void testQuizEqualsAndHashCode() {
        QuizCategory category = QuizCategory.builder()
                .id(1L)
                .name("English Grammar")
                .build();

        Quiz quiz1 = Quiz.builder()
                .id(1L)
                .category(category)
                .question("What is the past tense of 'go'?")
                .answer("went")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        Quiz quiz2 = Quiz.builder()
                .id(1L)
                .category(category)
                .question("What is the past tense of 'go'?")
                .answer("went")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        assertEquals(quiz1, quiz2);
        assertEquals(quiz1.hashCode(), quiz2.hashCode());
    }
}