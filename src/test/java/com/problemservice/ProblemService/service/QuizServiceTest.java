package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.dto.QuizCreateDto;
import com.problemservice.ProblemService.model.dto.QuizResponseDto;
import com.problemservice.ProblemService.model.dto.QuizUpdateDto;
import com.problemservice.ProblemService.model.entity.Quiz;
import com.problemservice.ProblemService.model.entity.QuizCategory;
import com.problemservice.ProblemService.repository.QuizCategoryRepository;
import com.problemservice.ProblemService.repository.QuizRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

/**
 * Purpose: Test business logic and CRUD operations of QuizService
 * This test class validates that the QuizService properly handles
 * quiz operations, data transformation, and error scenarios
 */
@ExtendWith(MockitoExtension.class)
class QuizServiceTest {

    @Mock
    private QuizRepository quizRepository;

    @Mock
    private QuizCategoryRepository quizCategoryRepository;

    @InjectMocks
    private QuizService quizService;

    private QuizCategory mockCategory;
    private Quiz mockQuiz;
    private QuizCreateDto createDto;
    private QuizUpdateDto updateDto;

    @BeforeEach
    void setUp() {
        mockCategory = QuizCategory.builder()
                .id(1L)
                .name("English Grammar")
                .difficultyLevel("A1")
                .build();

        mockQuiz = Quiz.builder()
                .id(1L)
                .category(mockCategory)
                .question("What is the past tense of 'go'?")
                .answer("went")
                .difficultyLevel("A1")
                .questionType("definition")
                .keyword("verb, past tense")
                .createdAt(LocalDateTime.now())
                .updatedAt(LocalDateTime.now())
                .build();

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
    }

    /**
     * Purpose: Verify that a quiz can be successfully created through the service
     * Input: QuizCreateDto with valid quiz data (categoryId=1, question, answer, difficulty, type)
     * Expected output: QuizResponseDto with generated ID and all field values correctly mapped
     */
    @Test
    @DisplayName("Should create quiz successfully")
    void testCreateQuiz() {
        when(quizCategoryRepository.findById(1L)).thenReturn(Optional.of(mockCategory));
        when(quizRepository.save(any(Quiz.class))).thenReturn(mockQuiz);

        QuizResponseDto result = quizService.createQuiz(createDto);

        assertNotNull(result);
        assertEquals(1L, result.getId());
        assertEquals("What is the past tense of 'go'?", result.getQuestion());
        assertEquals("went", result.getAnswer());
        assertEquals("A1", result.getDifficultyLevel());
        assertEquals("definition", result.getQuestionType());
        assertEquals("verb, past tense", result.getKeyword());

        verify(quizCategoryRepository).findById(1L);
        verify(quizRepository).save(any(Quiz.class));
    }

    /**
     * Purpose: Verify that creating a quiz fails when category doesn't exist
     * Input: QuizCreateDto with non-existent categoryId (999L)
     * Expected output: RuntimeException with message "Category not found"
     */
    @Test
    @DisplayName("Should throw exception when creating quiz with non-existent category")
    void testCreateQuizWithNonExistentCategory() {
        QuizCreateDto invalidDto = createDto.toBuilder()
                .categoryId(999L)
                .build();

        when(quizCategoryRepository.findById(999L)).thenReturn(Optional.empty());

        RuntimeException exception = assertThrows(RuntimeException.class, 
            () -> quizService.createQuiz(invalidDto));
        assertEquals("Category not found", exception.getMessage());

        verify(quizCategoryRepository).findById(999L);
        verify(quizRepository, never()).save(any(Quiz.class));
    }

    /**
     * Purpose: Verify that a quiz can be retrieved by its ID
     * Input: Existing quiz ID (1L)
     * Expected output: QuizResponseDto with correct field values matching the stored quiz
     */
    @Test
    @DisplayName("Should get quiz by ID successfully")
    void testGetQuizById() {
        when(quizRepository.findById(1L)).thenReturn(Optional.of(mockQuiz));

        QuizResponseDto result = quizService.getQuizById(1L);

        assertNotNull(result);
        assertEquals(1L, result.getId());
        assertEquals("What is the past tense of 'go'?", result.getQuestion());
        assertEquals("went", result.getAnswer());

        verify(quizRepository).findById(1L);
    }

    /**
     * Purpose: Verify that getting a quiz fails when ID doesn't exist
     * Input: Non-existent quiz ID (999L)
     * Expected output: RuntimeException with message "Quiz not found"
     */
    @Test
    @DisplayName("Should throw exception when getting non-existent quiz")
    void testGetQuizByNonExistentId() {
        when(quizRepository.findById(999L)).thenReturn(Optional.empty());

        RuntimeException exception = assertThrows(RuntimeException.class,
            () -> quizService.getQuizById(999L));
        assertEquals("Quiz not found", exception.getMessage());

        verify(quizRepository).findById(999L);
    }

    /**
     * Purpose: Verify that all quizzes can be retrieved with pagination
     * Input: PageRequest for page 0, size 10 with 3 total quizzes in database
     * Expected output: Page containing 3 QuizResponseDto objects with correct field mappings
     */
    @Test
    @DisplayName("Should get all quizzes with pagination")
    void testGetAllQuizzes() {
        Quiz quiz2 = Quiz.builder()
                .id(2L)
                .category(mockCategory)
                .question("Second question")
                .answer("second answer")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        Quiz quiz3 = Quiz.builder()
                .id(3L)
                .category(mockCategory)
                .question("Third question")
                .answer("third answer")
                .difficultyLevel("B1")
                .questionType("fill_blanks")
                .build();

        List<Quiz> quizzes = Arrays.asList(mockQuiz, quiz2, quiz3);
        Page<Quiz> quizPage = new PageImpl<>(quizzes, PageRequest.of(0, 10), 3);

        when(quizRepository.findAll(any(Pageable.class))).thenReturn(quizPage);

        Pageable pageable = PageRequest.of(0, 10);
        Page<QuizResponseDto> result = quizService.getAllQuizzes(pageable);

        assertNotNull(result);
        assertEquals(3, result.getContent().size());
        assertEquals(3, result.getTotalElements());
        assertEquals(1, result.getTotalPages());

        QuizResponseDto firstQuiz = result.getContent().get(0);
        assertEquals(1L, firstQuiz.getId());
        assertEquals("What is the past tense of 'go'?", firstQuiz.getQuestion());

        verify(quizRepository).findAll(any(Pageable.class));
    }

    /**
     * Purpose: Verify that a quiz can be updated with new field values
     * Input: Quiz ID (1L) and QuizUpdateDto with updated values (new question, answer, difficulty)
     * Expected output: QuizResponseDto with updated field values and same ID
     */
    @Test
    @DisplayName("Should update quiz successfully")
    void testUpdateQuiz() {
        Quiz updatedQuiz = Quiz.builder()
                .id(1L)
                .category(mockCategory)
                .question("Updated question")
                .answer("Updated answer")
                .difficultyLevel("B1")
                .questionType("fill_blanks")
                .keyword("updated, keyword")
                .createdAt(mockQuiz.getCreatedAt())
                .updatedAt(LocalDateTime.now())
                .build();

        when(quizRepository.findById(1L)).thenReturn(Optional.of(mockQuiz));
        when(quizCategoryRepository.findById(1L)).thenReturn(Optional.of(mockCategory));
        when(quizRepository.save(any(Quiz.class))).thenReturn(updatedQuiz);

        QuizResponseDto result = quizService.updateQuiz(1L, updateDto);

        assertNotNull(result);
        assertEquals(1L, result.getId());
        assertEquals("Updated question", result.getQuestion());
        assertEquals("Updated answer", result.getAnswer());
        assertEquals("B1", result.getDifficultyLevel());
        assertEquals("fill_blanks", result.getQuestionType());

        verify(quizRepository).findById(1L);
        verify(quizCategoryRepository).findById(1L);
        verify(quizRepository).save(any(Quiz.class));
    }

    /**
     * Purpose: Verify that updating a quiz fails when quiz ID doesn't exist
     * Input: Non-existent quiz ID (999L) and valid QuizUpdateDto
     * Expected output: RuntimeException with message "Quiz not found"
     */
    @Test
    @DisplayName("Should throw exception when updating non-existent quiz")
    void testUpdateNonExistentQuiz() {
        when(quizRepository.findById(999L)).thenReturn(Optional.empty());

        RuntimeException exception = assertThrows(RuntimeException.class,
            () -> quizService.updateQuiz(999L, updateDto));
        assertEquals("Quiz not found", exception.getMessage());

        verify(quizRepository).findById(999L);
        verify(quizRepository, never()).save(any(Quiz.class));
    }

    /**
     * Purpose: Verify that a quiz can be successfully deleted
     * Input: Existing quiz ID (1L)
     * Expected output: Method completes without exception, deleteById is called on repository
     */
    @Test
    @DisplayName("Should delete quiz successfully")
    void testDeleteQuiz() {
        when(quizRepository.findById(1L)).thenReturn(Optional.of(mockQuiz));

        assertDoesNotThrow(() -> quizService.deleteQuiz(1L));

        verify(quizRepository).findById(1L);
        verify(quizRepository).deleteById(1L);
    }

    /**
     * Purpose: Verify that deleting a quiz fails when ID doesn't exist
     * Input: Non-existent quiz ID (999L)
     * Expected output: RuntimeException with message "Quiz not found"
     */
    @Test
    @DisplayName("Should throw exception when deleting non-existent quiz")
    void testDeleteNonExistentQuiz() {
        when(quizRepository.findById(999L)).thenReturn(Optional.empty());

        RuntimeException exception = assertThrows(RuntimeException.class,
            () -> quizService.deleteQuiz(999L));
        assertEquals("Quiz not found", exception.getMessage());

        verify(quizRepository).findById(999L);
        verify(quizRepository, never()).deleteById(anyLong());
    }

    /**
     * Purpose: Verify that quizzes can be filtered by category ID
     * Input: Category ID (1L) with 2 quizzes belonging to that category
     * Expected output: List containing 2 QuizResponseDto objects from the specified category
     */
    @Test
    @DisplayName("Should get quizzes by category successfully")
    void testGetQuizzesByCategory() {
        Quiz quiz2 = Quiz.builder()
                .id(2L)
                .category(mockCategory)
                .question("Second question")
                .answer("second answer")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        List<Quiz> categoryQuizzes = Arrays.asList(mockQuiz, quiz2);

        when(quizRepository.findByCategoryId(1L)).thenReturn(categoryQuizzes);

        List<QuizResponseDto> result = quizService.getQuizzesByCategory(1L);

        assertNotNull(result);
        assertEquals(2, result.size());
        assertEquals(1L, result.get(0).getId());
        assertEquals(2L, result.get(1).getId());

        verify(quizRepository).findByCategoryId(1L);
    }

    /**
     * Purpose: Verify that quizzes can be filtered by difficulty level
     * Input: Difficulty level "A1" with 2 quizzes at that level
     * Expected output: List containing 2 QuizResponseDto objects with "A1" difficulty level
     */
    @Test
    @DisplayName("Should get quizzes by difficulty level successfully")
    void testGetQuizzesByDifficultyLevel() {
        Quiz quiz2 = Quiz.builder()
                .id(2L)
                .category(mockCategory)
                .question("Second A1 question")
                .answer("second answer")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        List<Quiz> difficultyQuizzes = Arrays.asList(mockQuiz, quiz2);

        when(quizRepository.findByDifficultyLevel("A1")).thenReturn(difficultyQuizzes);

        List<QuizResponseDto> result = quizService.getQuizzesByDifficultyLevel("A1");

        assertNotNull(result);
        assertEquals(2, result.size());
        assertTrue(result.stream().allMatch(q -> q.getDifficultyLevel().equals("A1")));

        verify(quizRepository).findByDifficultyLevel("A1");
    }

    /**
     * Purpose: Verify that quizzes can be filtered by question type
     * Input: Question type "definition" with 2 definition-type quizzes
     * Expected output: List containing 2 QuizResponseDto objects with "definition" question type
     */
    @Test
    @DisplayName("Should get quizzes by question type successfully")
    void testGetQuizzesByQuestionType() {
        Quiz quiz2 = Quiz.builder()
                .id(2L)
                .category(mockCategory)
                .question("Another definition question")
                .answer("definition answer")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        List<Quiz> typeQuizzes = Arrays.asList(mockQuiz, quiz2);

        when(quizRepository.findByQuestionType("definition")).thenReturn(typeQuizzes);

        List<QuizResponseDto> result = quizService.getQuizzesByQuestionType("definition");

        assertNotNull(result);
        assertEquals(2, result.size());
        assertTrue(result.stream().allMatch(q -> q.getQuestionType().equals("definition")));

        verify(quizRepository).findByQuestionType("definition");
    }
}