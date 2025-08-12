package com.problemservice.ProblemService.config;

import com.problemservice.ProblemService.model.entity.Quiz;
import com.problemservice.ProblemService.model.entity.QuizCategory;
import com.problemservice.ProblemService.repository.QuizCategoryRepository;
import com.problemservice.ProblemService.repository.QuizRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
@Slf4j
public class TestDataLoader implements CommandLineRunner {

    private final QuizCategoryRepository quizCategoryRepository;
    private final QuizRepository quizRepository;

    @Override
    public void run(String... args) throws Exception {
        if (quizCategoryRepository.count() == 0) {
            log.info("Loading test data...");

            // Create test categories
            QuizCategory grammarCategory = QuizCategory.builder()
                    .name("English Grammar")
                    .difficultyLevel("A1")
                    .description("Basic English Grammar")
                    .build();
            grammarCategory = quizCategoryRepository.save(grammarCategory);

            QuizCategory vocabularyCategory = QuizCategory.builder()
                    .name("English Vocabulary")
                    .difficultyLevel("B1")
                    .description("Intermediate English Vocabulary")
                    .build();
            vocabularyCategory = quizCategoryRepository.save(vocabularyCategory);

            // Create test quizzes
            Quiz quiz1 = Quiz.builder()
                    .category(grammarCategory)
                    .question("What is the past tense of 'go'?")
                    .answer("went")
                    .difficultyLevel("A1")
                    .questionType("definition")
                    .keyword("verb, past tense")
                    .build();
            quizRepository.save(quiz1);

            Quiz quiz2 = Quiz.builder()
                    .category(grammarCategory)
                    .question("What is the present continuous of 'run'?")
                    .answer("running")
                    .difficultyLevel("A1")
                    .questionType("definition")
                    .keyword("verb, continuous")
                    .build();
            quizRepository.save(quiz2);

            Quiz quiz3 = Quiz.builder()
                    .category(vocabularyCategory)
                    .question("What does 'elaborate' mean?")
                    .answer("to explain in detail")
                    .difficultyLevel("B1")
                    .questionType("definition")
                    .keyword("vocabulary, meaning")
                    .build();
            quizRepository.save(quiz3);

            log.info("Test data loaded successfully!");
        }
    }
}