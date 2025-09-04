package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.exception.BusinessLogicException;
import com.problemservice.ProblemService.exception.EntityNotFoundException;
import com.problemservice.ProblemService.model.dto.LearningSessionCreateDto;
import com.problemservice.ProblemService.model.dto.LearningSessionResponseDto;
import com.problemservice.ProblemService.model.dto.LearningSessionUpdateDto;
import com.problemservice.ProblemService.model.dto.SessionCompletedEventDto;
import com.problemservice.ProblemService.model.entity.LearningSession;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionStatus;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionType;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.model.entity.QuestionAnswer;
import com.problemservice.ProblemService.model.entity.SessionQuestion;
import com.problemservice.ProblemService.model.enums.Difficulty;
import com.problemservice.ProblemService.repository.LearningSessionRepository;
import com.problemservice.ProblemService.repository.QuestionAnswerRepository;
import com.problemservice.ProblemService.repository.QuestionRepository;
import com.problemservice.ProblemService.service.base.BaseService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import java.util.stream.Collectors;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 학습 세션 관리 서비스
 * 세션 CRUD, 진행률 추적, 세션 타입별 생성 로직 제공
 */
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class LearningSessionService extends BaseService {

    private final LearningSessionRepository learningSessionRepository;
    private final QuestionRepository questionRepository;
    private final EventPublisherService eventPublisherService;
    private final SessionQuestionService sessionQuestionService;
    private final QuestionAssignmentService questionAssignmentService;
    private final QuestionAnswerRepository questionAnswerRepository;
    private final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * 새로운 학습 세션을 생성하고 문제를 할당
     * @param createDto 세션 생성에 필요한 데이터 (사용자 ID, 세션 타입, 메타데이터 포함)
     * @return 생성된 세션 정보와 할당된 문제 수를 포함한 응답 DTO
     * @throws IllegalArgumentException 필수 필드 누락 시
     */
    @Transactional
    public LearningSessionResponseDto createLearningSession(LearningSessionCreateDto createDto) {
        logMethodEntry("createLearningSession", createDto.getUserId(), createDto.getSessionType());
        validateCreateDto(createDto);
        
        String sessionId = UUID.randomUUID().toString();
        
        LearningSession session = buildSessionFromDto(sessionId, createDto);
        LearningSession savedSession = learningSessionRepository.save(session);
        
        attachQuestionsToSession(sessionId, createDto.getQuestionIds());
        
        LearningSessionResponseDto result = convertToResponseDto(savedSession);
        logMethodExit("createLearningSession", result.getSessionId());
        return result;
    }

    /**
     * 세션 ID로 학습 세션 상세 정보 조회
     * 세션 상태, 진행률, 연관된 문제 정보를 포함하여 반환
     * @param sessionId 조회할 세션의 고유 식별자
     * @return 세션 상세 정보가 포함된 응답 DTO
     * @throws EntityNotFoundException 해당 세션이 존재하지 않을 때
     */
    public LearningSessionResponseDto getLearningSessionById(String sessionId) {
        logMethodEntry("getLearningSessionById", sessionId);
        validateId(sessionId, "Learning Session");
        
        LearningSession session = findSessionByIdOrThrow(sessionId);
        
        LearningSessionResponseDto result = convertToResponseDto(session);
        logMethodExit("getLearningSessionById", result.getSessionId());
        return result;
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
        logMethodEntry("updateLearningSession", sessionId);
        validateId(sessionId, "Learning Session");
        
        LearningSession session = findSessionByIdOrThrow(sessionId);
        updateSessionFromDto(session, updateDto);
        
        LearningSession savedSession = learningSessionRepository.save(session);
        
        LearningSessionResponseDto result = convertToResponseDto(savedSession);
        logMethodExit("updateLearningSession", result.getSessionId());
        return result;
    }

    @Transactional
    public void deleteLearningSession(String sessionId) {
        logMethodEntry("deleteLearningSession", sessionId);
        validateId(sessionId, "Learning Session");
        
        findSessionByIdOrThrow(sessionId);
        
        sessionQuestionService.deleteSessionQuestions(sessionId);
        learningSessionRepository.deleteById(sessionId);
        
        logMethodExit("deleteLearningSession", "Session deleted: " + sessionId);
    }

    @Transactional
    public LearningSessionResponseDto startSession(String sessionId) {
        logMethodEntry("startSession", sessionId);
        validateId(sessionId, "Learning Session");
        
        LearningSession session = findSessionByIdOrThrow(sessionId);

        session.setStatus(SessionStatus.IN_PROGRESS);
        if (session.getStartedAt() == null) {
            session.setStartedAt(LocalDateTime.now());
        }

        LearningSession savedSession = learningSessionRepository.save(session);
        
        LearningSessionResponseDto result = convertToResponseDto(savedSession);
        logMethodExit("startSession", result.getSessionId());
        return result;
    }

    @Transactional
    public LearningSessionResponseDto completeSession(String sessionId) {
        logMethodEntry("completeSession", sessionId);
        validateId(sessionId, "Learning Session");
        
        LearningSession session = findSessionByIdOrThrow(sessionId);

        session.setStatus(SessionStatus.COMPLETED);
        session.setCompletedAt(LocalDateTime.now());
        
        calculateAndSetProgressPercentage(session);

        LearningSession savedSession = learningSessionRepository.save(session);
        publishSessionCompletedEvent(savedSession);
        
        LearningSessionResponseDto result = convertToResponseDto(savedSession);
        logMethodExit("completeSession", result.getSessionId());
        return result;
    }

    @Transactional
    public LearningSessionResponseDto updateSessionProgress(String sessionId, boolean isCorrect) {
        logMethodEntry("updateSessionProgress", sessionId, isCorrect);
        validateId(sessionId, "Learning Session");
        
        LearningSession session = findSessionByIdOrThrow(sessionId);

        updateSessionStats(session, isCorrect);
        calculateAndSetProgressPercentage(session);
        
        if (session.getStatus() == SessionStatus.STARTED) {
            session.setStatus(SessionStatus.IN_PROGRESS);
        }

        LearningSession savedSession = learningSessionRepository.save(session);
        
        LearningSessionResponseDto result = convertToResponseDto(savedSession);
        logMethodExit("updateSessionProgress", result.getSessionId());
        return result;
    }


    @Transactional
    public void addQuestionToSession(String sessionId, String questionId) {
        logMethodEntry("addQuestionToSession", sessionId, questionId);
        validateId(sessionId, "Learning Session");
        validateId(questionId, "Question");
        
        LearningSession session = findSessionByIdOrThrow(sessionId);

        sessionQuestionService.addQuestionToSession(sessionId, questionId);

        session.setTotalQuestions(session.getTotalQuestions() + 1);
        learningSessionRepository.save(session);
        
        logMethodExit("addQuestionToSession", "Question added to session");
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

        // Extract metadata to get categories, keywords, and user level
        SessionMetadata metadata = extractSessionMetadata(createDto.getSessionMetadata());
        
        // Validate that categories are provided
        if (metadata.getCategories() == null || metadata.getCategories().isEmpty()) {
            throw new IllegalArgumentException("At least one category must be selected");
        }
        
        // Use user level from metadata or default to 1 (beginner)
        Integer userLevel = mapLevelToInteger(metadata.getLevel());
        
        // Get selected categories and keywords from metadata
        List<String> selectedCategories = metadata.getCategories();
        List<String> keywords = metadata.getKeywords();
        
        // Select questions based on user level, categories, and keywords
        List<Question> selectedQuestions = selectQuestionsForPractice(
                createDto.getUserId(), 
                selectedCategories, 
                keywords,
                userLevel,
                metadata.getQuestionCount() != null ? metadata.getQuestionCount() : 10
        );
        
        // If no questions found with optimal selection, fall back to basic selection
        if (selectedQuestions.isEmpty()) {
            List<Question> availableQuestions = getUnsolvedQuestionsByUserAndCategories(
                    createDto.getUserId(), selectedCategories, userLevel);
            selectedQuestions = selectBalancedQuestions(availableQuestions, 10);
        }
        
        // If still no questions, throw exception
        if (selectedQuestions.isEmpty()) {
            throw new BusinessLogicException("No questions available for selected categories and user level");
        }
        
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
     * 사용자 난이도 설정 추출
     * TODO: 사용자 테이블에서 실제 난이도 설정을 조회하도록 구현
     * @param createDto 세션 생성 DTO
     * @return 사용자 선호 난이도 (기본값: A)
     */
    private Difficulty extractUserDifficulty(LearningSessionCreateDto createDto) {
        // TODO: 데이터베이스에서 사용자의 난이도 설정을 조회
        // 현재는 기본값으로 A(초급) 반환
        return Difficulty.A;
    }

    /**
     * 사용자가 풀지 않은 문제들 중 선택한 카테고리와 일치하는 문제들을 추출합니다
     */
    private List<Question> getUnsolvedQuestionsByUserAndCategories(String userId, List<String> categories, Integer userLevel) {
        if (categories == null || categories.isEmpty()) {
            return new ArrayList<>();
        }
        
        // Use the optimized repository method that handles category filtering and user exclusion in a single query
        return questionRepository.findUnsolvedQuestionsByUserAndCategoriesAndDifficulty(userId, categories, userLevel);
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

    /**
     * 사용자의 학습 이력을 기반으로 복습 세션 생성
     * 이전에 정답을 맞힌 문제들 중에서 복습이 필요한 문제들을 선별하여 세션 구성
     * @param createDto 세션 생성 정보 (사용자 ID, 카테고리 목록, 메타데이터)
     * @return 생성된 복습 세션 정보와 할당된 문제 수
     * @throws BusinessLogicException 정답 기록이 없어 복습 세션 생성 불가 시
     */
    @Transactional
    public LearningSessionResponseDto createReviewSession(LearningSessionCreateDto createDto) {
        // 1단계: 기존 미시작 복습 세션 확인
        List<LearningSession> existingSessions = learningSessionRepository
                .findByUserIdAndSessionTypeAndStatus(createDto.getUserId(), SessionType.REVIEW, SessionStatus.STARTED);
        
        LearningSession session;
        String sessionId;
        
        if (!existingSessions.isEmpty()) {
            // 기존 미시작 세션이 있으면 재사용
            session = existingSessions.get(0);
            sessionId = session.getSessionId();
            
            // 2단계: 기존 세션의 문제들 제거
            sessionQuestionService.deleteSessionQuestions(sessionId);
            
            // 3단계: 세션 메타데이터 업데이트
            session.setSessionMetadata(createDto.getSessionMetadata());
            session.setStartedAt(LocalDateTime.now());
        } else {
            // 새로운 세션 생성
            sessionId = UUID.randomUUID().toString();
            session = LearningSession.builder()
                    .sessionId(sessionId)
                    .userId(createDto.getUserId())
                    .sessionType(SessionType.REVIEW)
                    .sessionMetadata(createDto.getSessionMetadata())
                    .status(SessionStatus.STARTED)
                    .startedAt(LocalDateTime.now())
                    .build();
        }

        // 4단계: 복습 문제는 사용자가 정답을 맞힌 문제들에서 선택
        List<String> selectedCategories = createDto.getCategories();
        List<Question> selectedQuestions = selectQuestionsForReview(createDto.getUserId(), selectedCategories, 5);
        
        // 정답 기록이 없으면 복습 세션 생성 불가
        if (selectedQuestions.isEmpty()) {
            throw new BusinessLogicException("No correct answer history found. Cannot create review session.");
        }
        
        // 5단계: 세션 정보 업데이트 및 저장
        session.setTotalQuestions(selectedQuestions.size());
        LearningSession savedSession = learningSessionRepository.save(session);
        
        // 6단계: 새로운 문제들을 세션에 연결
        if (!selectedQuestions.isEmpty()) {
            List<String> questionIds = selectedQuestions.stream()
                    .map(Question::getQuestionId)
                    .collect(Collectors.toList());
            sessionQuestionService.createSessionQuestions(sessionId, questionIds);
        }

        return convertToResponseDto(savedSession);
    }

    /**
     * 사용자가 이전에 틀린 문제들로 오답노트 세션 생성
     * 틀린 횟수가 많고 최근에 틀린 문제들을 우선순위로 선별하여 세션 구성
     * @param createDto 세션 생성 정보 (사용자 ID, 카테고리 목록, 메타데이터)
     * @return 생성된 오답노트 세션 정보와 할당된 문제 수
     * @throws BusinessLogicException 오답 기록이 없어 오답노트 세션 생성 불가 시
     */
    @Transactional
    public LearningSessionResponseDto createWrongAnswerSession(LearningSessionCreateDto createDto) {
        // 1단계: 기존 미시작 오답노트 세션 확인
        List<LearningSession> existingSessions = learningSessionRepository
                .findByUserIdAndSessionTypeAndStatus(createDto.getUserId(), SessionType.WRONG_ANSWER, SessionStatus.STARTED);
        
        LearningSession session;
        String sessionId;
        
        if (!existingSessions.isEmpty()) {
            // 기존 미시작 세션이 있으면 재사용
            session = existingSessions.get(0);
            sessionId = session.getSessionId();
            
            // 2단계: 기존 세션의 문제들 제거
            sessionQuestionService.deleteSessionQuestions(sessionId);
            
            // 3단계: 세션 메타데이터 업데이트
            session.setSessionMetadata(createDto.getSessionMetadata());
            session.setStartedAt(LocalDateTime.now());
        } else {
            // 새로운 세션 생성
            sessionId = UUID.randomUUID().toString();
            session = LearningSession.builder()
                    .sessionId(sessionId)
                    .userId(createDto.getUserId())
                    .sessionType(SessionType.WRONG_ANSWER)
                    .sessionMetadata(createDto.getSessionMetadata())
                    .status(SessionStatus.STARTED)
                    .startedAt(LocalDateTime.now())
                    .build();
        }

        // 4단계: 오답노트 문제는 사용자가 틀린 문제들에서 선택
        List<String> selectedCategories = createDto.getCategories();
        List<Question> selectedQuestions = selectQuestionsForWrongAnswer(createDto.getUserId(), selectedCategories, 5);
        
        // 오답 기록이 없으면 오답노트 세션 생성 불가
        if (selectedQuestions.isEmpty()) {
            throw new BusinessLogicException("No wrong answer history found. Cannot create wrong answer session.");
        }
        
        // 5단계: 세션 정보 업데이트 및 저장
        session.setTotalQuestions(selectedQuestions.size());
        LearningSession savedSession = learningSessionRepository.save(session);
        
        // 6단계: 새로운 문제들을 세션에 연결
        if (!selectedQuestions.isEmpty()) {
            List<String> questionIds = selectedQuestions.stream()
                    .map(Question::getQuestionId)
                    .collect(Collectors.toList());
            sessionQuestionService.createSessionQuestions(sessionId, questionIds);
        }

        return convertToResponseDto(savedSession);
    }

    /**
     * 사용자의 정답 기록에서 복습이 필요한 문제들을 선별
     * 이전에 맞힌 문제들 중 시간이 지난 문제들을 우선적으로 선택
     * @param userId 사용자 식별자
     * @param categories 대상 카테고리 목록
     * @param questionCount 선택할 문제 수
     * @return 복습 대상 문제 목록
     */
    private List<Question> selectQuestionsForReview(String userId, List<String> categories, int questionCount) {
        // 1. 사용자가 이전에 정답을 맞힌 문제들 조회 (카테고리별)
        List<QuestionAnswer> correctAnswers = questionAnswerRepository
            .findByUserIdAndCategoriesAndIsCorrect(userId, categories, true);
        
        if (correctAnswers.isEmpty()) {
            return new ArrayList<>();
        }
        
        // 2. 정답을 맞힌 문제들을 Question 엔티티로 변환 (중복 제거)
        Map<String, Question> uniqueQuestions = correctAnswers.stream()
            .collect(Collectors.toMap(
                QuestionAnswer::getQuestionId,
                qa -> questionRepository.findById(qa.getQuestionId()).orElse(null),
                (existing, replacement) -> existing  // 중복 시 기존 값 유지
            ));
        
        // 3. null 값 제거 및 복습 우선순위 적용 (최근 학습한 문제를 나중에 배치)
        List<Question> reviewQuestions = uniqueQuestions.values().stream()
            .filter(Objects::nonNull)
            .limit(questionCount)
            .collect(Collectors.toList());
        
        return reviewQuestions;
    }

    /**
     * 사용자의 오답 기록에서 재학습이 필요한 문제들을 선별
     * 틀린 횟수가 많고 최근에 틀린 문제들을 우선순위로 선택
     * @param userId 사용자 식별자
     * @param categories 대상 카테고리 목록
     * @param questionCount 선택할 문제 수
     * @return 오답노트 대상 문제 목록
     */
    private List<Question> selectQuestionsForWrongAnswer(String userId, List<String> categories, int questionCount) {
        // 1. 사용자가 이전에 틀린 문제들 조회 (카테고리별, 틀린 횟수 많은 순)
        List<QuestionAnswer> wrongAnswers = questionAnswerRepository
            .findWrongAnswersByUserIdAndCategories(userId, categories);
        
        if (wrongAnswers.isEmpty()) {
            return new ArrayList<>();
        }
        
        // 2. 틀린 문제들을 Question 엔티티로 변환 (중복 제거, 우선순위 유지)
        Map<String, Question> uniqueQuestions = wrongAnswers.stream()
            .collect(Collectors.toMap(
                QuestionAnswer::getQuestionId,
                qa -> questionRepository.findById(qa.getQuestionId()).orElse(null),
                (existing, replacement) -> existing,  // 첫 번째 (가장 높은 우선순위) 유지
                LinkedHashMap::new  // 순서 보장
            ));
        
        // 3. null 값 제거 및 요청한 개수만큼 선택 (우선순위 순서 유지)
        List<Question> wrongAnswerQuestions = uniqueQuestions.values().stream()
            .filter(Objects::nonNull)
            .limit(questionCount)
            .collect(Collectors.toList());
        
        return wrongAnswerQuestions;
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
    
    private void validateCreateDto(LearningSessionCreateDto createDto) {
        if (createDto == null) {
            throw new IllegalArgumentException("Create DTO cannot be null");
        }
        if (createDto.getUserId() == null || createDto.getUserId().trim().isEmpty()) {
            throw new IllegalArgumentException("User ID cannot be null or empty");
        }
        if (createDto.getSessionType() == null) {
            throw new IllegalArgumentException("Session type cannot be null");
        }
    }
    
    private LearningSession buildSessionFromDto(String sessionId, LearningSessionCreateDto createDto) {
        return LearningSession.builder()
                .sessionId(sessionId)
                .userId(createDto.getUserId())
                .sessionType(createDto.getSessionType())
                .sessionMetadata(createDto.getSessionMetadata())
                .status(SessionStatus.STARTED)
                .startedAt(LocalDateTime.now())
                .totalQuestions(createDto.getQuestionIds() != null ? createDto.getQuestionIds().size() : 0)
                .build();
    }
    
    private void attachQuestionsToSession(String sessionId, List<String> questionIds) {
        if (questionIds != null && !questionIds.isEmpty()) {
            sessionQuestionService.createSessionQuestions(sessionId, questionIds);
        }
    }
    
    private LearningSession findSessionByIdOrThrow(String sessionId) {
        return learningSessionRepository.findById(sessionId)
                .orElseThrow(() -> new EntityNotFoundException("Learning Session", sessionId));
    }
    
    private void updateSessionFromDto(LearningSession session, LearningSessionUpdateDto updateDto) {
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
    }
    
    private void calculateAndSetProgressPercentage(LearningSession session) {
        if (session.getTotalQuestions() != null && session.getTotalQuestions() > 0) {
            double progressPercentage = (double) session.getAnsweredQuestions() / session.getTotalQuestions() * 100.0;
            session.setProgressPercentage(progressPercentage);
        }
    }
    
    private void updateSessionStats(LearningSession session, boolean isCorrect) {
        session.setAnsweredQuestions(session.getAnsweredQuestions() + 1);
        
        if (isCorrect) {
            session.setCorrectAnswers(session.getCorrectAnswers() + 1);
        } else {
            session.setWrongAnswers(session.getWrongAnswers() + 1);
        }
    }

    /**
     * Extract session metadata from JSON string
     */
    private SessionMetadata extractSessionMetadata(String sessionMetadata) {
        if (sessionMetadata == null || sessionMetadata.trim().isEmpty()) {
            return new SessionMetadata();
        }
        
        try {
            return objectMapper.readValue(sessionMetadata, SessionMetadata.class);
        } catch (JsonProcessingException e) {
            throw new IllegalArgumentException("Invalid session metadata format: " + sessionMetadata, e);
        }
    }

    /**
     * Map frontend level string to integer
     * Frontend sends: A (초급), B (중급), C (상급)
     * Backend uses: 1 (초급), 2 (중급), 3 (상급)
     */
    private Integer mapLevelToInteger(String level) {
        if (level == null || level.trim().isEmpty()) {
            return 1; // Default to beginner
        }
        
        switch (level.toUpperCase()) {
            case "A":
                return 1;
            case "B":
                return 2;
            case "C":
                return 3;
            default:
                return 1;
        }
    }

    /**
     * Select questions for practice session based on user level, categories, and keywords
     */
    private List<Question> selectQuestionsForPractice(String userId, List<String> categories, 
                                                     List<String> keywords, Integer userLevel, 
                                                     Integer questionCount) {
        
        // Get all questions matching user level and categories
        List<Question> categoryQuestions = new ArrayList<>();
        
        for (String category : categories) {
            List<Question> questionsForCategory = questionRepository.findByMajorCategoryAndDifficultyLevel(category, userLevel);
            
            // If keywords are specified, filter by subcategory (minor category)
            if (keywords != null && !keywords.isEmpty()) {
                questionsForCategory = questionsForCategory.stream()
                    .filter(q -> keywords.contains(q.getMinorCategory()))
                    .collect(Collectors.toList());
            }
            
            categoryQuestions.addAll(questionsForCategory);
        }

        // Remove questions the user has already solved
        List<String> solvedQuestionIds = getSolvedQuestionIds(userId);
        List<Question> unsolvedQuestions = categoryQuestions.stream()
            .filter(q -> !solvedQuestionIds.contains(q.getQuestionId()))
            .collect(Collectors.toList());

        // Select balanced questions from different types
        return selectBalancedQuestions(unsolvedQuestions, questionCount);
    }

    /**
     * Get list of question IDs that the user has already solved
     */
    private List<String> getSolvedQuestionIds(String userId) {
        List<LearningSession> userSessions = learningSessionRepository.findByUserId(userId);
        return userSessions.stream()
                .flatMap(session -> sessionQuestionService.getSessionQuestions(session.getSessionId()).stream())
                .map(SessionQuestion::getQuestionId)
                .distinct()
                .collect(Collectors.toList());
    }

    /**
     * Inner class to represent session metadata structure
     */
    private static class SessionMetadata {
        private List<String> categories;
        private List<String> keywords;
        private String level;
        private Integer questionCount;

        public SessionMetadata() {}

        public List<String> getCategories() { return categories; }
        public void setCategories(List<String> categories) { this.categories = categories; }

        public List<String> getKeywords() { return keywords; }
        public void setKeywords(List<String> keywords) { this.keywords = keywords; }

        public String getLevel() { return level; }
        public void setLevel(String level) { this.level = level; }

        public Integer getQuestionCount() { return questionCount; }
        public void setQuestionCount(Integer questionCount) { this.questionCount = questionCount; }
    }
}