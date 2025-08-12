package com.problemservice.ProblemService.validation;

import com.problemservice.ProblemService.model.dto.QuizCreateDto;
import com.problemservice.ProblemService.model.dto.QuizUpdateDto;
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
 * Purpose: Test validation rules and error scenarios for Quiz DTOs and business logic
 * This test class validates that all input validation works correctly
 * and appropriate error messages are returned for invalid data
 */
class QuizValidationTest {

    private Validator validator;
    private QuizCreateDto validCreateDto;
    private QuizUpdateDto validUpdateDto;

    @BeforeEach
    void setUp() {
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        validator = factory.getValidator();

        validCreateDto = QuizCreateDto.builder()
                .categoryId(1L)
                .question("What is the past tense of 'go'?")
                .answer("went")
                .difficultyLevel("A1")
                .questionType("definition")
                .keyword("verb, past tense")
                .build();

        validUpdateDto = QuizUpdateDto.builder()
                .categoryId(1L)
                .question("Updated question")
                .answer("Updated answer")
                .difficultyLevel("B1")
                .questionType("fill_blanks")
                .keyword("updated, keyword")
                .build();
    }

    /**
     * Purpose: Verify that valid QuizCreateDto passes all validation constraints
     * Input: QuizCreateDto with all required fields properly set
     * Expected output: No validation violations (empty violations set)
     */
    @Test
    @DisplayName("Valid QuizCreateDto should pass validation")
    void testValidQuizCreateDto() {
        Set<ConstraintViolation<QuizCreateDto>> violations = validator.validate(validCreateDto);
        assertTrue(violations.isEmpty());
    }

    /**
     * Purpose: Verify that QuizCreateDto fails validation when categoryId is null
     * Input: QuizCreateDto with null categoryId field
     * Expected output: One validation violation with message about null categoryId
     */
    @Test
    @DisplayName("QuizCreateDto should fail validation with null categoryId")
    void testQuizCreateDtoWithNullCategoryId() {
        QuizCreateDto dto = validCreateDto.toBuilder()
                .categoryId(null)
                .build();

        Set<ConstraintViolation<QuizCreateDto>> violations = validator.validate(dto);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> 
            v.getPropertyPath().toString().equals("categoryId")));
    }

    /**
     * Purpose: Verify that QuizCreateDto fails validation when question is blank
     * Input: QuizCreateDto with empty string as question
     * Expected output: At least one validation violation with message "must not be blank"
     */
    @Test
    @DisplayName("QuizCreateDto should fail validation with blank question")
    void testQuizCreateDtoWithBlankQuestion() {
        QuizCreateDto dto = validCreateDto.toBuilder()
                .question("")
                .build();

        Set<ConstraintViolation<QuizCreateDto>> violations = validator.validate(dto);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> 
            v.getMessage().contains("must not be blank") && 
            v.getPropertyPath().toString().equals("question")));
    }

    /**
     * Purpose: Verify that QuizCreateDto fails validation when answer is blank
     * Input: QuizCreateDto with empty string as answer
     * Expected output: At least one validation violation with message "must not be blank"
     */
    @Test
    @DisplayName("QuizCreateDto should fail validation with blank answer")
    void testQuizCreateDtoWithBlankAnswer() {
        QuizCreateDto dto = validCreateDto.toBuilder()
                .answer("")
                .build();

        Set<ConstraintViolation<QuizCreateDto>> violations = validator.validate(dto);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> 
            v.getMessage().contains("must not be blank") && 
            v.getPropertyPath().toString().equals("answer")));
    }

    /**
     * Purpose: Verify that QuizCreateDto fails validation when difficultyLevel is blank
     * Input: QuizCreateDto with empty string as difficultyLevel
     * Expected output: At least one validation violation with message "must not be blank"
     */
    @Test
    @DisplayName("QuizCreateDto should fail validation with blank difficulty level")
    void testQuizCreateDtoWithBlankDifficultyLevel() {
        QuizCreateDto dto = validCreateDto.toBuilder()
                .difficultyLevel("")
                .build();

        Set<ConstraintViolation<QuizCreateDto>> violations = validator.validate(dto);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> 
            v.getMessage().contains("must not be blank") && 
            v.getPropertyPath().toString().equals("difficultyLevel")));
    }

    /**
     * Purpose: Verify that QuizCreateDto fails validation when questionType is blank
     * Input: QuizCreateDto with empty string as questionType
     * Expected output: At least one validation violation with message "must not be blank"
     */
    @Test
    @DisplayName("QuizCreateDto should fail validation with blank question type")
    void testQuizCreateDtoWithBlankQuestionType() {
        QuizCreateDto dto = validCreateDto.toBuilder()
                .questionType("")
                .build();

        Set<ConstraintViolation<QuizCreateDto>> violations = validator.validate(dto);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> 
            v.getMessage().contains("must not be blank") && 
            v.getPropertyPath().toString().equals("questionType")));
    }

    /**
     * Purpose: Verify that QuizCreateDto fails validation when question exceeds maximum length
     * Input: QuizCreateDto with question longer than allowed limit (1000+ characters)
     * Expected output: At least one validation violation with message about size limit
     */
    @Test
    @DisplayName("QuizCreateDto should fail validation with oversized question")
    void testQuizCreateDtoWithOversizedQuestion() {
        String longQuestion = "A".repeat(1001);
        QuizCreateDto dto = validCreateDto.toBuilder()
                .question(longQuestion)
                .build();

        Set<ConstraintViolation<QuizCreateDto>> violations = validator.validate(dto);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> 
            v.getPropertyPath().toString().equals("question") &&
            v.getMessage().contains("size")));
    }

    /**
     * Purpose: Verify that QuizCreateDto fails validation when answer exceeds maximum length
     * Input: QuizCreateDto with answer longer than allowed limit (500+ characters)
     * Expected output: At least one validation violation with message about size limit
     */
    @Test
    @DisplayName("QuizCreateDto should fail validation with oversized answer")
    void testQuizCreateDtoWithOversizedAnswer() {
        String longAnswer = "A".repeat(501);
        QuizCreateDto dto = validCreateDto.toBuilder()
                .answer(longAnswer)
                .build();

        Set<ConstraintViolation<QuizCreateDto>> violations = validator.validate(dto);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> 
            v.getPropertyPath().toString().equals("answer") &&
            v.getMessage().contains("size")));
    }

    /**
     * Purpose: Verify that valid QuizUpdateDto passes all validation constraints
     * Input: QuizUpdateDto with all required fields properly set
     * Expected output: No validation violations (empty violations set)
     */
    @Test
    @DisplayName("Valid QuizUpdateDto should pass validation")
    void testValidQuizUpdateDto() {
        Set<ConstraintViolation<QuizUpdateDto>> violations = validator.validate(validUpdateDto);
        assertTrue(violations.isEmpty());
    }

    /**
     * Purpose: Verify that QuizUpdateDto fails validation when categoryId is null
     * Input: QuizUpdateDto with null categoryId field
     * Expected output: One validation violation with message about null categoryId
     */
    @Test
    @DisplayName("QuizUpdateDto should fail validation with null categoryId")
    void testQuizUpdateDtoWithNullCategoryId() {
        QuizUpdateDto dto = validUpdateDto.toBuilder()
                .categoryId(null)
                .build();

        Set<ConstraintViolation<QuizUpdateDto>> violations = validator.validate(dto);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> 
            v.getPropertyPath().toString().equals("categoryId")));
    }

    /**
     * Purpose: Verify that QuizUpdateDto fails validation when question is blank
     * Input: QuizUpdateDto with empty string as question
     * Expected output: At least one validation violation with message "must not be blank"
     */
    @Test
    @DisplayName("QuizUpdateDto should fail validation with blank question")
    void testQuizUpdateDtoWithBlankQuestion() {
        QuizUpdateDto dto = validUpdateDto.toBuilder()
                .question("")
                .build();

        Set<ConstraintViolation<QuizUpdateDto>> violations = validator.validate(dto);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> 
            v.getMessage().contains("must not be blank") && 
            v.getPropertyPath().toString().equals("question")));
    }

    /**
     * Purpose: Verify that multiple validation errors are captured simultaneously
     * Input: QuizCreateDto with multiple invalid fields (null categoryId, blank question, blank answer)
     * Expected output: Multiple validation violations (at least 3) with appropriate error messages
     */
    @Test
    @DisplayName("Should capture multiple validation errors simultaneously")
    void testMultipleValidationErrors() {
        QuizCreateDto dto = QuizCreateDto.builder()
                .categoryId(null)
                .question("")
                .answer("")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        Set<ConstraintViolation<QuizCreateDto>> violations = validator.validate(dto);
        assertTrue(violations.size() >= 3);
        
        boolean hasCategoryIdError = violations.stream()
            .anyMatch(v -> v.getPropertyPath().toString().equals("categoryId"));
        boolean hasQuestionError = violations.stream()
            .anyMatch(v -> v.getPropertyPath().toString().equals("question"));
        boolean hasAnswerError = violations.stream()
            .anyMatch(v -> v.getPropertyPath().toString().equals("answer"));
            
        assertTrue(hasCategoryIdError);
        assertTrue(hasQuestionError);
        assertTrue(hasAnswerError);
    }

    /**
     * Purpose: Verify that keyword field accepts null values (optional field)
     * Input: QuizCreateDto with null keyword field
     * Expected output: No validation violations (keyword is optional)
     */
    @Test
    @DisplayName("Keyword field should be optional and accept null values")
    void testOptionalKeywordField() {
        QuizCreateDto dto = validCreateDto.toBuilder()
                .keyword(null)
                .build();

        Set<ConstraintViolation<QuizCreateDto>> violations = validator.validate(dto);
        assertTrue(violations.isEmpty());
    }

    /**
     * Purpose: Verify that difficultyLevel only accepts valid enum values
     * Input: QuizCreateDto with invalid difficultyLevel "X9"
     * Expected output: At least one validation violation with message about invalid enum value
     */
    @Test
    @DisplayName("Should validate difficulty level enum values")
    void testInvalidDifficultyLevelEnum() {
        QuizCreateDto dto = validCreateDto.toBuilder()
                .difficultyLevel("X9")
                .build();

        Set<ConstraintViolation<QuizCreateDto>> violations = validator.validate(dto);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> 
            v.getPropertyPath().toString().equals("difficultyLevel")));
    }

    /**
     * Purpose: Verify that questionType only accepts valid enum values
     * Input: QuizCreateDto with invalid questionType "invalid_type"
     * Expected output: At least one validation violation with message about invalid enum value
     */
    @Test
    @DisplayName("Should validate question type enum values")
    void testInvalidQuestionTypeEnum() {
        QuizCreateDto dto = validCreateDto.toBuilder()
                .questionType("invalid_type")
                .build();

        Set<ConstraintViolation<QuizCreateDto>> violations = validator.validate(dto);
        assertFalse(violations.isEmpty());
        assertTrue(violations.stream().anyMatch(v -> 
            v.getPropertyPath().toString().equals("questionType")));
    }
}