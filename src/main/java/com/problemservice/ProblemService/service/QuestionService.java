package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.dto.QuestionCreateDto;
import com.problemservice.ProblemService.model.dto.QuestionResponseDto;
import com.problemservice.ProblemService.model.dto.QuestionUpdateDto;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.repository.QuestionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class QuestionService {

    private final QuestionRepository questionRepository;

    /**
     * 데이터베이스에 새로운 문제를 생성합니다
     * 
     * @param createDto 문제 데이터를 포함하는 DTO
     * @return 생성된 문제의 ID와 타임스탬프가 포함된 QuestionResponseDto
     */
    @Transactional
    public QuestionResponseDto createQuestion(QuestionCreateDto createDto) {
        Question question = Question.builder()
                .questionId(createDto.getQuestionId())
                .questionText(createDto.getQuestionText())
                .optionA(createDto.getOptionA())
                .optionB(createDto.getOptionB())
                .optionC(createDto.getOptionC())
                .correctAnswer(createDto.getCorrectAnswer())
                .majorCategory(createDto.getMajorCategory())
                .minorCategory(createDto.getMinorCategory())
                .questionType(createDto.getQuestionType())
                .explanation(createDto.getExplanation())
                .difficultyLevel(createDto.getDifficultyLevel())
                .build();

        Question savedQuestion = questionRepository.save(question);
        return convertToResponseDto(savedQuestion);
    }

    /**
     * 고유 식별자로 문제를 조회합니다
     * 
     * @param id 조회할 문제의 고유 식별자
     * @return 문제 데이터가 포함된 QuestionResponseDto
     * @throws RuntimeException 지정된 ID의 문제가 존재하지 않을 경우
     */
    public QuestionResponseDto getQuestionById(String id) {
        Question question = questionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Question not found"));
        return convertToResponseDto(question);
    }

    /**
     * 페이지네이션을 지원하여 모든 문제를 조회합니다
     * 
     * @param pageable 페이지네이션 매개변수 (페이지 번호, 크기, 정렬)
     * @return 페이지네이션된 문제 결과가 포함된 Page<QuestionResponseDto>
     */
    public Page<QuestionResponseDto> getAllQuestions(Pageable pageable) {
        Page<Question> questionPage = questionRepository.findAll(pageable);
        return questionPage.map(this::convertToResponseDto);
    }

    /**
     * 기존 문제를 새로운 데이터로 업데이트합니다
     * 
     * @param id 업데이트할 문제의 고유 식별자
     * @param updateDto 업데이트된 문제 데이터를 포함하는 DTO
     * @return 업데이트된 문제 데이터가 포함된 QuestionResponseDto
     * @throws RuntimeException 문제 ID가 존재하지 않을 경우
     */
    @Transactional
    public QuestionResponseDto updateQuestion(String id, QuestionUpdateDto updateDto) {
        Question question = questionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Question not found"));

        question.setQuestionText(updateDto.getQuestionText());
        question.setOptionA(updateDto.getOptionA());
        question.setOptionB(updateDto.getOptionB());
        question.setOptionC(updateDto.getOptionC());
        question.setCorrectAnswer(updateDto.getCorrectAnswer());
        question.setMajorCategory(updateDto.getMajorCategory());
        question.setMinorCategory(updateDto.getMinorCategory());
        question.setQuestionType(updateDto.getQuestionType());
        question.setExplanation(updateDto.getExplanation());
        question.setDifficultyLevel(updateDto.getDifficultyLevel());

        Question savedQuestion = questionRepository.save(question);
        return convertToResponseDto(savedQuestion);
    }

    /**
     * 데이터베이스에서 문제를 삭제합니다
     * 
     * @param id 삭제할 문제의 고유 식별자
     * @throws RuntimeException 지정된 ID의 문제가 존재하지 않을 경우
     */
    @Transactional
    public void deleteQuestion(String id) {
        questionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Question not found"));
        questionRepository.deleteById(id);
    }

    /**
     * 특정 카테고리에 속한 모든 문제를 조회합니다
     * 
     * @param category 카테고리 이름
     * @return 지정된 카테고리의 모든 문제가 포함된 List<QuestionResponseDto>
     */
    public List<QuestionResponseDto> getQuestionsByCategory(String category) {
        List<Question> questions = questionRepository.findByMajorCategory(category);
        return questions.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    /**
     * 특정 난이도 수준의 모든 문제를 조회합니다
     * 
     * @param difficultyLevel 필터링할 난이도 수준 (A1, A2, B1, B2, C1, C2)
     * @return 지정된 난이도 수준의 모든 문제가 포함된 List<QuestionResponseDto>
     */
    public List<QuestionResponseDto> getQuestionsByDifficultyLevel(String level) {
        Integer difficultyLevel;
        try {
            difficultyLevel = Integer.parseInt(level);
        } catch (NumberFormatException e) {
            throw new RuntimeException("Invalid difficulty level: " + level);
        }
        List<Question> questions = questionRepository.findByDifficultyLevel(difficultyLevel);
        return questions.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    /**
     * 특정 문제 유형의 모든 문제를 조회합니다
     * 
     * @param questionType 필터링할 문제 유형
     * @return 지정된 문제 유형의 모든 문제가 포함된 List<QuestionResponseDto>
     */
    public List<QuestionResponseDto> getQuestionsByQuestionType(String questionType) {
        List<Question> questions = questionRepository.findByQuestionType(questionType);
        return questions.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    /**
     * Question 엔티티를 API 응답용 QuestionResponseDto로 변환합니다
     * 
     * @param question 변환할 Question 엔티티
     * @return API 응답 형식으로 포맷된 모든 문제 데이터가 포함된 QuestionResponseDto
     */
    private QuestionResponseDto convertToResponseDto(Question question) {
        return QuestionResponseDto.builder()
                .questionId(question.getQuestionId())
                .questionText(question.getQuestionText())
                .optionA(question.getOptionA())
                .optionB(question.getOptionB())
                .optionC(question.getOptionC())
                .correctAnswer(question.getCorrectAnswer())
                .majorCategory(question.getMajorCategory())
                .minorCategory(question.getMinorCategory())
                .questionType(question.getQuestionType())
                .explanation(question.getExplanation())
                .difficultyLevel(question.getDifficultyLevel())
                .createdAt(question.getCreatedAt())
                .updatedAt(question.getUpdatedAt())
                .build();
    }
}