package com.problemservice.ProblemService.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.problemservice.ProblemService.exception.EntityNotFoundException;
import com.problemservice.ProblemService.model.dto.SessionAnalysisResponseDto;
import com.problemservice.ProblemService.model.entity.KafkaEventLog;
import com.problemservice.ProblemService.model.entity.LearningSession;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.model.entity.QuestionAnswer;
import com.problemservice.ProblemService.repository.LearningSessionRepository;
import com.problemservice.ProblemService.repository.QuestionAnswerRepository;
import com.problemservice.ProblemService.repository.QuestionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class LearningSessionAnalysisService {

    private final LearningSessionRepository learningSessionRepository;
    private final QuestionAnswerRepository questionAnswerRepository;
    private final QuestionRepository questionRepository;
    private final KafkaEventLogService kafkaEventLogService;
    private final ObjectMapper objectMapper;

    /**
     * 학습 분석 서비스에서 요구하는 세션 데이터를 조회한다.
     */
    @Transactional(readOnly = true)
    public SessionAnalysisResponseDto getSessionAnalysisData(String sessionId, String userId) {
        LearningSession session = learningSessionRepository.findById(sessionId)
                .orElseThrow(() -> new EntityNotFoundException("Learning Session", sessionId));

        if (!session.getUserId().equals(userId)) {
            log.warn("Session user mismatch - requested userId: {}, session userId: {}", userId, session.getUserId());
            throw new EntityNotFoundException("Learning Session", sessionId);
        }

        List<QuestionAnswer> answers = questionAnswerRepository.findBySessionId(sessionId);
        List<KafkaEventLog> events = kafkaEventLogService.getSessionEvents(sessionId);

        return SessionAnalysisResponseDto.builder()
                .session(convertSession(session))
                .questions(convertQuestions(answers))
                .events(convertEvents(events, session))
                .build();
    }

    private SessionAnalysisResponseDto.SessionInfo convertSession(LearningSession session) {
        return SessionAnalysisResponseDto.SessionInfo.builder()
                .sessionId(session.getSessionId())
                .userId(session.getUserId())
                .sessionType(session.getSessionType())
                .status(session.getStatus())
                .startedAt(session.getStartedAt())
                .completedAt(session.getCompletedAt())
                .createdAt(session.getCreatedAt())
                .updatedAt(session.getUpdatedAt())
                .metadata(parseJsonToMap(session.getSessionMetadata()))
                .build();
    }

    private List<SessionAnalysisResponseDto.QuestionRecord> convertQuestions(List<QuestionAnswer> answers) {
        return answers.stream()
                .map(this::buildQuestionRecord)
                .collect(Collectors.toList());
    }

    private SessionAnalysisResponseDto.QuestionRecord buildQuestionRecord(QuestionAnswer answer) {
        Question question = answer.getQuestion();
        if (question == null) {
            question = questionRepository.findById(answer.getQuestionId()).orElse(null);
        }

        return SessionAnalysisResponseDto.QuestionRecord.builder()
                .questionId(answer.getQuestionId())
                .questionType(question != null ? question.getQuestionType() : null)
                .majorCategory(question != null ? question.getMajorCategory() : null)
                .minorCategory(question != null ? question.getMinorCategory() : null)
                .difficultyLevel(question != null ? question.getDifficultyLevel() : null)
                .userAnswer(answer.getUserAnswer())
                .isCorrect(answer.getIsCorrect())
                .timeSpent(answer.getTimeSpent())
                .answeredAt(answer.getAnsweredAt())
                .solveCount(answer.getSolveCount())
                .metadata(buildQuestionMetadata(question))
                .build();
    }

    private Map<String, Object> buildQuestionMetadata(Question question) {
        if (question == null) {
            return Collections.emptyMap();
        }
        Map<String, Object> metadata = new LinkedHashMap<>();
        metadata.put("questionText", question.getQuestionText());
        metadata.put("optionA", question.getOptionA());
        metadata.put("optionB", question.getOptionB());
        metadata.put("optionC", question.getOptionC());
        metadata.put("explanation", question.getExplanation());
        return metadata;
    }

    private List<SessionAnalysisResponseDto.EventRecord> convertEvents(List<KafkaEventLog> events,
                                                                      LearningSession session) {
        return events.stream()
                .map(event -> SessionAnalysisResponseDto.EventRecord.builder()
                        .eventId(event.getEventId())
                        .eventType(event.getEventType())
                        .sessionId(event.getSessionId())
                        .userId(event.getUserId())
                        .sessionType(session.getSessionType().name())
                        .createdAt(event.getEventTimestamp() != null ? event.getEventTimestamp() : event.getReceivedAt())
                        .metadata(parseJsonToMap(event.getEventPayload()))
                        .build())
                .collect(Collectors.toList());
    }

    private Map<String, Object> parseJsonToMap(String json) {
        if (json == null || json.trim().isEmpty()) {
            return Collections.emptyMap();
        }
        try {
            return objectMapper.readValue(json, new TypeReference<Map<String, Object>>() {});
        } catch (IOException e) {
            log.warn("Failed to parse JSON metadata: {}", e.getMessage());
            return Collections.emptyMap();
        }
    }
}

