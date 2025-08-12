package com.problemservice.ProblemService.repository;

import com.problemservice.ProblemService.model.entity.Quiz;
import com.problemservice.ProblemService.model.entity.QuizCategory;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Purpose: Test CRUD operations and custom query methods of QuizRepository
 * This test class validates that the QuizRepository properly handles
 * database operations and custom queries for Quiz entities
 */
@DataJpaTest
class QuizRepositoryTest {

    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private QuizRepository quizRepository;

    /**
     * Purpose: Verify that a quiz can be saved to the database and assigned an ID
     * Input: Quiz entity with valid data (category, question, answer, difficulty, type)
     * Expected output: Saved quiz with auto-generated ID and all fields persisted
     */
    @Test
    @DisplayName("Should save quiz successfully")
    void testSaveQuiz() {
        QuizCategory category = QuizCategory.builder()
                .name("English Grammar")
                .difficultyLevel("A1")
                .build();
        entityManager.persistAndFlush(category);

        Quiz quiz = Quiz.builder()
                .category(category)
                .question("What is the past tense of 'go'?")
                .answer("went")
                .difficultyLevel("A1")
                .questionType("definition")
                .keyword("verb, past tense")
                .build();

        Quiz savedQuiz = quizRepository.save(quiz);

        assertNotNull(savedQuiz.getId());
        assertEquals("What is the past tense of 'go'?", savedQuiz.getQuestion());
        assertEquals("went", savedQuiz.getAnswer());
        assertEquals("A1", savedQuiz.getDifficultyLevel());
        assertEquals("definition", savedQuiz.getQuestionType());
        assertNotNull(savedQuiz.getCreatedAt());
    }

    /**
     * Purpose: Verify that a quiz can be found by its ID
     * Input: Existing quiz ID (1L) in the database
     * Expected output: Optional containing the quiz with matching ID and all correct field values
     */
    @Test
    @DisplayName("Should find quiz by ID")
    void testFindQuizById() {
        QuizCategory category = QuizCategory.builder()
                .name("English Grammar")
                .difficultyLevel("A1")
                .build();
        entityManager.persistAndFlush(category);

        Quiz quiz = Quiz.builder()
                .category(category)
                .question("What is the past tense of 'go'?")
                .answer("went")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();
        entityManager.persistAndFlush(quiz);

        Optional<Quiz> foundQuiz = quizRepository.findById(quiz.getId());

        assertTrue(foundQuiz.isPresent());
        assertEquals("What is the past tense of 'go'?", foundQuiz.get().getQuestion());
        assertEquals("went", foundQuiz.get().getAnswer());
    }

    /**
     * Purpose: Verify that findById returns empty Optional for non-existent quiz ID
     * Input: Non-existent quiz ID (999L)
     * Expected output: Empty Optional
     */
    @Test
    @DisplayName("Should return empty optional for non-existent quiz")
    void testFindQuizByNonExistentId() {
        Optional<Quiz> foundQuiz = quizRepository.findById(999L);
        assertFalse(foundQuiz.isPresent());
    }

    /**
     * Purpose: Verify that all quizzes can be retrieved from the database
     * Input: Multiple quiz entities (3 quizzes) saved in different categories
     * Expected output: List containing all 3 saved quizzes
     */
    @Test
    @DisplayName("Should find all quizzes")
    void testFindAllQuizzes() {
        QuizCategory category1 = QuizCategory.builder()
                .name("English Grammar")
                .difficultyLevel("A1")
                .build();
        QuizCategory category2 = QuizCategory.builder()
                .name("English Vocabulary")
                .difficultyLevel("B1")
                .build();
        entityManager.persistAndFlush(category1);
        entityManager.persistAndFlush(category2);

        Quiz quiz1 = Quiz.builder()
                .category(category1)
                .question("What is the past tense of 'go'?")
                .answer("went")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        Quiz quiz2 = Quiz.builder()
                .category(category1)
                .question("What is the present continuous of 'run'?")
                .answer("running")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        Quiz quiz3 = Quiz.builder()
                .category(category2)
                .question("What does 'elaborate' mean?")
                .answer("to explain in detail")
                .difficultyLevel("B1")
                .questionType("definition")
                .build();

        entityManager.persistAndFlush(quiz1);
        entityManager.persistAndFlush(quiz2);
        entityManager.persistAndFlush(quiz3);

        List<Quiz> allQuizzes = quizRepository.findAll();

        assertEquals(3, allQuizzes.size());
    }

    /**
     * Purpose: Verify that a quiz can be updated with new field values
     * Input: Existing quiz with updated question and answer fields
     * Expected output: Quiz with updated values persisted in database
     */
    @Test
    @DisplayName("Should update quiz successfully")
    void testUpdateQuiz() {
        QuizCategory category = QuizCategory.builder()
                .name("English Grammar")
                .difficultyLevel("A1")
                .build();
        entityManager.persistAndFlush(category);

        Quiz quiz = Quiz.builder()
                .category(category)
                .question("Original question")
                .answer("original answer")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();
        entityManager.persistAndFlush(quiz);

        quiz.setQuestion("Updated question");
        quiz.setAnswer("updated answer");
        Quiz updatedQuiz = quizRepository.save(quiz);

        assertEquals("Updated question", updatedQuiz.getQuestion());
        assertEquals("updated answer", updatedQuiz.getAnswer());
        assertNotNull(updatedQuiz.getUpdatedAt());
    }

    /**
     * Purpose: Verify that a quiz can be deleted from the database
     * Input: Existing quiz ID to be deleted
     * Expected output: Quiz no longer exists in database (findById returns empty Optional)
     */
    @Test
    @DisplayName("Should delete quiz successfully")
    void testDeleteQuiz() {
        QuizCategory category = QuizCategory.builder()
                .name("English Grammar")
                .difficultyLevel("A1")
                .build();
        entityManager.persistAndFlush(category);

        Quiz quiz = Quiz.builder()
                .category(category)
                .question("What is the past tense of 'go'?")
                .answer("went")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();
        entityManager.persistAndFlush(quiz);

        Long quizId = quiz.getId();
        quizRepository.deleteById(quizId);

        Optional<Quiz> deletedQuiz = quizRepository.findById(quizId);
        assertFalse(deletedQuiz.isPresent());
    }

    /**
     * Purpose: Verify that quizzes can be filtered by category ID
     * Input: Category ID (specific category) with 2 quizzes in that category and 1 in another
     * Expected output: List containing only the 2 quizzes from the specified category
     */
    @Test
    @DisplayName("Should find quizzes by category")
    void testFindQuizzesByCategory() {
        QuizCategory category1 = QuizCategory.builder()
                .name("English Grammar")
                .difficultyLevel("A1")
                .build();
        QuizCategory category2 = QuizCategory.builder()
                .name("English Vocabulary")
                .difficultyLevel("B1")
                .build();
        entityManager.persistAndFlush(category1);
        entityManager.persistAndFlush(category2);

        Quiz quiz1 = Quiz.builder()
                .category(category1)
                .question("Grammar question 1")
                .answer("answer 1")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        Quiz quiz2 = Quiz.builder()
                .category(category1)
                .question("Grammar question 2")
                .answer("answer 2")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        Quiz quiz3 = Quiz.builder()
                .category(category2)
                .question("Vocabulary question 1")
                .answer("answer 3")
                .difficultyLevel("B1")
                .questionType("definition")
                .build();

        entityManager.persistAndFlush(quiz1);
        entityManager.persistAndFlush(quiz2);
        entityManager.persistAndFlush(quiz3);

        List<Quiz> grammarQuizzes = quizRepository.findByCategoryId(category1.getId());

        assertEquals(2, grammarQuizzes.size());
        assertTrue(grammarQuizzes.stream().allMatch(q -> q.getCategory().equals(category1)));
    }

    /**
     * Purpose: Verify that quizzes can be filtered by difficulty level
     * Input: Difficulty level "A1" with 2 A1 quizzes and 1 B1 quiz
     * Expected output: List containing only the 2 quizzes with "A1" difficulty level
     */
    @Test
    @DisplayName("Should find quizzes by difficulty level")
    void testFindQuizzesByDifficultyLevel() {
        QuizCategory category = QuizCategory.builder()
                .name("English Grammar")
                .difficultyLevel("A1")
                .build();
        entityManager.persistAndFlush(category);

        Quiz quiz1 = Quiz.builder()
                .category(category)
                .question("Easy question 1")
                .answer("answer 1")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        Quiz quiz2 = Quiz.builder()
                .category(category)
                .question("Easy question 2")
                .answer("answer 2")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        Quiz quiz3 = Quiz.builder()
                .category(category)
                .question("Hard question 1")
                .answer("answer 3")
                .difficultyLevel("B1")
                .questionType("definition")
                .build();

        entityManager.persistAndFlush(quiz1);
        entityManager.persistAndFlush(quiz2);
        entityManager.persistAndFlush(quiz3);

        List<Quiz> easyQuizzes = quizRepository.findByDifficultyLevel("A1");

        assertEquals(2, easyQuizzes.size());
        assertTrue(easyQuizzes.stream().allMatch(q -> q.getDifficultyLevel().equals("A1")));
    }

    /**
     * Purpose: Verify that quizzes can be filtered by question type
     * Input: Question type "definition" with 2 definition quizzes and 1 fill_blanks quiz
     * Expected output: List containing only the 2 quizzes with "definition" question type
     */
    @Test
    @DisplayName("Should find quizzes by question type")
    void testFindQuizzesByQuestionType() {
        QuizCategory category = QuizCategory.builder()
                .name("English Grammar")
                .difficultyLevel("A1")
                .build();
        entityManager.persistAndFlush(category);

        Quiz quiz1 = Quiz.builder()
                .category(category)
                .question("What is definition 1?")
                .answer("answer 1")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        Quiz quiz2 = Quiz.builder()
                .category(category)
                .question("What is definition 2?")
                .answer("answer 2")
                .difficultyLevel("A1")
                .questionType("definition")
                .build();

        Quiz quiz3 = Quiz.builder()
                .category(category)
                .question("Fill in the ___")
                .answer("blank")
                .difficultyLevel("A1")
                .questionType("fill_blanks")
                .build();

        entityManager.persistAndFlush(quiz1);
        entityManager.persistAndFlush(quiz2);
        entityManager.persistAndFlush(quiz3);

        List<Quiz> definitionQuizzes = quizRepository.findByQuestionType("definition");

        assertEquals(2, definitionQuizzes.size());
        assertTrue(definitionQuizzes.stream().allMatch(q -> q.getQuestionType().equals("definition")));
    }

    /**
     * Purpose: Verify that quizzes can be retrieved with pagination support
     * Input: PageRequest for page 0, size 2 from a total of 5 quizzes
     * Expected output: Page containing 2 quizzes, with totalElements=5, totalPages=3
     */
    @Test
    @DisplayName("Should support pagination for quiz retrieval")
    void testFindQuizzesWithPagination() {
        QuizCategory category = QuizCategory.builder()
                .name("English Grammar")
                .difficultyLevel("A1")
                .build();
        entityManager.persistAndFlush(category);

        for (int i = 1; i <= 5; i++) {
            Quiz quiz = Quiz.builder()
                    .category(category)
                    .question("Question " + i)
                    .answer("Answer " + i)
                    .difficultyLevel("A1")
                    .questionType("definition")
                    .build();
            entityManager.persistAndFlush(quiz);
        }

        Pageable pageable = PageRequest.of(0, 2);
        Page<Quiz> quizPage = quizRepository.findAll(pageable);

        assertEquals(2, quizPage.getContent().size());
        assertEquals(5, quizPage.getTotalElements());
        assertEquals(3, quizPage.getTotalPages());
        assertTrue(quizPage.hasNext());
        assertFalse(quizPage.hasPrevious());
    }
}