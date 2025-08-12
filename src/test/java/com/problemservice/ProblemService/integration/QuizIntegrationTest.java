package com.problemservice.ProblemService.integration;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.problemservice.ProblemService.model.dto.QuizCreateDto;
import com.problemservice.ProblemService.model.dto.QuizUpdateDto;
import com.problemservice.ProblemService.model.entity.Quiz;
import com.problemservice.ProblemService.model.entity.QuizCategory;
import com.problemservice.ProblemService.repository.QuizCategoryRepository;
import com.problemservice.ProblemService.repository.QuizRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureWebMvc;
import org.springframework.boot.test.autoconfigure.orm.jpa.AutoConfigureTestEntityManager;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;
import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Purpose: Test complete end-to-end integration of Quiz CRUD operations
 * This test class validates the entire application stack working together:
 * Controller -> Service -> Repository -> Database with real data persistence
 */
@SpringBootTest
@AutoConfigureWebMvc
@ActiveProfiles("test")
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_EACH_TEST_METHOD)
class QuizIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private QuizRepository quizRepository;

    @Autowired
    private QuizCategoryRepository quizCategoryRepository;

    @Autowired
    private ObjectMapper objectMapper;

    private QuizCategory testCategory;
    private QuizCreateDto createDto;
    private QuizUpdateDto updateDto;

    @BeforeEach
    void setUp() {
        quizRepository.deleteAll();
        quizCategoryRepository.deleteAll();

        testCategory = QuizCategory.builder()
                .name("English Grammar")
                .difficultyLevel("A1")
                .description("Basic English Grammar")
                .build();
        testCategory = quizCategoryRepository.save(testCategory);

        createDto = QuizCreateDto.builder()
                .categoryId(testCategory.getId())
                .question("What is the past tense of 'go'?")
                .answer("went")
                .difficultyLevel("A1")
                .questionType("definition")
                .keyword("verb, past tense")
                .build();

        updateDto = QuizUpdateDto.builder()
                .categoryId(testCategory.getId())
                .question("Updated question")
                .answer("Updated answer")
                .difficultyLevel("B1")
                .questionType("fill_blanks")
                .keyword("updated, keyword")
                .build();
    }

    /**
     * Purpose: Verify complete end-to-end quiz creation flow with database persistence
     * Input: HTTP POST request with valid QuizCreateDto, real database operations
     * Expected output: 201 CREATED, quiz persisted in database with generated ID and timestamps
     */
    @Test
    @DisplayName("Should create quiz end-to-end with database persistence")
    @Transactional
    void testCreateQuizEndToEnd() throws Exception {
        mockMvc.perform(post("/api/quizzes")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(createDto)))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.id").exists())
                .andExpect(jsonPath("$.question", is("What is the past tense of 'go'?")))
                .andExpect(jsonPath("$.answer", is("went")))
                .andExpect(jsonPath("$.difficultyLevel", is("A1")))
                .andExpect(jsonPath("$.questionType", is("definition")))
                .andExpect(jsonPath("$.categoryName", is("English Grammar")))
                .andExpect(jsonPath("$.createdAt").exists())
                .andExpect(jsonPath("$.updatedAt").exists());

        // Verify quiz was actually persisted in database
        assertEquals(1, quizRepository.count());
        Quiz savedQuiz = quizRepository.findAll().get(0);
        assertEquals("What is the past tense of 'go'?", savedQuiz.getQuestion());
        assertEquals("went", savedQuiz.getAnswer());
        assertNotNull(savedQuiz.getCreatedAt());
    }

    /**
     * Purpose: Verify complete end-to-end quiz retrieval flow from database
     * Input: HTTP GET request for existing quiz ID, real database query
     * Expected output: 200 OK with correct quiz data retrieved from database
     */
    @Test
    @DisplayName("Should retrieve quiz end-to-end from database")
    @Transactional
    void testGetQuizEndToEnd() throws Exception {
        Quiz savedQuiz = Quiz.builder()
                .category(testCategory)
                .question("What is the past tense of 'go'?")
                .answer("went")
                .difficultyLevel("A1")
                .questionType("definition")
                .keyword("verb, past tense")
                .build();
        savedQuiz = quizRepository.save(savedQuiz);

        mockMvc.perform(get("/api/quizzes/{id}", savedQuiz.getId()))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id", is(savedQuiz.getId().intValue())))
                .andExpect(jsonPath("$.question", is("What is the past tense of 'go'?")))
                .andExpect(jsonPath("$.answer", is("went")))
                .andExpect(jsonPath("$.categoryName", is("English Grammar")));
    }

    /**
     * Purpose: Verify complete end-to-end quiz update flow with database persistence
     * Input: HTTP PUT request with updated quiz data, real database update operations
     * Expected output: 200 OK with updated data, changes persisted in database
     */
    @Test
    @DisplayName("Should update quiz end-to-end with database persistence")
    @Transactional
    void testUpdateQuizEndToEnd() throws Exception {
        Quiz savedQuiz = Quiz.builder()
                .category(testCategory)
                .question("Original question")
                .answer("original answer")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();
        savedQuiz = quizRepository.save(savedQuiz);

        mockMvc.perform(put("/api/quizzes/{id}", savedQuiz.getId())
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(updateDto)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id", is(savedQuiz.getId().intValue())))
                .andExpect(jsonPath("$.question", is("Updated question")))
                .andExpect(jsonPath("$.answer", is("Updated answer")))
                .andExpect(jsonPath("$.difficultyLevel", is("B1")))
                .andExpect(jsonPath("$.questionType", is("fill_blanks")));

        // Verify quiz was actually updated in database
        Quiz updatedQuiz = quizRepository.findById(savedQuiz.getId()).orElseThrow();
        assertEquals("Updated question", updatedQuiz.getQuestion());
        assertEquals("Updated answer", updatedQuiz.getAnswer());
        assertEquals("B1", updatedQuiz.getDifficultyLevel());
    }

    /**
     * Purpose: Verify complete end-to-end quiz deletion flow with database persistence
     * Input: HTTP DELETE request for existing quiz ID, real database deletion
     * Expected output: 204 NO CONTENT, quiz removed from database
     */
    @Test
    @DisplayName("Should delete quiz end-to-end with database persistence")
    @Transactional
    void testDeleteQuizEndToEnd() throws Exception {
        Quiz savedQuiz = Quiz.builder()
                .category(testCategory)
                .question("Question to delete")
                .answer("answer to delete")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();
        savedQuiz = quizRepository.save(savedQuiz);

        assertEquals(1, quizRepository.count());

        mockMvc.perform(delete("/api/quizzes/{id}", savedQuiz.getId()))
                .andExpect(status().isNoContent());

        // Verify quiz was actually deleted from database
        assertEquals(0, quizRepository.count());
        assertTrue(quizRepository.findById(savedQuiz.getId()).isEmpty());
    }

    /**
     * Purpose: Verify complete end-to-end pagination flow with database queries
     * Input: HTTP GET request with pagination parameters, multiple quizzes in database
     * Expected output: 200 OK with correct page content and pagination metadata
     */
    @Test
    @DisplayName("Should handle pagination end-to-end with database queries")
    @Transactional
    void testPaginationEndToEnd() throws Exception {
        // Create multiple quizzes for pagination testing
        for (int i = 1; i <= 5; i++) {
            Quiz quiz = Quiz.builder()
                    .category(testCategory)
                    .question("Question " + i)
                    .answer("Answer " + i)
                    .difficultyLevel("A1")
                    .questionType("definition")
                    .build();
            quizRepository.save(quiz);
        }

        mockMvc.perform(get("/api/quizzes")
                .param("page", "0")
                .param("size", "2"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.content", hasSize(2)))
                .andExpect(jsonPath("$.totalElements", is(5)))
                .andExpect(jsonPath("$.totalPages", is(3)))
                .andExpect(jsonPath("$.size", is(2)))
                .andExpect(jsonPath("$.number", is(0)));
    }

    /**
     * Purpose: Verify complete end-to-end category filtering with database queries
     * Input: HTTP GET request with category filter, quizzes in multiple categories
     * Expected output: 200 OK with only quizzes from specified category
     */
    @Test
    @DisplayName("Should filter by category end-to-end with database queries")
    @Transactional
    void testCategoryFilteringEndToEnd() throws Exception {
        QuizCategory category2 = QuizCategory.builder()
                .name("English Vocabulary")
                .difficultyLevel("B1")
                .build();
        category2 = quizCategoryRepository.save(category2);

        // Create quizzes in different categories
        Quiz quiz1 = Quiz.builder()
                .category(testCategory)
                .question("Grammar question")
                .answer("grammar answer")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        Quiz quiz2 = Quiz.builder()
                .category(category2)
                .question("Vocabulary question")
                .answer("vocabulary answer")
                .difficultyLevel("B1")
                .questionType("definition")
                .build();

        quizRepository.save(quiz1);
        quizRepository.save(quiz2);

        mockMvc.perform(get("/api/quizzes/category/{categoryId}", testCategory.getId()))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", hasSize(1)))
                .andExpect(jsonPath("$[0].question", is("Grammar question")))
                .andExpect(jsonPath("$[0].categoryName", is("English Grammar")));
    }

    /**
     * Purpose: Verify complete end-to-end difficulty filtering with database queries
     * Input: HTTP GET request with difficulty filter, quizzes at different difficulty levels
     * Expected output: 200 OK with only quizzes matching specified difficulty level
     */
    @Test
    @DisplayName("Should filter by difficulty level end-to-end with database queries")
    @Transactional
    void testDifficultyFilteringEndToEnd() throws Exception {
        Quiz easyQuiz = Quiz.builder()
                .category(testCategory)
                .question("Easy question")
                .answer("easy answer")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        Quiz hardQuiz = Quiz.builder()
                .category(testCategory)
                .question("Hard question")
                .answer("hard answer")
                .difficultyLevel("C1")
                .questionType("definition")
                .build();

        quizRepository.save(easyQuiz);
        quizRepository.save(hardQuiz);

        mockMvc.perform(get("/api/quizzes/difficulty/{level}", "A1"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", hasSize(1)))
                .andExpect(jsonPath("$[0].question", is("Easy question")))
                .andExpect(jsonPath("$[0].difficultyLevel", is("A1")));
    }

    /**
     * Purpose: Verify end-to-end error handling for non-existent resources
     * Input: HTTP GET request for non-existent quiz ID (999)
     * Expected output: 404 NOT FOUND with appropriate error message
     */
    @Test
    @DisplayName("Should handle non-existent quiz error end-to-end")
    void testNonExistentQuizErrorHandling() throws Exception {
        mockMvc.perform(get("/api/quizzes/{id}", 999L))
                .andExpect(status().isNotFound());
    }

    /**
     * Purpose: Verify end-to-end validation error handling with database constraints
     * Input: HTTP POST request with invalid quiz data (missing required fields)
     * Expected output: 400 BAD REQUEST with validation error details
     */
    @Test
    @DisplayName("Should handle validation errors end-to-end")
    void testValidationErrorHandling() throws Exception {
        QuizCreateDto invalidDto = QuizCreateDto.builder()
                .categoryId(testCategory.getId())
                .question("")  // blank question should fail validation
                .answer("valid answer")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        mockMvc.perform(post("/api/quizzes")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(invalidDto)))
                .andExpect(status().isBadRequest());

        // Verify no quiz was created due to validation error
        assertEquals(0, quizRepository.count());
    }

    /**
     * Purpose: Verify end-to-end foreign key constraint handling
     * Input: HTTP POST request with non-existent category ID
     * Expected output: 404 NOT FOUND or 400 BAD REQUEST with appropriate error message
     */
    @Test
    @DisplayName("Should handle foreign key constraint errors end-to-end")
    void testForeignKeyConstraintHandling() throws Exception {
        QuizCreateDto dtoWithInvalidCategory = createDto.toBuilder()
                .categoryId(999L)  // non-existent category
                .build();

        mockMvc.perform(post("/api/quizzes")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(dtoWithInvalidCategory)))
                .andExpect(status().isNotFound());

        // Verify no quiz was created due to constraint error
        assertEquals(0, quizRepository.count());
    }
}