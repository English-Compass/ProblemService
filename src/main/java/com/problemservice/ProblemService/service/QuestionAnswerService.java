package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.dto.QuestionAnswerCreateDto;
import com.problemservice.ProblemService.model.dto.QuestionAnswerResponseDto;
import com.problemservice.ProblemService.model.entity.LearningSession;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.model.entity.QuestionAnswer;
import com.problemservice.ProblemService.repository.LearningSessionRepository;
import com.problemservice.ProblemService.repository.QuestionAnswerRepository;
import com.problemservice.ProblemService.repository.QuestionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 문제 답안 관리 비즈니스 로직 서비스
 * 사용자 답안 생성, 조회, 삭제 및 다양한 조건의 필터링 기능 제공
 * 입력: 답안 생성 DTO, 세션 ID, 문제 ID, 정답 여부
 * 출력: 답안 응답 DTO 및 목록
 */
@Service
@RequiredArgsConstructor
@Slf4j
@Transactional(readOnly = true)
public class QuestionAnswerService {

    // 문제 답안 데이터 접근을 위한 레포지토리
    private final QuestionAnswerRepository questionAnswerRepository;
    // 문제 존재 여부 확인을 위한 레포지토리
    private final QuestionRepository questionRepository;
    // 학습 세션 정보 조회를 위한 레포지토리
    private final LearningSessionRepository learningSessionRepository;
    // 단어 학습 캐시 무효화를 위한 서비스
    private final WordStudyService wordStudyService;

    /**
     * 새로운 문제 답안 생성
     * 단계: 1) 문제 존재 확인 2) DTO에서 엔티티로 변환 3) 데이터베이스 저장 4) 응답 DTO 변환
     * 입력: 답안 생성 DTO (세션 ID, 문제 ID, 사용자 답안, 정답 여부 등)
     * 출력: 생성된 문제 답안의 응답 DTO
     * 조건: 문제가 존재하지 않으면 예외 발생
     */
    @Transactional
    public QuestionAnswerResponseDto createQuestionAnswer(QuestionAnswerCreateDto createDto, String userId) {
        // 1단계: 답안을 제출하려는 문제가 실제로 존재하는지 확인
        Question question = questionRepository.findById(createDto.getQuestionId())
                .orElseThrow(() -> new RuntimeException("Question not found"));

        // 2단계: 사용자 답변과 정답을 비교하여 정답 여부 확인
        // 사용자 답안을 A,B,C에서 1,2,3으로 변환하여 비교
        String normalizedUserAnswer = convertAnswerToNumber(createDto.getUserAnswer().trim());
        boolean isCorrectAnswer = question.getCorrectAnswer().equals(normalizedUserAnswer);
        
        // 3단계: 입력 DTO의 정보로 QuestionAnswer 엔티티 생성
        QuestionAnswer questionAnswer = QuestionAnswer.builder()
                .sessionId(createDto.getSessionId()) // 답안이 제출된 세션 ID
                .questionId(createDto.getQuestionId()) // 답안을 제출한 문제 ID
                .userId(userId) // 사용자 ID 추가
                .sessionType(createDto.getSessionType()) // 세션 유형
                .userAnswer(createDto.getUserAnswer()) // 사용자가 선택한 답안
                .isCorrect(isCorrectAnswer) // 실제 정답 비교 결과
                .timeSpent(createDto.getTimeSpent()) // 문제 해결에 소요된 시간
                .solveCount(createDto.getSolveCount()) // 이 문제를 푼 횟수
                .build();

        // 3단계: 생성된 문제 답안을 데이터베이스에 저장
        QuestionAnswer savedQuestionAnswer = questionAnswerRepository.save(questionAnswer);
        
        // 4단계: 사용자 학습 프로필 변경으로 인한 단어 학습 캐시 무효화
        try {
            // 세션 ID로 사용자 ID 조회
            LearningSession session = learningSessionRepository.findById(createDto.getSessionId()).orElse(null);
            if (session != null && session.getUserId() != null) {
                // 사용자의 단어 학습 캐시 무효화 (학습 프로필 변경됨)
                wordStudyService.evictUserWordStudyCache(session.getUserId());
            }
        } catch (Exception e) {
            // 캐시 무효화 실패는 답안 저장에 영향을 주지 않도록 로그만 남김
            log.warn("단어 학습 캐시 무효화 실패 - 세션: {}", createDto.getSessionId(), e);
        }
        
        // 5단계: 저장된 엔티티를 응답 DTO로 변환하여 반환
        return convertToResponseDto(savedQuestionAnswer);
    }
    
    /**
     * 답안을 A, B, C에서 1, 2, 3으로 변환
     * 프론트엔드에서 A, B, C로 전송하지만 데이터베이스에는 1, 2, 3으로 저장
     */
    private String convertAnswerToNumber(String letterAnswer) {
        switch (letterAnswer.toUpperCase()) {
            case "A":
                return "1";
            case "B":
                return "2";
            case "C":
                return "3";
            case "1":
            case "2":
            case "3":
                return letterAnswer; // 이미 숫자인 경우
            default:
                throw new IllegalArgumentException("유효하지 않은 답안 형식: " + letterAnswer + " (A, B, C 또는 1, 2, 3만 허용)");
        }
    }

    public QuestionAnswerResponseDto getQuestionAnswerById(Long id) {
        QuestionAnswer questionAnswer = questionAnswerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Question answer not found"));
        return convertToResponseDto(questionAnswer);
    }

    public Page<QuestionAnswerResponseDto> getAllQuestionAnswers(Pageable pageable) {
        Page<QuestionAnswer> questionAnswerPage = questionAnswerRepository.findAll(pageable);
        return questionAnswerPage.map(this::convertToResponseDto);
    }

    @Transactional
    public void deleteQuestionAnswer(Long id) {
        questionAnswerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Question answer not found"));
        questionAnswerRepository.deleteById(id);
    }

    public List<QuestionAnswerResponseDto> getQuestionAnswersBySessionId(String sessionId) {
        List<QuestionAnswer> questionAnswers = questionAnswerRepository.findBySessionId(sessionId);
        return questionAnswers.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    public List<QuestionAnswerResponseDto> getQuestionAnswersByQuestionId(String questionId) {
        List<QuestionAnswer> questionAnswers = questionAnswerRepository.findByQuestionId(questionId);
        return questionAnswers.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    public List<QuestionAnswerResponseDto> getQuestionAnswersBySessionIdAndQuestionId(String sessionId, String questionId) {
        List<QuestionAnswer> questionAnswers = questionAnswerRepository.findBySessionIdAndQuestionId(sessionId, questionId);
        return questionAnswers.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    public List<QuestionAnswerResponseDto> getQuestionAnswersBySessionType(String sessionType) {
        List<QuestionAnswer> questionAnswers = questionAnswerRepository.findBySessionType(sessionType);
        return questionAnswers.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    public List<QuestionAnswerResponseDto> getQuestionAnswersBySessionIdAndCorrectness(String sessionId, Boolean isCorrect) {
        List<QuestionAnswer> questionAnswers = questionAnswerRepository.findBySessionIdAndIsCorrect(sessionId, isCorrect);
        return questionAnswers.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    /**
     * 특정 사용자의 모든 오답 기록을 조회합니다
     * 단계: 1) 사용자 ID로 오답 기록 조회 2) 응답 DTO 변환
     * 입력: 사용자 ID
     * 출력: 오답 기록 응답 DTO 목록
     */
    public List<QuestionAnswerResponseDto> getWrongAnswersByUserId(String userId) {
        List<QuestionAnswer> wrongAnswers = questionAnswerRepository.findByUserIdAndIsCorrect(userId, false);
        return wrongAnswers.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    /**
     * QuestionAnswer 엔티티를 QuestionAnswerResponseDto로 변환하는 헬퍼 메소드
     * 단계: 1) 답안 기본 정보 설정 2) 연관된 문제 정보 설정 3) DTO 객체 생성
     * 입력: QuestionAnswer 엔티티
     * 출력: QuestionAnswerResponseDto (답안 정보와 문제 정보 포함)
     * 조건: 문제 연관관계가 null인 경우 문제 정보는 null로 설정
     */
    private QuestionAnswerResponseDto convertToResponseDto(QuestionAnswer questionAnswer) {
        // 1단계: 답안 엔티티의 모든 필드와 연관된 문제 정보를 DTO에 설정
        return QuestionAnswerResponseDto.builder()
                // 2단계: 답안 기본 정보 설정
                .id(questionAnswer.getId()) // 답안 고유 ID
                .sessionId(questionAnswer.getSessionId()) // 답안이 제출된 세션 ID
                .questionId(questionAnswer.getQuestionId()) // 답안을 제출한 문제 ID
                .sessionType(questionAnswer.getSessionType()) // 세션 유형
                .userAnswer(questionAnswer.getUserAnswer()) // 사용자 답안
                .isCorrect(questionAnswer.getIsCorrect()) // 정답 여부
                .timeSpent(questionAnswer.getTimeSpent()) // 소요 시간
                .answeredAt(questionAnswer.getAnsweredAt()) // 답안 제출 시간
                .solveCount(questionAnswer.getSolveCount()) // 이 문제를 풋 횟수
                // 3단계: 연관된 문제 정보 설정 (null 체크 포함)
                .questionText(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getQuestionText() : null) // 문제 내용
                .optionA(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getOptionA() : null) // 선택지 A
                .optionB(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getOptionB() : null) // 선택지 B
                .optionC(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getOptionC() : null) // 선택지 C
                .correctAnswer(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getCorrectAnswer() : null) // 정답
                .majorCategory(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getMajorCategory() : null) // 주요 카테고리
                .minorCategory(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getMinorCategory() : null) // 세부 카테고리
                .questionType(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getQuestionType() : null) // 문제 유형
                .difficultyLevel(questionAnswer.getQuestion() != null ? questionAnswer.getQuestion().getDifficultyLevel() : null) // 난이도
                // 4단계: 설정된 빌더로 DTO 객체 생성
                .build();
    }
}