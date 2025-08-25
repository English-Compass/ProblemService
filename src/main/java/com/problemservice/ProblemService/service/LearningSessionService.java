package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.dto.LearningSessionCreateDto;
import com.problemservice.ProblemService.model.dto.LearningSessionResponseDto;
import com.problemservice.ProblemService.model.dto.LearningSessionUpdateDto;
import com.problemservice.ProblemService.model.dto.SessionCompletedEventDto;
import com.problemservice.ProblemService.model.entity.LearningSession;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionStatus;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionType;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.model.entity.SessionQuestion;
import com.problemservice.ProblemService.repository.LearningSessionRepository;
import com.problemservice.ProblemService.repository.QuestionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 학습 세션 관리 비즈니스 로직 서비스
 * 세션 생성, 시작, 진행, 완료 및 통계 기능 제공
 * 입력: 세션 생성/수정 DTO, 사용자 ID, 세션 상태
 * 출력: 세션 응답 DTO 및 목록, 통계 데이터
 */
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class LearningSessionService {

    // 학습 세션 데이터 접근을 위한 레포지토리
    private final LearningSessionRepository learningSessionRepository;
    // 문제 데이터 접근을 위한 레포지토리
    private final QuestionRepository questionRepository;
    // 세션 완료 이벤트 발행을 위한 서비스
    private final EventPublisherService eventPublisherService;
    // 세션-문제 연관관계 관리를 위한 서비스
    private final SessionQuestionService sessionQuestionService;

    /**
     * 새로운 학습 세션 생성
     * 단계: 1) 고유 세션 ID 생성 2) 세션 엔티티 생성 3) 데이터베이스 저장 4) 문제 연결 5) 응답 DTO 변환
     * 입력: 세션 생성 DTO (사용자 ID, 세션 유형, 문제 ID 목록)
     * 출력: 생성된 세션의 응답 DTO
     */
    @Transactional
    public LearningSessionResponseDto createLearningSession(LearningSessionCreateDto createDto) {
        // 1단계: 세션의 고유 ID 생성 (UUID 사용)
        String sessionId = UUID.randomUUID().toString();
        
        // 2단계: DTO 정보로 LearningSession 엔티티 생성
        LearningSession session = LearningSession.builder()
                .sessionId(sessionId) // 생성된 고유 ID 설정
                .userId(createDto.getUserId()) // 사용자 ID 설정
                .sessionType(createDto.getSessionType()) // 세션 유형 설정
                .sessionMetadata(createDto.getSessionMetadata()) // 메타데이터 설정
                .status(SessionStatus.STARTED) // 세션 상태를 STARTED로 설정
                .startedAt(LocalDateTime.now()) // 세션 시작 시간 설정
                .totalQuestions(createDto.getQuestionIds() != null ? createDto.getQuestionIds().size() : 0) // 총 문제 수 설정
                .build();

        // 3단계: 생성된 세션을 데이터베이스에 저장
        LearningSession savedSession = learningSessionRepository.save(session);

        // 4단계: 문제 ID 목록이 있으면 세션과 문제 연결 생성
        if (createDto.getQuestionIds() != null && !createDto.getQuestionIds().isEmpty()) {
            sessionQuestionService.createSessionQuestions(sessionId, createDto.getQuestionIds());
        }

        // 5단계: 저장된 세션을 응답 DTO로 변환하여 반환
        return convertToResponseDto(savedSession);
    }

    /**
     * 세션 ID로 특정 학습 세션 조회
     * 단계: 1) ID로 세션 검색 2) 존재하지 않으면 예외 발생 3) 응답 DTO로 변환
     * 입력: 세션 ID (String)
     * 출력: 해당 세션의 상세 정보 DTO
     */
    public LearningSessionResponseDto getLearningSessionById(String sessionId) {
        // 1단계: ID로 세션을 데이터베이스에서 조회
        LearningSession session = learningSessionRepository.findById(sessionId)
                // 2단계: 세션이 존재하지 않으면 예외 발생
                .orElseThrow(() -> new RuntimeException("Learning session not found"));
        // 3단계: 조회된 엔티티를 응답 DTO로 변환하여 반환
        return convertToResponseDto(session);
    }

    public Page<LearningSessionResponseDto> getAllLearningSessionsByUserId(String userId, Pageable pageable) {
        Page<LearningSession> sessionPage = learningSessionRepository.findByUserId(userId, pageable);
        return sessionPage.map(this::convertToResponseDto);
    }

    public List<LearningSessionResponseDto> getLearningSessionsByUserIdAndStatus(String userId, SessionStatus status) {
        List<LearningSession> sessions = learningSessionRepository.findByUserIdAndStatus(userId, status);
        return sessions.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    public List<LearningSessionResponseDto> getLearningSessionsByUserIdAndType(String userId, SessionType sessionType) {
        List<LearningSession> sessions = learningSessionRepository.findByUserIdAndSessionType(userId, sessionType);
        return sessions.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    @Transactional
    public LearningSessionResponseDto updateLearningSession(String sessionId, LearningSessionUpdateDto updateDto) {
        LearningSession session = learningSessionRepository.findById(sessionId)
                .orElseThrow(() -> new RuntimeException("Learning session not found"));

        if (updateDto.getStatus() != null) {
            session.setStatus(updateDto.getStatus());
            if (updateDto.getStatus() == SessionStatus.COMPLETED && session.getCompletedAt() == null) {
                session.setCompletedAt(LocalDateTime.now());
            }
        }
        
        if (updateDto.getSessionMetadata() != null) {
            session.setSessionMetadata(updateDto.getSessionMetadata());
        }
        
        if (updateDto.getAnsweredQuestions() != null) {
            session.setAnsweredQuestions(updateDto.getAnsweredQuestions());
        }
        
        if (updateDto.getCorrectAnswers() != null) {
            session.setCorrectAnswers(updateDto.getCorrectAnswers());
        }
        
        if (updateDto.getWrongAnswers() != null) {
            session.setWrongAnswers(updateDto.getWrongAnswers());
        }
        
        if (updateDto.getProgressPercentage() != null) {
            session.setProgressPercentage(updateDto.getProgressPercentage());
        }

        LearningSession savedSession = learningSessionRepository.save(session);
        return convertToResponseDto(savedSession);
    }

    @Transactional
    public void deleteLearningSession(String sessionId) {
        learningSessionRepository.findById(sessionId)
                .orElseThrow(() -> new RuntimeException("Learning session not found"));
        
        sessionQuestionService.deleteSessionQuestions(sessionId);
        learningSessionRepository.deleteById(sessionId);
    }

    @Transactional
    public LearningSessionResponseDto startSession(String sessionId) {
        LearningSession session = learningSessionRepository.findById(sessionId)
                .orElseThrow(() -> new RuntimeException("Learning session not found"));

        session.setStatus(SessionStatus.IN_PROGRESS);
        if (session.getStartedAt() == null) {
            session.setStartedAt(LocalDateTime.now());
        }

        LearningSession savedSession = learningSessionRepository.save(session);
        return convertToResponseDto(savedSession);
    }

    @Transactional
    public LearningSessionResponseDto completeSession(String sessionId) {
        LearningSession session = learningSessionRepository.findById(sessionId)
                .orElseThrow(() -> new RuntimeException("Learning session not found"));

        session.setStatus(SessionStatus.COMPLETED);
        session.setCompletedAt(LocalDateTime.now());
        
        if (session.getTotalQuestions() != null && session.getTotalQuestions() > 0) {
            double progressPercentage = (double) session.getAnsweredQuestions() / session.getTotalQuestions() * 100.0;
            session.setProgressPercentage(progressPercentage);
        }

        LearningSession savedSession = learningSessionRepository.save(session);
        
        publishSessionCompletedEvent(savedSession);
        
        return convertToResponseDto(savedSession);
    }

    @Transactional
    public LearningSessionResponseDto updateSessionProgress(String sessionId, boolean isCorrect) {
        LearningSession session = learningSessionRepository.findById(sessionId)
                .orElseThrow(() -> new RuntimeException("Learning session not found"));

        session.setAnsweredQuestions(session.getAnsweredQuestions() + 1);
        
        if (isCorrect) {
            session.setCorrectAnswers(session.getCorrectAnswers() + 1);
        } else {
            session.setWrongAnswers(session.getWrongAnswers() + 1);
        }

        if (session.getTotalQuestions() != null && session.getTotalQuestions() > 0) {
            double progressPercentage = (double) session.getAnsweredQuestions() / session.getTotalQuestions() * 100.0;
            session.setProgressPercentage(progressPercentage);
        }

        if (session.getStatus() == SessionStatus.STARTED) {
            session.setStatus(SessionStatus.IN_PROGRESS);
        }

        LearningSession savedSession = learningSessionRepository.save(session);
        return convertToResponseDto(savedSession);
    }


    @Transactional
    public void addQuestionToSession(String sessionId, String questionId) {
        LearningSession session = learningSessionRepository.findById(sessionId)
                .orElseThrow(() -> new RuntimeException("Learning session not found"));

        sessionQuestionService.addQuestionToSession(sessionId, questionId);

        session.setTotalQuestions(session.getTotalQuestions() + 1);
        learningSessionRepository.save(session);
    }

    public Long getSessionCountByUserIdAndStatus(String userId, SessionStatus status) {
        return learningSessionRepository.countByUserIdAndStatus(userId, status);
    }

    public Double getAverageProgressByUserId(String userId) {
        return learningSessionRepository.getAverageProgressByUserId(userId);
    }

    public List<LearningSessionResponseDto> getLearningSessionsByDateRange(String userId, LocalDateTime startDate, LocalDateTime endDate) {
        List<LearningSession> sessions = learningSessionRepository.findByUserIdAndDateRange(userId, startDate, endDate);
        return sessions.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }


    private LearningSessionResponseDto convertToResponseDto(LearningSession session) {
        return LearningSessionResponseDto.builder()
                .sessionId(session.getSessionId())
                .userId(session.getUserId())
                .status(session.getStatus())
                .sessionType(session.getSessionType())
                .sessionMetadata(session.getSessionMetadata())
                .totalQuestions(session.getTotalQuestions())
                .answeredQuestions(session.getAnsweredQuestions())
                .correctAnswers(session.getCorrectAnswers())
                .wrongAnswers(session.getWrongAnswers())
                .progressPercentage(session.getProgressPercentage())
                .createdAt(session.getCreatedAt())
                .startedAt(session.getStartedAt())
                .completedAt(session.getCompletedAt())
                .updatedAt(session.getUpdatedAt())
                .build();
    }

    @Transactional
    public LearningSessionResponseDto createPracticeSession(LearningSessionCreateDto createDto) {
        String sessionId = UUID.randomUUID().toString();
        
        LearningSession session = LearningSession.builder()
                .sessionId(sessionId)
                .userId(createDto.getUserId())
                .sessionType(SessionType.PRACTICE)
                .sessionMetadata(createDto.getSessionMetadata())
                .status(SessionStatus.STARTED)
                .startedAt(LocalDateTime.now())
                .build();

        Integer userLevel = extractUserLevel(createDto.getUserId());
        
        List<String> selectedCategories = createDto.getCategories();
        List<Question> availableQuestions = getUnsolvedQuestionsByUserAndCategories(
                createDto.getUserId(), selectedCategories, userLevel);
        
        List<Question> selectedQuestions = selectBalancedQuestions(availableQuestions, 10);
        
        session.setTotalQuestions(selectedQuestions.size());
        LearningSession savedSession = learningSessionRepository.save(session);
        
        if (!selectedQuestions.isEmpty()) {
            List<String> questionIds = selectedQuestions.stream()
                    .map(Question::getQuestionId)
                    .collect(Collectors.toList());
            sessionQuestionService.createSessionQuestions(sessionId, questionIds);
        }

        return convertToResponseDto(savedSession);
    }

    private Integer extractUserLevel(String userId) {
        return 1;
    }

    /**
     * 사용자가 풀지 않은 문제들 중 선택한 카테고리와 일치하는 문제들을 추출합니다
     */
    private List<Question> getUnsolvedQuestionsByUserAndCategories(String userId, List<String> categories, Integer userLevel) {
        // 사용자가 이미 푼 문제들의 ID 수집
        List<LearningSession> userSessions = learningSessionRepository.findByUserId(userId);
        List<String> solvedQuestionIds = userSessions.stream()
                .flatMap(session -> sessionQuestionService.getSessionQuestions(session.getSessionId()).stream())
                .map(SessionQuestion::getQuestionId)
                .distinct()
                .collect(Collectors.toList());

        // 선택한 카테고리의 문제들 조회
        List<Question> categoryQuestions = categories.stream()
                .flatMap(category -> questionRepository.findByMajorCategoryAndDifficultyLevel(category, userLevel).stream())
                .collect(Collectors.toList());

        // 이미 푼 문제들 제외
        return categoryQuestions.stream()
                .filter(question -> !solvedQuestionIds.contains(question.getQuestionId()))
                .collect(Collectors.toList());
    }

    /**
     * 문제 유형을 골고루 선택하여 지정된 개수만큼 문제를 선택합니다
     */
    private List<Question> selectBalancedQuestions(List<Question> availableQuestions, int targetCount) {
        if (availableQuestions.isEmpty()) {
            return List.of();
        }

        Map<String, List<Question>> questionsByType = availableQuestions.stream()
                .collect(Collectors.groupingBy(Question::getQuestionType));

        List<Question> selectedQuestions = new ArrayList<>();
        List<String> questionTypes = new ArrayList<>(questionsByType.keySet());
        
        int currentTypeIndex = 0;
        while (selectedQuestions.size() < targetCount && !questionsByType.isEmpty()) {
            String currentType = questionTypes.get(currentTypeIndex);
            List<Question> typeQuestions = questionsByType.get(currentType);
            
            if (!typeQuestions.isEmpty()) {
                selectedQuestions.add(typeQuestions.remove(0));
            }
            
            if (typeQuestions.isEmpty()) {
                questionsByType.remove(currentType);
                questionTypes.remove(currentType);
                if (!questionTypes.isEmpty()) {
                    currentTypeIndex = currentTypeIndex % questionTypes.size();
                }
            } else {
                currentTypeIndex = (currentTypeIndex + 1) % questionTypes.size();
            }
        }

        return selectedQuestions;
    }

    private void publishSessionCompletedEvent(LearningSession session) {
        SessionCompletedEventDto event = SessionCompletedEventDto.builder()
                .sessionId(session.getSessionId())
                .userId(session.getUserId())
                .sessionType(session.getSessionType())
                .completedAt(session.getCompletedAt())
                .totalQuestions(session.getTotalQuestions())
                .correctAnswers(session.getCorrectAnswers())
                .wrongAnswers(session.getWrongAnswers())
                .progressPercentage(session.getProgressPercentage())
                .build();
                
        eventPublisherService.publishSessionCompletedEvent(event);
    }
}