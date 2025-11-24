package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.model.entity.QuestionAnswer;
import com.problemservice.ProblemService.model.entity.SessionQuestion;
import com.problemservice.ProblemService.model.dto.SessionQuestionResponseDto;
import com.problemservice.ProblemService.model.dto.QuestionResponseDto;
import com.problemservice.ProblemService.repository.QuestionAnswerRepository;
import com.problemservice.ProblemService.repository.QuestionRepository;
import com.problemservice.ProblemService.repository.SessionQuestionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 세션-문제 연관관계 관리 비즈니스 로직 서비스
 * 세션에 문제 추가, 삭제, 순서 관리 및 조회 기능 제공
 * 입력: 세션 ID, 문제 ID, 문제 ID 목록
 * 출력: 세션-문제 연관관계 목록, 문제 개수, 다음 순서 번호
 */
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class SessionQuestionService {

    // 세션-문제 연관관계 데이터 접근을 위한 레포지토리
    private final SessionQuestionRepository sessionQuestionRepository;
    // 문제 존재 여부 확인을 위한 레포지토리
    private final QuestionRepository questionRepository;
    // 답안 정보 조회를 위한 레포지토리
    private final QuestionAnswerRepository questionAnswerRepository;

    /**
     * 특정 세션의 모든 문제를 순서대로 조회
     * 단계: 1) 세션 ID로 문제 목록을 순서대로 데이터베이스에서 조회
     * 입력: 세션 ID
     * 출력: 문제 순서로 정렬된 세션-문제 연관관계 목록
     */
    public List<SessionQuestion> getSessionQuestions(String sessionId) {
        // 1단계: 세션 ID로 문제 목록을 문제 순서(questionOrder)에 따라 정렬하여 조회
        return sessionQuestionRepository.findBySessionIdOrderByQuestionOrder(sessionId);
    }

    /**
     * 기존 세션에 새로운 문제를 추가
     * 단계: 1) 문제 존재 확인 2) 다음 순서 번호 계산 3) 세션-문제 연관관계 생성 4) 데이터베이스 저장
     * 입력: 세션 ID, 추가할 문제 ID
     * 출력: 없음 (void)
     * 조건: 문제가 존재하지 않으면 예외 발생
     */
    @Transactional
    public void addQuestionToSession(String sessionId, String questionId) {
        // 1단계: 추가하려는 문제가 실제로 존재하는지 확인
        if (!questionRepository.existsById(questionId)) {
            throw new RuntimeException("Question not found: " + questionId);
        }

        // 2단계: 해당 세션에서 가장 큰 순서 번호를 조회하여 다음 순서 계산
        Integer maxOrder = sessionQuestionRepository.getMaxQuestionOrderBySessionId(sessionId);
        int nextOrder = maxOrder != null ? maxOrder + 1 : 1; // 기존 문제가 없으면 1번부터 시작

        // 3단계: 세션-문제 연관관계 엔티티 생성
        SessionQuestion sessionQuestion = SessionQuestion.builder()
                .sessionId(sessionId) // 세션 ID 설정
                .questionId(questionId) // 문제 ID 설정
                .questionOrder(nextOrder) // 계산된 다음 순서 번호 설정
                .build();

        // 4단계: 생성된 세션-문제 연관관계를 데이터베이스에 저장
        sessionQuestionRepository.save(sessionQuestion);
    }

    /**
     * 특정 세션에 포함된 문제의 총 개수 조회
     * 단계: 1) 세션 ID로 해당 세션의 문제 개수를 데이터베이스에서 조회
     * 입력: 세션 ID
     * 출력: 해당 세션의 문제 총 개수 (Long)
     */
    public Long getQuestionCountBySessionId(String sessionId) {
        // 1단계: 세션 ID를 사용하여 해당 세션에 연결된 문제의 개수를 조회
        return sessionQuestionRepository.countBySessionId(sessionId);
    }

    /**
     * 특정 세션의 모든 문제 연관관계 삭제
     * 단계: 1) 세션 ID로 해당 세션의 모든 문제 연관관계를 데이터베이스에서 삭제
     * 입력: 세션 ID
     * 출력: 없음 (void)
     */
    @Transactional
    public void deleteSessionQuestions(String sessionId) {
        // 1단계: 세션 ID에 해당하는 모든 세션-문제 연관관계를 데이터베이스에서 삭제
        sessionQuestionRepository.deleteBySessionId(sessionId);
    }

    /**
     * 세션에 여러 문제를 한 번에 추가하여 세션-문제 연관관계 생성
     * 단계: 1) 모든 문제 존재 확인 2) 배치로 연관관계 생성 3) 데이터베이스 저장
     * 입력: 세션 ID, 추가할 문제 ID 목록
     * 출력: 없음 (void)
     * 조건: 문제 목록 중 하나라도 존재하지 않으면 예외 발생
     */
    @Transactional
    public void createSessionQuestions(String sessionId, List<String> questionIds) {
        // 1단계: 모든 문제가 존재하는지 한 번에 확인
        validateQuestionsExist(questionIds);

        // 2단계: 세션-문제 연관관계 엔티티들을 생성하여 배치 저장
        List<SessionQuestion> sessionQuestions = new ArrayList<>();
        for (int i = 0; i < questionIds.size(); i++) {
            SessionQuestion sessionQuestion = SessionQuestion.builder()
                    .sessionId(sessionId)
                    .questionId(questionIds.get(i))
                    .questionOrder(i + 1) // 순서 번호 설정 (1부터 시작)
                    .build();
            sessionQuestions.add(sessionQuestion);
        }

        // 3단계: 생성된 모든 세션-문제 연관관계를 데이터베이스에 배치 저장
        sessionQuestionRepository.saveAll(sessionQuestions);
    }

    /**
     * 특정 세션에서 다음에 추가될 문제의 순서 번호 계산
     * 단계: 1) 세션의 최대 순서 번호 조회 2) 다음 순서 번호 계산 및 반환
     * 입력: 세션 ID
     * 출력: 다음 문제의 순서 번호 (int)
     * 조건: 기존 문제가 없으면 1을 반환, 있으면 최대값 + 1을 반환
     */
    public int getNextQuestionOrder(String sessionId) {
        // 1단계: 해당 세션에서 현재 가장 큰 문제 순서 번호를 조회
        Integer maxOrder = sessionQuestionRepository.getMaxQuestionOrderBySessionId(sessionId);
        // 2단계: 기존 문제가 없으면 1을 반환, 있으면 최대값에 1을 더한 값을 반환
        return maxOrder != null ? maxOrder + 1 : 1;
    }

    /**
     * 특정 세션의 모든 문제를 DTO 형태로 조회
     * Fetch Join을 사용하여 N+1 문제 해결
     * 단계: 1) Question과 함께 세션 문제 조회 2) 세션의 답안 정보 조회 3) DTO로 변환 (답안 정보 포함)
     * 입력: 세션 ID
     * 출력: SessionQuestionResponseDto 목록 (답안 정보 포함)
     */
    public List<SessionQuestionResponseDto> getSessionQuestionsAsDto(String sessionId) {
        // 1단계: Fetch Join을 사용하여 Question과 함께 조회 (N+1 문제 해결)
        List<SessionQuestion> sessionQuestions = sessionQuestionRepository.findBySessionIdWithQuestionOrderByQuestionOrder(sessionId);
        
        // 2단계: 세션의 모든 답안 정보 조회 (questionId를 키로 하는 Map 생성)
        List<QuestionAnswer> sessionAnswers = questionAnswerRepository.findBySessionId(sessionId);
        Map<String, QuestionAnswer> answerMap = sessionAnswers.stream()
                .collect(Collectors.toMap(
                    QuestionAnswer::getQuestionId,
                    answer -> answer,
                    (existing, replacement) -> existing  // 중복 시 첫 번째 답안 유지
                ));
        
        // 3단계: 각 SessionQuestion을 DTO로 변환 (답안 정보 포함)
        return sessionQuestions.stream()
                .map(sq -> convertToDtoWithQuestion(sq, answerMap.get(sq.getQuestionId())))
                .collect(Collectors.toList());
    }

    /**
     * Fetch Join으로 조회된 SessionQuestion을 DTO로 변환 (답안 정보 포함)
     * 이미 로딩된 Question 엔티티를 활용하여 효율적으로 변환
     * 입력: SessionQuestion 엔티티 (Question 포함), QuestionAnswer 엔티티 (선택적)
     * 출력: SessionQuestionResponseDto (답안 정보 포함)
     */
    private SessionQuestionResponseDto convertToDtoWithQuestion(SessionQuestion sessionQuestion, QuestionAnswer questionAnswer) {
        // 이미 Fetch Join으로 로딩된 Question 엔티티 사용
        QuestionResponseDto questionDto = null;
        Question question = sessionQuestion.getQuestion();
        if (question != null) {
            questionDto = buildQuestionResponseDto(question, questionAnswer);
        }

        // SessionQuestionResponseDto 생성
        return SessionQuestionResponseDto.builder()
                .sessionQuestionId(sessionQuestion.getId())
                .sessionId(sessionQuestion.getSessionId())
                .questionId(sessionQuestion.getQuestionId())
                .questionOrder(sessionQuestion.getQuestionOrder())
                .categories(sessionQuestion.getCategories())
                .question(questionDto)
                .build();
    }

    /**
     * Question 엔티티를 QuestionResponseDto로 변환하는 헬퍼 메소드 (답안 정보 포함)
     * 중복 코드를 제거하고 일관성 있는 변환 로직 제공
     * 입력: Question 엔티티, QuestionAnswer 엔티티 (선택적 - 답안이 제출된 경우)
     * 출력: QuestionResponseDto (답안 정보 포함)
     */
    private QuestionResponseDto buildQuestionResponseDto(Question question, QuestionAnswer questionAnswer) {
        QuestionResponseDto.QuestionResponseDtoBuilder builder = QuestionResponseDto.builder()
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
                .updatedAt(question.getUpdatedAt());
        
        // 답안 정보가 있으면 포함
        if (questionAnswer != null) {
            builder.userAnswer(questionAnswer.getUserAnswer())
                   .userAnswerText(questionAnswer.getUserAnswerText())
                   .correctAnswerText(questionAnswer.getCorrectAnswerText())
                   .isCorrect(questionAnswer.getIsCorrect())
                   .answeredAt(questionAnswer.getAnsweredAt());
        }
        
        return builder.build();
    }

    /**
     * 여러 문제 ID의 존재 여부를 검증하는 헬퍼 메소드
     * 배치 생성 시 모든 문제가 존재하는지 사전에 확인
     * 입력: 문제 ID 목록
     * 출력: 없음 (존재하지 않는 문제가 있으면 예외 발생)
     */
    private void validateQuestionsExist(List<String> questionIds) {
        for (String questionId : questionIds) {
            if (!questionRepository.existsById(questionId)) {
                throw new RuntimeException("Question not found: " + questionId);
            }
        }
    }
}