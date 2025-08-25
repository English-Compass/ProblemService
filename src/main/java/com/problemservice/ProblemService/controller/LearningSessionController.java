package com.problemservice.ProblemService.controller;

import com.problemservice.ProblemService.model.dto.LearningSessionCreateDto;
import com.problemservice.ProblemService.model.dto.LearningSessionResponseDto;
import com.problemservice.ProblemService.model.dto.LearningSessionUpdateDto;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionStatus;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionType;
import com.problemservice.ProblemService.model.entity.SessionQuestion;
import com.problemservice.ProblemService.service.LearningSessionService;
import com.problemservice.ProblemService.service.SessionQuestionService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


/**
 * 학습 세션 관리를 위한 REST API 컨트롤러
 * 학습 세션 생성, 조회, 수정, 삭제 및 진행 상황 관리 기능을 제공
 * 입력: 세션 생성/수정 DTO, 사용자 ID, 세션 상태/유형
 * 출력: 세션 응답 DTO, 페이징된 세션 목록, 통계 데이터
 */
@RestController
@RequestMapping("/api/learning-sessions")
@RequiredArgsConstructor
public class LearningSessionController {

    // 학습 세션 비즈니스 로직 서비스
    private final LearningSessionService learningSessionService;
    // 세션-문제 연관관계 관리 서비스
    private final SessionQuestionService sessionQuestionService;

    /**
     * 새로운 학습 세션을 생성합니다
     * 
     * @param createDto 학습 세션 생성 데이터
     * @return 생성된 학습 세션 정보
     */
    @PostMapping
    public ResponseEntity<LearningSessionResponseDto> createLearningSession(@Valid @RequestBody LearningSessionCreateDto createDto) {
        // 1. 발리데이션이 완료된 데이터로 새로운 학습 세션 생성
        LearningSessionResponseDto createdSession = learningSessionService.createLearningSession(createDto);
        // 2. HTTP 201 Created 상태와 함께 생성된 세션 정보 반환
        return ResponseEntity.status(HttpStatus.CREATED).body(createdSession);
    }

    /**
     * 세션 ID로 학습 세션을 조회합니다
     * 
     * @param sessionId 조회할 학습 세션의 고유 식별자
     * @return 학습 세션 정보
     */
    @GetMapping("/{sessionId}")
    public ResponseEntity<LearningSessionResponseDto> getLearningSessionById(@PathVariable String sessionId) {
        // 1. 세션 ID로 해당 학습 세션을 데이터베이스에서 조회
        LearningSessionResponseDto session = learningSessionService.getLearningSessionById(sessionId);
        // 2. HTTP 200 OK 상태와 함께 조회된 세션 정보 반환
        return ResponseEntity.ok(session);
    }

    /**
     * 특정 사용자의 모든 학습 세션을 페이지네이션을 지원하여 조회합니다
     * 
     * @param userId 조회할 사용자의 고유 식별자
     * @param pageable 페이지네이션 매개변수
     * @return 페이지네이션된 학습 세션 목록
     */
    @GetMapping("/user/{userId}")
    public ResponseEntity<Page<LearningSessionResponseDto>> getAllLearningSessionsByUserId(
            @PathVariable String userId,
            Pageable pageable) {
        // 1. 사용자 ID와 페이징 파라미터로 해당 사용자의 모든 세션 조회
        Page<LearningSessionResponseDto> sessions = learningSessionService.getAllLearningSessionsByUserId(userId, pageable);
        // 2. HTTP 200 OK 상태와 함께 페이징된 세션 목록 반환
        return ResponseEntity.ok(sessions);
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
     * 특정 사용자의 특정 상태에 해당하는 학습 세션들을 조회합니다
     * 
     * @param userId 조회할 사용자의 고유 식별자
     * @param status 필터링할 세션 상태
     * @return 지정된 상태의 학습 세션 목록
     */
    @GetMapping("/user/{userId}/status/{status}")
    public ResponseEntity<List<LearningSessionResponseDto>> getLearningSessionsByUserIdAndStatus(
            @PathVariable String userId,
            @PathVariable SessionStatus status) {
        // 1. 사용자 ID와 세션 상태로 필터링하여 해당하는 학습 세션들 조회
        List<LearningSessionResponseDto> sessions = learningSessionService.getLearningSessionsByUserIdAndStatus(userId, status);
        // 2. HTTP 200 OK 상태와 함께 조건에 맞는 세션 목록 반환
        return ResponseEntity.ok(sessions);
    }

    /**
     * 특정 사용자의 특정 유형에 해당하는 학습 세션들을 조회합니다
     * 
     * @param userId 조회할 사용자의 고유 식별자
     * @param sessionType 필터링할 세션 유형
     * @return 지정된 유형의 학습 세션 목록
     */
    @GetMapping("/user/{userId}/type/{sessionType}")
    public ResponseEntity<List<LearningSessionResponseDto>> getLearningSessionsByUserIdAndType(
            @PathVariable String userId,
            @PathVariable SessionType sessionType) {
        // 1. 사용자 ID와 세션 유형으로 필터링하여 해당하는 학습 세션들 조회
        List<LearningSessionResponseDto> sessions = learningSessionService.getLearningSessionsByUserIdAndType(userId, sessionType);
        // 2. HTTP 200 OK 상태와 함께 조건에 맞는 세션 목록 반환
        return ResponseEntity.ok(sessions);
    }

    /**
     * 학습 세션을 시작합니다
     * 
     * @param sessionId 시작할 학습 세션의 고유 식별자
     * @return 업데이트된 학습 세션 정보
     */
    @PostMapping("/{sessionId}/start")
    public ResponseEntity<LearningSessionResponseDto> startSession(@PathVariable String sessionId) {
        // 1. 세션 상태를 IN_PROGRESS로 변경하고 시작 시간 기록
        LearningSessionResponseDto session = learningSessionService.startSession(sessionId);
        // 2. HTTP 200 OK 상태와 함께 업데이트된 세션 정보 반환
        return ResponseEntity.ok(session);
    }

    /**
     * 학습 세션을 완료합니다
     * 
     * @param sessionId 완료할 학습 세션의 고유 식별자
     * @return 업데이트된 학습 세션 정보
     */
    @PostMapping("/{sessionId}/complete")
    public ResponseEntity<LearningSessionResponseDto> completeSession(@PathVariable String sessionId) {
        // 1. 세션 상태를 COMPLETED로 변경하고 진행률 계산 및 Kafka 이벤트 발행
        LearningSessionResponseDto session = learningSessionService.completeSession(sessionId);
        // 2. HTTP 200 OK 상태와 함께 업데이트된 세션 정보 반환
        return ResponseEntity.ok(session);
    }

    /**
     * 학습 세션의 진행 상황을 업데이트합니다 (답변 처리 후 호출)
     * 
     * @param sessionId 업데이트할 학습 세션의 고유 식별자
     * @param progressData 진행 상황 데이터 (isCorrect: 정답 여부)
     * @return 업데이트된 학습 세션 정보
     */
    @PostMapping("/{sessionId}/progress")
    public ResponseEntity<LearningSessionResponseDto> updateSessionProgress(
            @PathVariable String sessionId,
            @RequestBody Map<String, Boolean> progressData) {
        // 1. 요청 데이터에서 정답 여부 추출
        Boolean isCorrect = progressData.get("isCorrect");
        if (isCorrect == null) {
            // 2. 필수 필드가 누락된 경우 예외 발생
            throw new IllegalArgumentException("isCorrect field is required");
        }
        // 3. 답변 결과에 따라 세션의 진행률과 정답/오답 통계 업데이트
        LearningSessionResponseDto session = learningSessionService.updateSessionProgress(sessionId, isCorrect);
        // 4. HTTP 200 OK 상태와 함께 업데이트된 세션 정보 반환
        return ResponseEntity.ok(session);
    }

    /**
     * 특정 학습 세션에 포함된 모든 문제를 순서대로 조회합니다
     * 
     * @param sessionId 조회할 학습 세션의 고유 식별자
     * @return 문제 순서대로 정렬된 세션-문제 목록
     */
    @GetMapping("/{sessionId}/questions")
    public ResponseEntity<List<SessionQuestion>> getSessionQuestions(@PathVariable String sessionId) {
        // 1. 세션 ID로 해당 학습 세션에 포함된 모든 문제들을 순서대로 조회
        List<SessionQuestion> sessionQuestions = sessionQuestionService.getSessionQuestions(sessionId);
        // 2. HTTP 200 OK 상태와 함께 세션-문제 목록 반환
        return ResponseEntity.ok(sessionQuestions);
    }

    /**
     * 기존 학습 세션에 새로운 문제를 추가합니다
     * 
     * @param sessionId 문제를 추가할 학습 세션의 고유 식별자
     * @param questionData 추가할 문제 데이터 (questionId: 문제 ID)
     * @return 문제 추가 완료 응답
     */
    @PostMapping("/{sessionId}/questions")
    public ResponseEntity<Void> addQuestionToSession(
            @PathVariable String sessionId,
            @RequestBody Map<String, String> questionData) {
        // 1. 요청 데이터에서 문제 ID 추출
        String questionId = questionData.get("questionId");
        // 2. 문제 ID 유효성 검증 (필수 필드 체크)
        if (questionId == null || questionId.trim().isEmpty()) {
            throw new IllegalArgumentException("questionId field is required");
        }
        // 3. 기존 학습 세션에 새로운 문제 추가
        learningSessionService.addQuestionToSession(sessionId, questionId);
        // 4. HTTP 201 Created 상태 반환 (문제 추가 성공)
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    /**
     * 특정 사용자의 특정 상태에 해당하는 학습 세션 수를 조회합니다
     * 
     * @param userId 조회할 사용자의 고유 식별자
     * @param status 필터링할 세션 상태
     * @return 해당 상태의 학습 세션 수
     */
    @GetMapping("/user/{userId}/status/{status}/count")
    public ResponseEntity<Long> getSessionCountByUserIdAndStatus(
            @PathVariable String userId,
            @PathVariable SessionStatus status) {
        // 1. 사용자 ID와 세션 상태로 필터링하여 해당 세션들의 개수 조회
        Long count = learningSessionService.getSessionCountByUserIdAndStatus(userId, status);
        // 2. HTTP 200 OK 상태와 함께 세션 개수 반환
        return ResponseEntity.ok(count);
    }

    /**
     * 특정 사용자의 완료된 학습 세션들의 평균 진행률을 조회합니다
     * 
     * @param userId 조회할 사용자의 고유 식별자
     * @return 완료된 세션들의 평균 진행률
     */
    @GetMapping("/user/{userId}/average-progress")
    public ResponseEntity<Double> getAverageProgressByUserId(@PathVariable String userId) {
        // 1. 사용자 ID로 해당 사용자의 완료된 세션들의 평균 진행률 계산
        Double averageProgress = learningSessionService.getAverageProgressByUserId(userId);
        // 2. HTTP 200 OK 상태와 함께 평균 진행률 반환 (null인 경우 0.0으로 처리)
        return ResponseEntity.ok(averageProgress != null ? averageProgress : 0.0);
    }

    /**
     * 특정 사용자의 특정 기간 내 학습 세션들을 조회합니다
     * 
     * @param userId 조회할 사용자의 고유 식별자
     * @param startDate 조회 시작 날짜 (ISO 8601 형식: yyyy-MM-ddTHH:mm:ss)
     * @param endDate 조회 종료 날짜 (ISO 8601 형식: yyyy-MM-ddTHH:mm:ss)
     * @return 지정된 기간 내의 학습 세션 목록
     */
    @GetMapping("/user/{userId}/date-range")
    public ResponseEntity<List<LearningSessionResponseDto>> getLearningSessionsByDateRange(
            @PathVariable String userId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime endDate) {
        // 1. 사용자 ID와 시작/종료 날짜 범위로 해당 기간 내 학습 세션들 조회
        List<LearningSessionResponseDto> sessions = learningSessionService.getLearningSessionsByDateRange(userId, startDate, endDate);
        // 2. HTTP 200 OK 상태와 함께 지정된 기간 내 세션 목록 반환
        return ResponseEntity.ok(sessions);
    }

    /**
     * 일반 학습 세션을 생성합니다.
     * 
     * @param createDto 학습 세션 생성 데이터
     * @param selectedCategory 사용자가 선택한 문제 분류
     * @return 생성된 학습 세션 정보
     */
    @PostMapping("/practice")
    public ResponseEntity<LearningSessionResponseDto> createPracticeSession(@Valid @RequestBody LearningSessionCreateDto createDto) {
        // 1. 검증된 데이터로 연습용 학습 세션 생성
        LearningSessionResponseDto createdSession = learningSessionService.createPracticeSession(createDto);
        // 2. HTTP 201 Created 상태와 함께 생성된 연습 세션 정보 반환
        return ResponseEntity.status(HttpStatus.CREATED).body(createdSession);
    }

    /**
     * 복습 세션을 생성합니다.
     * 
     * @param createDto 학습 세션 생성 데이터
     * @return 생성된 학습 세션 정보
     */
    @PostMapping("/review")
    public ResponseEntity<LearningSessionResponseDto> createReviewSession(@Valid @RequestBody LearningSessionCreateDto createDto) {
        // 1. 복습 세션 생성 기능 미구현 상태
        return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).build();
    }

    /**
     * 오답 세션을 생성합니다.
     * 
     * @param createDto 학습 세션 생성 데이터
     * @return 생성된 학습 세션 정보
     */
    @PostMapping("/wrong-answer")
    public ResponseEntity<LearningSessionResponseDto> createWrongAnswerSession(@Valid @RequestBody LearningSessionCreateDto createDto) {
        // 1. 오답 세션 생성 기능 미구현 상태
        return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).build();
    }
}