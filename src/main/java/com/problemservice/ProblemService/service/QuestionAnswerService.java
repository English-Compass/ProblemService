package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.dto.QuestionAnswerCreateDto;
import com.problemservice.ProblemService.model.dto.QuestionAnswerResponseDto;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.model.entity.QuestionAnswer;
import com.problemservice.ProblemService.repository.QuestionAnswerRepository;
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
public class QuestionAnswerService {

    private final QuestionAnswerRepository questionAnswerRepository;
    private final QuestionRepository questionRepository;

    /**
     * 데이터베이스에 새로운 문제 답변을 생성합니다
     * 
     * @param createDto 문제 답변 데이터를 포함하는 DTO
     * @return 생성된 문제 답변의 ID와 타임스탬프가 포함된 QuestionAnswerResponseDto
     * @throws RuntimeException 지정된 문제 ID가 존재하지 않을 경우
     */
    @Transactional
    public QuestionAnswerResponseDto createQuestionAnswer(QuestionAnswerCreateDto createDto) {
        Question question = questionRepository.findById(createDto.getQuestionId())
                .orElseThrow(() -> new RuntimeException("Question not found"));

        QuestionAnswer questionAnswer = QuestionAnswer.builder()
                .sessionId(createDto.getSessionId())
                .questionId(createDto.getQuestionId())
                .sessionType(createDto.getSessionType())
                .userAnswer(createDto.getUserAnswer())
                .isCorrect(createDto.getIsCorrect())
                .timeSpent(createDto.getTimeSpent())
                .solveCount(createDto.getSolveCount())
                .build();

        QuestionAnswer savedQuestionAnswer = questionAnswerRepository.save(questionAnswer);
        return convertToResponseDto(savedQuestionAnswer);
    }

    /**
     * 고유 식별자로 퀴즈 로그를 조회합니다
     * 
     * @param id 조회할 퀴즈 로그의 고유 식별자
     * @return 퀴즈 로그 데이터가 포함된 QuizLogResponseDto
     * @throws RuntimeException 지정된 ID의 퀴즈 로그가 존재하지 않을 경우
     */
    public QuestionAnswerResponseDto getQuestionAnswerById(Long id) {
        QuestionAnswer questionAnswer = questionAnswerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Question answer not found"));
        return convertToResponseDto(questionAnswer);
    }

    /**
     * 페이지네이션을 지원하여 모든 퀴즈 로그를 조회합니다
     * 
     * @param pageable 페이지네이션 매개변수 (페이지 번호, 크기, 정렬)
     * @return 페이지네이션된 퀴즈 로그 결과가 포함된 Page<QuizLogResponseDto>
     */
    public Page<QuestionAnswerResponseDto> getAllQuestionAnswers(Pageable pageable) {
        Page<QuestionAnswer> questionAnswerPage = questionAnswerRepository.findAll(pageable);
        return questionAnswerPage.map(this::convertToResponseDto);
    }

    /**
     * 데이터베이스에서 퀴즈 로그를 삭제합니다
     * 
     * @param id 삭제할 퀴즈 로그의 고유 식별자
     * @throws RuntimeException 지정된 ID의 퀴즈 로그가 존재하지 않을 경우
     */
    @Transactional
    public void deleteQuestionAnswer(Long id) {
        questionAnswerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Question answer not found"));
        questionAnswerRepository.deleteById(id);
    }

    /**
     * 특정 사용자의 모든 퀴즈 로그를 조회합니다
     * 
     * @param userId 사용자의 고유 식별자
     * @return 지정된 사용자의 모든 퀴즈 로그가 포함된 List<QuizLogResponseDto>
     */
    public List<QuestionAnswerResponseDto> getQuestionAnswersBySessionId(String sessionId) {
        List<QuestionAnswer> questionAnswers = questionAnswerRepository.findBySessionId(sessionId);
        return questionAnswers.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    /**
     * 특정 퀴즈에 대한 모든 로그를 조회합니다
     * 
     * @param quizId 퀴즈의 고유 식별자
     * @return 지정된 퀴즈의 모든 로그가 포함된 List<QuizLogResponseDto>
     */
    public List<QuestionAnswerResponseDto> getQuestionAnswersByQuestionId(String questionId) {
        List<QuestionAnswer> questionAnswers = questionAnswerRepository.findByQuestionId(questionId);
        return questionAnswers.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    /**
     * 특정 사용자의 특정 퀴즈에 대한 모든 로그를 조회합니다
     * 
     * @param userId 사용자의 고유 식별자
     * @param quizId 퀴즈의 고유 식별자
     * @return 지정된 사용자와 퀴즈의 모든 로그가 포함된 List<QuizLogResponseDto>
     */
    public List<QuestionAnswerResponseDto> getQuestionAnswersBySessionIdAndQuestionId(String sessionId, String questionId) {
        List<QuestionAnswer> questionAnswers = questionAnswerRepository.findBySessionIdAndQuestionId(sessionId, questionId);
        return questionAnswers.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    /**
     * 특정 학습 세션의 모든 퀴즈 로그를 조회합니다
     * 
     * @param sessionId 학습 세션의 고유 식별자
     * @return 지정된 세션의 모든 퀴즈 로그가 포함된 List<QuizLogResponseDto>
     */
    public List<QuestionAnswerResponseDto> getQuestionAnswersBySessionType(String sessionType) {
        List<QuestionAnswer> questionAnswers = questionAnswerRepository.findBySessionType(sessionType);
        return questionAnswers.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    /**
     * 특정 사용자의 정답/오답 여부에 따른 퀴즈 로그를 조회합니다
     * 
     * @param userId 사용자의 고유 식별자
     * @param isCorrect 정답 여부 (true: 정답, false: 오답)
     * @return 지정된 조건의 모든 퀴즈 로그가 포함된 List<QuizLogResponseDto>
     */
    public List<QuestionAnswerResponseDto> getQuestionAnswersBySessionIdAndCorrectness(String sessionId, Boolean isCorrect) {
        List<QuestionAnswer> questionAnswers = questionAnswerRepository.findBySessionIdAndIsCorrect(sessionId, isCorrect);
        return questionAnswers.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    /**
     * QuestionAnswer 엔티티를 API 응답용 QuestionAnswerResponseDto로 변환합니다
     * 
     * @param questionAnswer 변환할 QuestionAnswer 엔티티
     * @return API 응답 형식으로 포맷된 모든 문제 답변 데이터가 포함된 QuestionAnswerResponseDto
     */
    private QuestionAnswerResponseDto convertToResponseDto(QuestionAnswer questionAnswer) {
        return QuestionAnswerResponseDto.builder()
                .id(questionAnswer.getId())
                .sessionId(questionAnswer.getSessionId())
                .questionId(questionAnswer.getQuestionId())
                .sessionType(questionAnswer.getSessionType())
                .userAnswer(questionAnswer.getUserAnswer())
                .isCorrect(questionAnswer.getIsCorrect())
                .timeSpent(questionAnswer.getTimeSpent())
                .answeredAt(questionAnswer.getAnsweredAt())
                .solveCount(questionAnswer.getSolveCount())
                // Question details if available
                .questionText(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getQuestionText() : null)
                .optionA(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getOptionA() : null)
                .optionB(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getOptionB() : null)
                .optionC(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getOptionC() : null)
                .correctAnswer(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getCorrectAnswer() : null)
                .majorCategory(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getMajorCategory() : null)
                .minorCategory(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getMinorCategory() : null)
                .questionType(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getQuestionType() : null)
                .difficultyLevel(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getDifficultyLevel() : null)
                .build();
    }
}