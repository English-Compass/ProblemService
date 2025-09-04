package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.model.entity.SessionQuestion;
import com.problemservice.ProblemService.model.dto.SessionQuestionResponseDto;
import com.problemservice.ProblemService.model.dto.QuestionResponseDto;
import com.problemservice.ProblemService.repository.QuestionRepository;
import com.problemservice.ProblemService.repository.SessionQuestionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
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
        Question question = questionRepository.findById(questionId)
                .orElseThrow(() -> new RuntimeException("Question not found"));

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
     * 단계: 1) 문제 ID 목록 순회 2) 각 문제 존재 확인 3) 순서대로 연관관계 생성 4) 데이터베이스 저장
     * 입력: 세션 ID, 추가할 문제 ID 목록
     * 출력: 없음 (void)
     * 조건: 문제 목록 중 하나라도 존재하지 않으면 예외 발생
     */
    @Transactional
    public void createSessionQuestions(String sessionId, List<String> questionIds) {
        // 1단계: 문제 ID 목록을 순회하며 각 문제에 대해 연관관계 생성
        for (int i = 0; i < questionIds.size(); i++) {
            String questionId = questionIds.get(i); // 현재 처리할 문제 ID
            
            // 2단계: 문제가 실제로 존재하는지 확인
            Question question = questionRepository.findById(questionId)
                    .orElseThrow(() -> new RuntimeException("Question not found: " + questionId));

            // 3단계: 세션-문제 연관관계 엔티티 생성 (순서는 배열 인덱스 + 1)
            SessionQuestion sessionQuestion = SessionQuestion.builder()
                    .sessionId(sessionId) // 세션 ID 설정
                    .questionId(questionId) // 문제 ID 설정
                    .questionOrder(i + 1) // 순서 번호 설정 (1부터 시작)
                    .build();

            // 4단계: 생성된 세션-문제 연관관계를 데이터베이스에 저장
            sessionQuestionRepository.save(sessionQuestion);
        }
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
     * Hibernate lazy loading 문제를 해결하기 위해 DTO를 사용
     * 단계: 1) 세션 문제 조회 2) Question 엔티티를 별도 조회하여 DTO로 변환
     * 입력: 세션 ID
     * 출력: SessionQuestionResponseDto 목록
     */
    public List<SessionQuestionResponseDto> getSessionQuestionsAsDto(String sessionId) {
        // 1단계: 세션 ID로 문제 목록을 문제 순서(questionOrder)에 따라 정렬하여 조회
        List<SessionQuestion> sessionQuestions = sessionQuestionRepository.findBySessionIdOrderByQuestionOrder(sessionId);
        
        // 2단계: 각 SessionQuestion을 DTO로 변환
        return sessionQuestions.stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }

    /**
     * SessionQuestion 엔티티를 SessionQuestionResponseDto로 변환
     * 연관된 Question 엔티티는 별도로 조회하여 lazy loading 문제 해결
     * 입력: SessionQuestion 엔티티
     * 출력: SessionQuestionResponseDto
     */
    private SessionQuestionResponseDto convertToDto(SessionQuestion sessionQuestion) {
        // Question 엔티티를 별도로 조회하여 DTO로 변환 (lazy loading 방지)
        QuestionResponseDto questionDto = null;
        if (sessionQuestion.getQuestionId() != null) {
            // questionRepository를 통해 Question을 별도로 조회
            Question question = questionRepository.findById(sessionQuestion.getQuestionId()).orElse(null);
            if (question != null) {
                questionDto = QuestionResponseDto.builder()
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
}