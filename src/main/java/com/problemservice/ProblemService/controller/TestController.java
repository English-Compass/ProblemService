package com.problemservice.ProblemService.controller;

import com.problemservice.ProblemService.model.dto.LearningSessionCreateDto;
import com.problemservice.ProblemService.model.dto.LearningSessionResponseDto;
import com.problemservice.ProblemService.model.dto.QuestionAnswerCreateDto;
import com.problemservice.ProblemService.model.dto.QuestionAnswerResponseDto;
import com.problemservice.ProblemService.model.dto.QuestionCreateDto;
import com.problemservice.ProblemService.model.dto.QuestionResponseDto;
import com.problemservice.ProblemService.model.dto.SessionQuestionResponseDto;
import com.problemservice.ProblemService.model.entity.LearningSession.SessionType;
import com.problemservice.ProblemService.model.enums.Difficulty;
import com.problemservice.ProblemService.model.enums.QuestionType;
import com.problemservice.ProblemService.service.LearningSessionService;
import com.problemservice.ProblemService.service.QuestionAnswerService;
import com.problemservice.ProblemService.service.QuestionService;
import com.problemservice.ProblemService.service.SessionQuestionService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 테스트용 컨트롤러
 * 카카오 로그인 없이 테스트 사용자로 시스템을 테스트할 수 있는 API 제공
 */
@RestController
@RequestMapping("/api/test")
@RequiredArgsConstructor
public class TestController {

    private final QuestionService questionService;
    private final LearningSessionService learningSessionService;
    private final SessionQuestionService sessionQuestionService;
    private final QuestionAnswerService questionAnswerService;

    /**
     * 테스트용 문제들을 생성합니다
     */
    @PostMapping("/setup-questions")
    public ResponseEntity<Map<String, Object>> setupTestQuestions() {
        try {
            List<QuestionCreateDto> testQuestions = Arrays.asList(
                QuestionCreateDto.builder()
                    .questionId("test_q_" + UUID.randomUUID().toString().substring(0, 8))
                    .questionText("다음 빈칸에 들어갈 적절한 단어는 무엇입니까? 'I need to _____ my presentation before the meeting.'")
                    .questionType(QuestionType.WORD.name())
                    .majorCategory("비즈니스")
                    .minorCategory("업무")
                    .difficultyLevel(Difficulty.B.getLevel())
                    .optionA("complete")
                    .optionB("delete")
                    .optionC("ignore")
                    .correctAnswer("A")
                    .explanation("'complete'는 '완성하다'라는 의미로 프레젠테이션을 회의 전에 완성해야 한다는 맥락에 가장 적합합니다.")
                    .build(),
                
                QuestionCreateDto.builder()
                    .questionId("test_q_" + UUID.randomUUID().toString().substring(0, 8))
                    .questionText("'Accomplish'과 가장 유사한 의미의 단어는?")
                    .questionType(QuestionType.SENTENCE.name())
                    .majorCategory("학업")
                    .minorCategory("어휘")
                    .difficultyLevel(Difficulty.A.getLevel())
                    .optionA("achieve")
                    .optionB("prevent")
                    .optionC("abandon")
                    .correctAnswer("A")
                    .explanation("'accomplish'과 'achieve'는 모두 '성취하다, 달성하다'라는 의미입니다.")
                    .build(),

                QuestionCreateDto.builder()
                    .questionId("test_q_" + UUID.randomUUID().toString().substring(0, 8))
                    .questionText("다음 문장에서 틀린 부분은? 'She don't like coffee in the morning.'")
                    .questionType(QuestionType.WORD.name())
                    .majorCategory("일상생활")
                    .minorCategory("문법")
                    .difficultyLevel(Difficulty.A.getLevel())
                    .optionA("She")
                    .optionB("don't")
                    .optionC("like")
                    .correctAnswer("B")
                    .explanation("3인칭 단수 주어 'She'에는 'doesn't'를 사용해야 합니다.")
                    .build(),

                QuestionCreateDto.builder()
                    .questionId("test_q_" + UUID.randomUUID().toString().substring(0, 8))
                    .questionText("'Innovative'의 반대말로 가장 적절한 것은?")
                    .questionType(QuestionType.SENTENCE.name())
                    .majorCategory("비즈니스")
                    .minorCategory("어휘")
                    .difficultyLevel(Difficulty.C.getLevel())
                    .optionA("traditional")
                    .optionB("creative")
                    .optionC("modern")
                    .correctAnswer("A")
                    .explanation("'innovative'(혁신적인)의 반대는 'traditional'(전통적인)입니다.")
                    .build(),

                QuestionCreateDto.builder()
                    .questionId("test_q_" + UUID.randomUUID().toString().substring(0, 8))
                    .questionText("여행에서 길을 물어볼 때 사용하는 표현으로 가장 자연스러운 것은?")
                    .questionType(QuestionType.SENTENCE.name())
                    .majorCategory("여행")
                    .minorCategory("회화")
                    .difficultyLevel(Difficulty.B.getLevel())
                    .optionA("Where is the station?")
                    .optionB("Station where?")
                    .optionC("The station is where?")
                    .correctAnswer("A")
                    .explanation("'Where is + 명사?'는 위치를 묻는 가장 기본적이고 자연스러운 표현입니다.")
                    .build()
            );

            List<String> createdQuestionIds = testQuestions.stream()
                .map(dto -> {
                    try {
                        return questionService.createQuestion(dto).getQuestionId();
                    } catch (Exception e) {
                        return null;
                    }
                })
                .filter(id -> id != null)
                .toList();

            Map<String, Object> response = new HashMap<>();
            response.put("message", "테스트 문제 생성 완료");
            response.put("createdQuestions", createdQuestionIds.size());
            response.put("questionIds", createdQuestionIds);

            return ResponseEntity.ok(response);

        } catch (Exception e) {
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("error", "테스트 문제 생성 실패: " + e.getMessage());
            return ResponseEntity.internalServerError().body(errorResponse);
        }
    }

    /**
     * 테스트용 연습 세션을 생성합니다
     */
    @PostMapping("/create-practice-session/{userId}")
    public ResponseEntity<LearningSessionResponseDto> createTestPracticeSession(@PathVariable String userId) {
        try {
            // Create metadata JSON string
            Map<String, Object> metadata = new HashMap<>();
            metadata.put("categories", Arrays.asList("비즈니스", "학업", "일상생활"));
            metadata.put("questionCount", 3);
            metadata.put("level", "intermediate");
            
            String metadataJson = new com.fasterxml.jackson.databind.ObjectMapper().writeValueAsString(metadata);
            
            LearningSessionCreateDto createDto = LearningSessionCreateDto.builder()
                .userId(userId)
                .sessionType(SessionType.PRACTICE)
                .sessionMetadata(metadataJson)
                .build();

            LearningSessionResponseDto session = learningSessionService.createPracticeSession(createDto);
            return ResponseEntity.ok(session);
        } catch (Exception e) {
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("error", "연습 세션 생성 실패: " + e.getMessage());
            return ResponseEntity.internalServerError().body(null);
        }
    }

    /**
     * 테스트용 복습 세션을 생성합니다
     */
    @PostMapping("/create-review-session/{userId}")
    public ResponseEntity<LearningSessionResponseDto> createTestReviewSession(@PathVariable String userId) {
        try {
            // Create metadata JSON string
            Map<String, Object> metadata = new HashMap<>();
            metadata.put("categories", Arrays.asList("비즈니스", "학업"));
            metadata.put("questionCount", 2);
            metadata.put("level", "intermediate");
            
            String metadataJson = new com.fasterxml.jackson.databind.ObjectMapper().writeValueAsString(metadata);
            
            LearningSessionCreateDto createDto = LearningSessionCreateDto.builder()
                .userId(userId)
                .sessionType(SessionType.REVIEW)
                .sessionMetadata(metadataJson)
                .build();

            LearningSessionResponseDto session = learningSessionService.createReviewSession(createDto);
            return ResponseEntity.ok(session);
        } catch (Exception e) {
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("error", "복습 세션 생성 실패: " + e.getMessage());
            return ResponseEntity.internalServerError().body(null);
        }
    }

    /**
     * 테스트용 오답노트 세션을 생성합니다
     */
    @PostMapping("/create-wrong-answer-session/{userId}")
    public ResponseEntity<LearningSessionResponseDto> createTestWrongAnswerSession(@PathVariable String userId) {
        try {
            // Create metadata JSON string
            Map<String, Object> metadata = new HashMap<>();
            metadata.put("categories", Arrays.asList("비즈니스", "일상생활"));
            metadata.put("questionCount", 2);
            metadata.put("level", "beginner");
            
            String metadataJson = new com.fasterxml.jackson.databind.ObjectMapper().writeValueAsString(metadata);
            
            LearningSessionCreateDto createDto = LearningSessionCreateDto.builder()
                .userId(userId)
                .sessionType(SessionType.WRONG_ANSWER)
                .sessionMetadata(metadataJson)
                .build();

            LearningSessionResponseDto session = learningSessionService.createWrongAnswerSession(createDto);
            return ResponseEntity.ok(session);
        } catch (Exception e) {
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("error", "오답노트 세션 생성 실패: " + e.getMessage());
            return ResponseEntity.internalServerError().body(null);
        }
    }

    /**
     * 세션의 문제들을 조회합니다
     */
    @GetMapping("/session/{sessionId}/questions")
    public ResponseEntity<List<SessionQuestionResponseDto>> getSessionQuestions(@PathVariable String sessionId) {
        List<SessionQuestionResponseDto> questions = sessionQuestionService.getSessionQuestionsAsDto(sessionId);
        return ResponseEntity.ok(questions);
    }

    /**
     * 테스트용으로 문제에 답변을 제출합니다
     */
    @PostMapping("/submit-answer")
    public ResponseEntity<Map<String, Object>> submitTestAnswer(
        @RequestParam String sessionId,
        @RequestParam String questionId,
        @RequestParam String userAnswer,
        @RequestParam String userId) {
        
        try {
            // 답변 생성
            QuestionAnswerCreateDto answerDto = QuestionAnswerCreateDto.builder()
                .questionId(questionId)
                .userAnswer(userAnswer)
                .sessionId(sessionId)
                .sessionType("PRACTICE")
                .isCorrect(true) // 서비스에서 실제 정답과 비교하여 재계산됨
                .build();

            QuestionAnswerResponseDto answerResponse = questionAnswerService.createQuestionAnswer(answerDto, userId);

            // 세션 진행률 업데이트
            Map<String, Boolean> progressData = new HashMap<>();
            progressData.put("isCorrect", answerResponse.getIsCorrect());
            
            LearningSessionResponseDto updatedSession = learningSessionService.updateSessionProgress(sessionId, answerResponse.getIsCorrect());

            Map<String, Object> response = new HashMap<>();
            response.put("answer", answerResponse);
            response.put("session", updatedSession);
            response.put("isCorrect", answerResponse.getIsCorrect());

            return ResponseEntity.ok(response);

        } catch (Exception e) {
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("error", "답변 제출 실패: " + e.getMessage());
            return ResponseEntity.internalServerError().body(errorResponse);
        }
    }

    /**
     * 테스트용 사용자 생성 (단순히 UUID 생성)
     */
    @PostMapping("/create-user")
    public ResponseEntity<Map<String, String>> createTestUser(@RequestParam(required = false) String userName) {
        String userId = "test_user_" + UUID.randomUUID().toString().substring(0, 8);
        
        Map<String, String> response = new HashMap<>();
        response.put("userId", userId);
        response.put("userName", userName != null ? userName : "테스트 사용자");
        response.put("message", "테스트 사용자가 생성되었습니다. 이 userId로 세션을 만들고 문제를 풀어보세요.");

        return ResponseEntity.ok(response);
    }

    /**
     * 사용자의 모든 세션 조회
     */
    @GetMapping("/user/{userId}/sessions")
    public ResponseEntity<Map<String, Object>> getUserSessions(@PathVariable String userId) {
        try {
            Map<String, Object> response = new HashMap<>();
            
            // 각 타입별 세션 조회
            List<LearningSessionResponseDto> practiceSessions = learningSessionService.getLearningSessionsByUserIdAndType(userId, SessionType.PRACTICE);
            List<LearningSessionResponseDto> reviewSessions = learningSessionService.getLearningSessionsByUserIdAndType(userId, SessionType.REVIEW);
            List<LearningSessionResponseDto> wrongAnswerSessions = learningSessionService.getLearningSessionsByUserIdAndType(userId, SessionType.WRONG_ANSWER);

            response.put("practiceSessions", practiceSessions);
            response.put("reviewSessions", reviewSessions);
            response.put("wrongAnswerSessions", wrongAnswerSessions);
            response.put("totalSessions", practiceSessions.size() + reviewSessions.size() + wrongAnswerSessions.size());

            return ResponseEntity.ok(response);

        } catch (Exception e) {
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("error", "세션 조회 실패: " + e.getMessage());
            return ResponseEntity.internalServerError().body(errorResponse);
        }
    }

    /**
     * 테스트용 세션 완료
     */
    @PostMapping("/complete-session/{sessionId}")
    public ResponseEntity<LearningSessionResponseDto> completeTestSession(@PathVariable String sessionId) {
        LearningSessionResponseDto session = learningSessionService.completeSession(sessionId);
        return ResponseEntity.ok(session);
    }
}