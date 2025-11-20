package com.problemservice.ProblemService.controller;

import com.problemservice.ProblemService.model.dto.AddQuestionRequestDto;
import com.problemservice.ProblemService.model.dto.LearningSessionCreateDto;
import com.problemservice.ProblemService.model.dto.LearningSessionResponseDto;
import com.problemservice.ProblemService.model.dto.LearningSessionUpdateDto;
import com.problemservice.ProblemService.model.dto.QuestionAnswerCreateDto;
import com.problemservice.ProblemService.model.dto.SessionAnswerRequestDto;
import com.problemservice.ProblemService.model.dto.SessionQuestionResponseDto;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionStatus;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionType;
import com.problemservice.ProblemService.service.LearningSessionService;
import com.problemservice.ProblemService.service.QuestionAnswerService;
import com.problemservice.ProblemService.service.SessionQuestionService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 학습 세션 REST API 컨트롤러
 * 세션 CRUD, 진행 상황 관리, 통계 조회 기능 제공
 */
@RestController
@RequestMapping("/problem/learning-sessions")
@RequiredArgsConstructor
public class LearningSessionController {

    private final LearningSessionService learningSessionService;
    private final SessionQuestionService sessionQuestionService;
    private final QuestionAnswerService questionAnswerService;

    /**
     * 새로운 학습 세션을 생성하고 문제를 할당
     * sessionType에 따라 적절한 세션 생성 로직을 자동으로 선택합니다.
     * 
     * @param createDto 세션 생성 요청 데이터 (사용자 ID, 세션 타입, 메타데이터 포함)
     *                  - sessionType: PRACTICE (연습), REVIEW (복습), WRONG_ANSWER (오답노트)
     * @return 201 CREATED - 생성된 세션 정보와 할당된 문제 수
     */
    @PostMapping
    public ResponseEntity<LearningSessionResponseDto> createLearningSession(@Valid @RequestBody LearningSessionCreateDto createDto) {
        LearningSessionResponseDto createdSession;
        
        // sessionType에 따라 적절한 생성 메서드 호출
        switch (createDto.getSessionType()) {
            case PRACTICE:
                createdSession = learningSessionService.createPracticeSession(createDto);
                break;
            case REVIEW:
                createdSession = learningSessionService.createReviewSession(createDto);
                break;
            case WRONG_ANSWER:
                createdSession = learningSessionService.createWrongAnswerSession(createDto);
                break;
            default:
                // 기본적으로 일반 생성 메서드 사용
                createdSession = learningSessionService.createLearningSession(createDto);
                break;
        }
        
        return ResponseEntity.status(HttpStatus.CREATED).body(createdSession);
    }

    /**
     * 인증된 사용자의 모든 학습 세션 목록을 조회
     * @param authentication Spring Security 인증 정보
     * @param pageable 페이징 정보
     * @return 200 OK - 사용자의 세션 목록 (페이징 처리됨)
     */
    @GetMapping
    public ResponseEntity<Page<LearningSessionResponseDto>> getMyLearningSessions(
            Authentication authentication,
            Pageable pageable) {
        String userId = (String) authentication.getPrincipal();
        Page<LearningSessionResponseDto> sessions = learningSessionService.getAllLearningSessionsByUserId(userId, pageable);
        return ResponseEntity.ok(sessions);
    }

    /**
     * 특정 세션의 상세 정보를 조회
     * @param sessionId 조회할 세션의 고유 식별자
     * @return 200 OK - 세션 상태, 진행률, 연결된 문제 수 등 상세 정보
     */
    @GetMapping("/{sessionId}")
    public ResponseEntity<LearningSessionResponseDto> getLearningSessionById(@PathVariable String sessionId) {
        LearningSessionResponseDto session = learningSessionService.getLearningSessionById(sessionId);
        return ResponseEntity.ok(session);
    }

    /**
     * 특정 사용자의 학습 세션을 조회합니다 (Query Parameter로 필터링 지원)
     * 
     * @param userId 조회할 사용자의 고유 식별자
     * @param status 세션 상태로 필터링 (선택)
     * @param sessionType 세션 타입으로 필터링 (선택)
     * @param startDate 조회 시작 날짜 (ISO 8601 형식, 선택)
     * @param endDate 조회 종료 날짜 (ISO 8601 형식, 선택)
     * @param pageable 페이지 설정 (페이지 번호, 크기, 정렬 순서)
     * @return 필터링된 세션 목록
     */
    @GetMapping("/user/{userId}")
    public ResponseEntity<?> getLearningSessionsByUserId(
            @PathVariable String userId,
            @RequestParam(required = false) SessionStatus status,
            @RequestParam(required = false) SessionType sessionType,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime startDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime endDate,
            Pageable pageable) {
        
        // 필터링 조건에 따라 적절한 서비스 메서드 호출
        if (status != null && sessionType != null) {
            // 상태 + 타입 조합은 지원하지 않음 (하나만 사용)
            List<LearningSessionResponseDto> sessions = learningSessionService.getLearningSessionsByUserIdAndStatus(userId, status);
            return ResponseEntity.ok(sessions);
        } else if (status != null) {
            // 상태만
            List<LearningSessionResponseDto> sessions = learningSessionService.getLearningSessionsByUserIdAndStatus(userId, status);
            return ResponseEntity.ok(sessions);
        } else if (sessionType != null) {
            // 타입만
            List<LearningSessionResponseDto> sessions = learningSessionService.getLearningSessionsByUserIdAndType(userId, sessionType);
            return ResponseEntity.ok(sessions);
        } else if (startDate != null && endDate != null) {
            // 날짜 범위
            List<LearningSessionResponseDto> sessions = learningSessionService.getLearningSessionsByDateRange(userId, startDate, endDate);
            return ResponseEntity.ok(sessions);
        } else {
            // 필터 없음 - 전체 조회 (페이지네이션)
            Page<LearningSessionResponseDto> sessions = learningSessionService.getAllLearningSessionsByUserId(userId, pageable);
            return ResponseEntity.ok(sessions);
        }
    }

    /**
     * 학습 세션을 업데이트합니다
     * 
     * @param sessionId 업데이트할 학습 세션의 고유 식별자
     * @param updateDto 업데이트할 데이터
     * @return 업데이트된 학습 세션 정보
     */
    @PutMapping("/{sessionId}")
    public ResponseEntity<LearningSessionResponseDto> updateLearningSession(
            @PathVariable String sessionId,
            @Valid @RequestBody LearningSessionUpdateDto updateDto) {
        // 1. 세션 ID와 검증된 업데이트 데이터로 기존 학습 세션 정보 수정
        LearningSessionResponseDto updatedSession = learningSessionService.updateLearningSession(sessionId, updateDto);
        // 2. HTTP 200 OK 상태와 함께 업데이트된 세션 정보 반환
        return ResponseEntity.ok(updatedSession);
    }

    /**
     * 학습 세션을 삭제합니다
     * 
     * @param sessionId 삭제할 학습 세션의 고유 식별자
     * @return 삭제 완료 응답
     */
    @DeleteMapping("/{sessionId}")
    public ResponseEntity<Void> deleteLearningSession(@PathVariable String sessionId) {
        // 1. 세션 ID로 해당 학습 세션을 데이터베이스에서 삭제
        learningSessionService.deleteLearningSession(sessionId);
        // 2. HTTP 204 No Content 상태 반환 (삭제 성공, 반환할 내용 없음)
        return ResponseEntity.noContent().build();
    }


    /**
     * 학습 세션의 상태를 업데이트합니다 (RESTful 방식)
     * 
     * @param sessionId 업데이트할 학습 세션의 고유 식별자
     * @param updateDto 세션 상태 업데이트 데이터
     *                  - status: "IN_PROGRESS" (시작), "COMPLETED" (완료) 등
     * @return 업데이트된 학습 세션 정보
     */
    @PatchMapping("/{sessionId}")
    public ResponseEntity<LearningSessionResponseDto> updateSessionStatus(
            @PathVariable String sessionId,
            @Valid @RequestBody LearningSessionUpdateDto updateDto) {
        LearningSessionResponseDto session;
        
        // status에 따라 적절한 서비스 메서드 호출
        if (updateDto.getStatus() != null) {
            switch (updateDto.getStatus()) {
                case IN_PROGRESS:
                    // 세션 시작
                    session = learningSessionService.startSession(sessionId);
                    break;
                case COMPLETED:
                    // 세션 완료
                    session = learningSessionService.completeSession(sessionId);
                    break;
                default:
                    // 기타 상태 업데이트는 일반 업데이트 메서드 사용
                    session = learningSessionService.updateLearningSession(sessionId, updateDto);
                    break;
            }
        } else {
            // status가 없으면 일반 업데이트
            session = learningSessionService.updateLearningSession(sessionId, updateDto);
        }
        
        return ResponseEntity.ok(session);
    }

    /**
     * 세션에 답변을 제출합니다 (답변 리소스 생성)
     * 
     * 1. question_answer 테이블에 답변 기록 저장
     * 2. learning_sessions 테이블의 통계 업데이트
     * 
     * @param sessionId 답변을 제출할 학습 세션의 고유 식별자
     * @param answerDto 답변 데이터 (questionId, userAnswer, isCorrect, timeSpent, solveCount)
     * 
     * Request Body 예시:
     * {
     *   "questionId": "business-customer-service-conversation-A-1",
     *   "userAnswer": "A",
     *   "isCorrect": true,
     *   "timeSpent": 35,
     *   "solveCount": 1
     * }
     * @return 업데이트된 세션 정보 (201 Created)
     */
    @PostMapping("/{sessionId}/answers")
    public ResponseEntity<LearningSessionResponseDto> submitAnswer(
            @PathVariable String sessionId,
            @Valid @RequestBody SessionAnswerRequestDto answerDto) {
        
        // 1. 세션 정보 조회 (userId와 sessionType 필요)
        LearningSessionResponseDto sessionInfo = learningSessionService.getLearningSessionById(sessionId);
        
        // 2. QuestionAnswer 생성 (question_answer 테이블에 저장)
        QuestionAnswerCreateDto questionAnswerDto = QuestionAnswerCreateDto.builder()
                .sessionId(sessionId)
                .questionId(answerDto.getQuestionId())
                .sessionType(sessionInfo.getSessionType().name())
                .userAnswer(answerDto.getUserAnswer())
                .isCorrect(answerDto.getIsCorrect())
                .timeSpent(answerDto.getTimeSpent())
                .solveCount(answerDto.getSolveCount() != null ? answerDto.getSolveCount() : 1)
                .build();
        
        questionAnswerService.createQuestionAnswer(questionAnswerDto, sessionInfo.getUserId());
        
        // 3. 세션 통계 업데이트 (learning_sessions 테이블)
        LearningSessionResponseDto session = learningSessionService.updateSessionProgress(
                sessionId, 
                answerDto.getIsCorrect()
        );
        
        // 답변 리소스 생성이므로 201 Created 반환
        return ResponseEntity.status(HttpStatus.CREATED).body(session);
    }

    /**
     * 특정 학습 세션에 포함된 모든 문제를 순서대로 조회합니다
     * 
     * @param sessionId 조회할 학습 세션의 고유 식별자
     * @return 문제 순서대로 정렬된 세션-문제 DTO 목록
     */
    @GetMapping("/{sessionId}/questions")
    public ResponseEntity<List<SessionQuestionResponseDto>> getSessionQuestions(@PathVariable String sessionId) {
        // 1. 세션 ID로 해당 학습 세션에 포함된 모든 문제들을 순서대로 조회하고 DTO로 변환
        List<SessionQuestionResponseDto> sessionQuestions = sessionQuestionService.getSessionQuestionsAsDto(sessionId);
        // 2. HTTP 200 OK 상태와 함께 세션-문제 DTO 목록 반환
        return ResponseEntity.ok(sessionQuestions);
    }

    /**
     * 기존 학습 세션에 새로운 문제를 추가합니다
     * 
     * @param sessionId 문제를 추가할 학습 세션의 고유 식별자
     * @param requestDto 추가할 문제 데이터
     * @return 문제 추가 완료 응답
     */
    @PostMapping("/{sessionId}/questions")
    public ResponseEntity<Void> addQuestionToSession(
            @PathVariable String sessionId,
            @Valid @RequestBody AddQuestionRequestDto requestDto) {
        // 기존 학습 세션에 새로운 문제 추가
        learningSessionService.addQuestionToSession(sessionId, requestDto.getQuestionId());
        // HTTP 201 Created 상태 반환 (문제 추가 성공)
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    /**
     * 특정 사용자의 특정 상태에 해당하는 학습 세션 수를 조회합니다
     * 
     * @param userId 조회할 사용자의 고유 식별자
     * @param status 필터링할 세션 상태
     * @return 해당 상태의 학습 세션 수
     */
    @GetMapping("/user/{userId}/count")
    public ResponseEntity<Long> getSessionCountByUserId(
            @PathVariable String userId,
            @RequestParam(required = false) SessionStatus status) {
        if (status != null) {
            Long count = learningSessionService.getSessionCountByUserIdAndStatus(userId, status);
            return ResponseEntity.ok(count);
        } else {
            // 전체 세션 수는 getAllLearningSessionsByUserId의 totalElements로 제공 가능
            Page<LearningSessionResponseDto> sessions = learningSessionService.getAllLearningSessionsByUserId(userId, org.springframework.data.domain.PageRequest.of(0, 1));
            return ResponseEntity.ok(sessions.getTotalElements());
        }
    }

    /**
     * 특정 사용자의 완료된 학습 세션들의 평균 진행률을 조회합니다
     * 
     * @param userId 조회할 사용자의 고유 식별자
     * @return 완료된 세션들의 평균 진행률
     */
    @GetMapping("/user/{userId}/statistics/average-progress")
    public ResponseEntity<Double> getAverageProgressByUserId(@PathVariable String userId) {
        // 1. 사용자 ID로 해당 사용자의 완료된 세션들의 평균 진행률 계산
        Double averageProgress = learningSessionService.getAverageProgressByUserId(userId);
        // 2. HTTP 200 OK 상태와 함께 평균 진행률 반환 (null인 경우 0.0으로 처리)
        return ResponseEntity.ok(averageProgress != null ? averageProgress : 0.0);
    }

}