package com.problemservice.ProblemService.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.problemservice.ProblemService.model.dto.QuizCreateDto;
import com.problemservice.ProblemService.model.dto.QuizResponseDto;
import com.problemservice.ProblemService.model.dto.QuizUpdateDto;
import com.problemservice.ProblemService.service.QuizService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Purpose: Test REST API endpoints and HTTP request/response handling of QuizController
 * This test class validates that the QuizController properly handles
 * HTTP requests, request validation, response formatting, and error handling
 */
@WebMvcTest(QuizController.class)
class QuizControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private QuizService quizService;

    @Autowired
    private ObjectMapper objectMapper;

    private QuizCreateDto createDto;
    private QuizUpdateDto updateDto;
    private QuizResponseDto responseDto;

    @BeforeEach
    void setUp() {
        createDto = QuizCreateDto.builder()
                .categoryId(1L)
                .question("What is the past tense of 'go'?")
                .answer("went")
                .difficultyLevel("A1")
                .questionType("definition")
                .keyword("verb, past tense")
                .build();

        updateDto = QuizUpdateDto.builder()
                .categoryId(1L)
                .question("Updated question")
                .answer("Updated answer")
                .difficultyLevel("B1")
                .questionType("fill_blanks")
                .keyword("updated, keyword")
                .build();

        responseDto = QuizResponseDto.builder()
                .id(1L)
                .categoryId(1L)
                .categoryName("English Grammar")
                .question("What is the past tense of 'go'?")
                .answer("went")
                .difficultyLevel("A1")
                .questionType("definition")
                .keyword("verb, past tense")
                .createdAt(LocalDateTime.now())
                .updatedAt(LocalDateTime.now())
                .build();
    }

    /**
     * Purpose: Verify that POST /api/quizzes creates a quiz and returns 201 CREATED
     * Input: HTTP POST request with valid QuizCreateDto JSON body
     * Expected output: 201 CREATED status, QuizResponseDto JSON with generated ID and all fields
     */
    @Test
    @DisplayName("Should create quiz successfully and return 201")
    void testCreateQuiz() throws Exception {
        when(quizService.createQuiz(any(QuizCreateDto.class))).thenReturn(responseDto);

        mockMvc.perform(post("/api/quizzes")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(createDto)))
                .andExpect(status().isCreated())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$.id", is(1)))
                .andExpect(jsonPath("$.question", is("What is the past tense of 'go'?")))
                .andExpect(jsonPath("$.answer", is("went")))
                .andExpect(jsonPath("$.difficultyLevel", is("A1")))
                .andExpect(jsonPath("$.questionType", is("definition")))
                .andExpect(jsonPath("$.keyword", is("verb, past tense")));

        verify(quizService).createQuiz(any(QuizCreateDto.class));
    }

    /**
     * Purpose: Verify that POST /api/quizzes returns 400 BAD REQUEST for invalid data
     * Input: HTTP POST request with invalid JSON (missing required question field)
     * Expected output: 400 BAD REQUEST status with validation error message
     */
    @Test
    @DisplayName("Should return 400 when creating quiz with invalid data")
    void testCreateQuizWithInvalidData() throws Exception {
        QuizCreateDto invalidDto = QuizCreateDto.builder()
                .categoryId(1L)
                .answer("went")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        mockMvc.perform(post("/api/quizzes")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(invalidDto)))
                .andExpect(status().isBadRequest());

        verify(quizService, never()).createQuiz(any(QuizCreateDto.class));
    }

    /**
     * Purpose: Verify that GET /api/quizzes/{id} retrieves a quiz and returns 200 OK
     * Input: HTTP GET request with existing quiz ID (1) in path parameter
     * Expected output: 200 OK status, QuizResponseDto JSON with correct field values
     */
    @Test
    @DisplayName("Should get quiz by ID successfully and return 200")
    void testGetQuizById() throws Exception {
        when(quizService.getQuizById(1L)).thenReturn(responseDto);

        mockMvc.perform(get("/api/quizzes/{id}", 1L))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$.id", is(1)))
                .andExpect(jsonPath("$.question", is("What is the past tense of 'go'?")))
                .andExpect(jsonPath("$.answer", is("went")))
                .andExpect(jsonPath("$.categoryName", is("English Grammar")));

        verify(quizService).getQuizById(1L);
    }

    /**
     * Purpose: Verify that GET /api/quizzes/{id} returns 404 NOT FOUND for non-existent quiz
     * Input: HTTP GET request with non-existent quiz ID (999) causing service to throw exception
     * Expected output: 404 NOT FOUND status
     */
    @Test
    @DisplayName("Should return 404 when getting non-existent quiz")
    void testGetNonExistentQuiz() throws Exception {
        when(quizService.getQuizById(999L)).thenThrow(new RuntimeException("Quiz not found"));

        mockMvc.perform(get("/api/quizzes/{id}", 999L))
                .andExpect(status().isNotFound());

        verify(quizService).getQuizById(999L);
    }

    /**
     * Purpose: Verify that GET /api/quizzes returns paginated quiz list with 200 OK
     * Input: HTTP GET request with query parameters (page=0, size=10)
     * Expected output: 200 OK status, JSON with quiz array, pagination metadata (totalElements, totalPages)
     */
    @Test
    @DisplayName("Should get all quizzes with pagination and return 200")
    void testGetAllQuizzes() throws Exception {
        QuizResponseDto quiz2 = QuizResponseDto.builder()
                .id(2L)
                .categoryId(1L)
                .categoryName("English Grammar")
                .question("Second question")
                .answer("second answer")
                .difficultyLevel("A1")
                .questionType("definition")
                .createdAt(LocalDateTime.now())
                .updatedAt(LocalDateTime.now())
                .build();

        List<QuizResponseDto> quizzes = Arrays.asList(responseDto, quiz2);
        Page<QuizResponseDto> quizPage = new PageImpl<>(quizzes, PageRequest.of(0, 10), 2);

        when(quizService.getAllQuizzes(any(Pageable.class))).thenReturn(quizPage);

        mockMvc.perform(get("/api/quizzes")
                .param("page", "0")
                .param("size", "10"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$.content", hasSize(2)))
                .andExpect(jsonPath("$.content[0].id", is(1)))
                .andExpect(jsonPath("$.content[1].id", is(2)))
                .andExpect(jsonPath("$.totalElements", is(2)))
                .andExpect(jsonPath("$.totalPages", is(1)))
                .andExpect(jsonPath("$.size", is(10)));

        verify(quizService).getAllQuizzes(any(Pageable.class));
    }

    /**
     * Purpose: Verify that PUT /api/quizzes/{id} updates a quiz and returns 200 OK
     * Input: HTTP PUT request with quiz ID (1) and valid QuizUpdateDto JSON body
     * Expected output: 200 OK status, updated QuizResponseDto JSON with modified field values
     */
    @Test
    @DisplayName("Should update quiz successfully and return 200")
    void testUpdateQuiz() throws Exception {
        QuizResponseDto updatedResponse = responseDto.toBuilder()
                .question("Updated question")
                .answer("Updated answer")
                .difficultyLevel("B1")
                .questionType("fill_blanks")
                .build();

        when(quizService.updateQuiz(eq(1L), any(QuizUpdateDto.class))).thenReturn(updatedResponse);

        mockMvc.perform(put("/api/quizzes/{id}", 1L)
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(updateDto)))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$.id", is(1)))
                .andExpect(jsonPath("$.question", is("Updated question")))
                .andExpect(jsonPath("$.answer", is("Updated answer")))
                .andExpect(jsonPath("$.difficultyLevel", is("B1")))
                .andExpect(jsonPath("$.questionType", is("fill_blanks")));

        verify(quizService).updateQuiz(eq(1L), any(QuizUpdateDto.class));
    }

    /**
     * Purpose: Verify that PUT /api/quizzes/{id} returns 404 NOT FOUND for non-existent quiz
     * Input: HTTP PUT request with non-existent quiz ID (999) causing service to throw exception
     * Expected output: 404 NOT FOUND status
     */
    @Test
    @DisplayName("Should return 404 when updating non-existent quiz")
    void testUpdateNonExistentQuiz() throws Exception {
        when(quizService.updateQuiz(eq(999L), any(QuizUpdateDto.class)))
                .thenThrow(new RuntimeException("Quiz not found"));

        mockMvc.perform(put("/api/quizzes/{id}", 999L)
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(updateDto)))
                .andExpect(status().isNotFound());

        verify(quizService).updateQuiz(eq(999L), any(QuizUpdateDto.class));
    }

    /**
     * Purpose: Verify that DELETE /api/quizzes/{id} deletes a quiz and returns 204 NO CONTENT
     * Input: HTTP DELETE request with existing quiz ID (1) in path parameter
     * Expected output: 204 NO CONTENT status with empty response body
     */
    @Test
    @DisplayName("Should delete quiz successfully and return 204")
    void testDeleteQuiz() throws Exception {
        doNothing().when(quizService).deleteQuiz(1L);

        mockMvc.perform(delete("/api/quizzes/{id}", 1L))
                .andExpect(status().isNoContent());

        verify(quizService).deleteQuiz(1L);
    }

    /**
     * Purpose: Verify that DELETE /api/quizzes/{id} returns 404 NOT FOUND for non-existent quiz
     * Input: HTTP DELETE request with non-existent quiz ID (999) causing service to throw exception
     * Expected output: 404 NOT FOUND status
     */
    @Test
    @DisplayName("Should return 404 when deleting non-existent quiz")
    void testDeleteNonExistentQuiz() throws Exception {
        doThrow(new RuntimeException("Quiz not found")).when(quizService).deleteQuiz(999L);

        mockMvc.perform(delete("/api/quizzes/{id}", 999L))
                .andExpect(status().isNotFound());

        verify(quizService).deleteQuiz(999L);
    }

    /**
     * Purpose: Verify that GET /api/quizzes/category/{categoryId} filters quizzes by category
     * Input: HTTP GET request with category ID (1) in path parameter
     * Expected output: 200 OK status, JSON array containing only quizzes from specified category
     */
    @Test
    @DisplayName("Should get quizzes by category successfully and return 200")
    void testGetQuizzesByCategory() throws Exception {
        List<QuizResponseDto> categoryQuizzes = Arrays.asList(responseDto);

        when(quizService.getQuizzesByCategory(1L)).thenReturn(categoryQuizzes);

        mockMvc.perform(get("/api/quizzes/category/{categoryId}", 1L))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$", hasSize(1)))
                .andExpect(jsonPath("$[0].id", is(1)))
                .andExpect(jsonPath("$[0].categoryId", is(1)))
                .andExpect(jsonPath("$[0].categoryName", is("English Grammar")));

        verify(quizService).getQuizzesByCategory(1L);
    }

    /**
     * Purpose: Verify that GET /api/quizzes/difficulty/{level} filters quizzes by difficulty
     * Input: HTTP GET request with difficulty level "A1" in path parameter
     * Expected output: 200 OK status, JSON array containing only quizzes with "A1" difficulty level
     */
    @Test
    @DisplayName("Should get quizzes by difficulty level successfully and return 200")
    void testGetQuizzesByDifficultyLevel() throws Exception {
        List<QuizResponseDto> difficultyQuizzes = Arrays.asList(responseDto);

        when(quizService.getQuizzesByDifficultyLevel("A1")).thenReturn(difficultyQuizzes);

        mockMvc.perform(get("/api/quizzes/difficulty/{level}", "A1"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$", hasSize(1)))
                .andExpect(jsonPath("$[0].id", is(1)))
                .andExpect(jsonPath("$[0].difficultyLevel", is("A1")));

        verify(quizService).getQuizzesByDifficultyLevel("A1");
    }

    /**
     * Purpose: Verify that GET /api/quizzes/type/{type} filters quizzes by question type
     * Input: HTTP GET request with question type "definition" in path parameter
     * Expected output: 200 OK status, JSON array containing only quizzes with "definition" question type
     */
    @Test
    @DisplayName("Should get quizzes by question type successfully and return 200")
    void testGetQuizzesByQuestionType() throws Exception {
        List<QuizResponseDto> typeQuizzes = Arrays.asList(responseDto);

        when(quizService.getQuizzesByQuestionType("definition")).thenReturn(typeQuizzes);

        mockMvc.perform(get("/api/quizzes/type/{type}", "definition"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$", hasSize(1)))
                .andExpect(jsonPath("$[0].id", is(1)))
                .andExpect(jsonPath("$[0].questionType", is("definition")));

        verify(quizService).getQuizzesByQuestionType("definition");
    }

    /**
     * Purpose: Verify that malformed JSON requests return 400 BAD REQUEST
     * Input: HTTP POST request with malformed JSON body (invalid syntax)
     * Expected output: 400 BAD REQUEST status
     */
    @Test
    @DisplayName("Should return 400 for malformed JSON request")
    void testMalformedJsonRequest() throws Exception {
        String malformedJson = "{ \"categoryId\": 1, \"question\": ";

        mockMvc.perform(post("/api/quizzes")
                .contentType(MediaType.APPLICATION_JSON)
                .content(malformedJson))
                .andExpect(status().isBadRequest());

        verify(quizService, never()).createQuiz(any(QuizCreateDto.class));
    }

    /**
     * Purpose: Verify that requests with unsupported media type return 415 UNSUPPORTED MEDIA TYPE
     * Input: HTTP POST request with XML content type instead of JSON
     * Expected output: 415 UNSUPPORTED MEDIA TYPE status
     */
    @Test
    @DisplayName("Should return 415 for unsupported media type")
    void testUnsupportedMediaType() throws Exception {
        mockMvc.perform(post("/api/quizzes")
                .contentType(MediaType.APPLICATION_XML)
                .content("<quiz></quiz>"))
                .andExpect(status().isUnsupportedMediaType());

        verify(quizService, never()).createQuiz(any(QuizCreateDto.class));
    }
}