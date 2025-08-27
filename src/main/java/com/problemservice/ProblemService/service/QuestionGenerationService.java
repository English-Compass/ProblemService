package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.dto.*;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.model.enums.Difficulty;
import com.problemservice.ProblemService.model.enums.QuestionType;
import com.problemservice.ProblemService.repository.QuestionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * OpenAI를 활용한 문제 생성 서비스
 * 세 가지 문제 유형(WORD, SENTENCE, CONVERSATION)에 대한 맞춤형 프롬프트로 문제 생성
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class QuestionGenerationService {
    
    private final OpenAIService openAIService;
    private final QuestionRepository questionRepository;
    
    /**
     * 요청에 따라 문제를 생성하고 응답 DTO를 반환
     * @param request 문제 생성 요청 정보
     * @return 생성된 문제들과 메타데이터를 포함한 응답
     */
    public QuestionGenerationResponseDto generateQuestions(QuestionGenerationRequestDto request) {
        long startTime = System.currentTimeMillis();
        
        log.info("문제 생성 시작 - 유형: {}, 난이도: {}, 개수: {}, 카테고리: {}", 
            request.getQuestionType(), request.getDifficulty(), 
            request.getQuestionCount(), request.getMajorCategory());
        
        List<GeneratedQuestionDto> generatedQuestions = new ArrayList<>();
        List<String> errorMessages = new ArrayList<>();
        int totalTokensUsed = 0;
        
        // 요청된 개수만큼 문제 생성
        for (int i = 0; i < request.getQuestionCount(); i++) {
            try {
                GeneratedQuestionDto question = generateSingleQuestion(request);
                if (question.isValid()) {
                    generatedQuestions.add(question);
                } else {
                    errorMessages.add("문제 " + (i + 1) + " 생성 실패: " + question.getErrorMessage());
                }
            } catch (Exception e) {
                log.error("문제 생성 중 오류 발생", e);
                errorMessages.add("문제 " + (i + 1) + " 생성 중 오류: " + e.getMessage());
            }
        }
        
        long processingTime = System.currentTimeMillis() - startTime;
        
        log.info("문제 생성 완료 - 성공: {}/{}, 소요시간: {}ms", 
            generatedQuestions.size(), request.getQuestionCount(), processingTime);
        
        return QuestionGenerationResponseDto.builder()
            .questions(generatedQuestions)
            .requestedCount(request.getQuestionCount())
            .successfullyGenerated(generatedQuestions.size())
            .failedCount(request.getQuestionCount() - generatedQuestions.size())
            .success(generatedQuestions.size() > 0)
            .errorMessages(errorMessages)
            .totalTokensUsed(totalTokensUsed)
            .generatedAt(LocalDateTime.now())
            .processingTimeMs(processingTime)
            .build();
    }
    
    /**
     * 단일 문제 생성
     * @param request 문제 생성 요청 정보
     * @return 생성된 문제 DTO
     */
    private GeneratedQuestionDto generateSingleQuestion(QuestionGenerationRequestDto request) {
        String prompt = buildPromptForQuestionType(request);
        
        OpenAIRequestDto openAIRequest = OpenAIRequestDto.builder()
            .prompt(prompt)
            .model("gpt-3.5-turbo")
            .maxTokens(500)
            .temperature(0.7)
            .build();
        
        OpenAIResponseDto response = openAIService.generateResponse(openAIRequest);
        
        if (!response.isSuccess()) {
            return GeneratedQuestionDto.builder()
                .isValid(false)
                .errorMessage(response.getErrorMessage())
                .generatedAt(LocalDateTime.now())
                .build();
        }
        
        return parseOpenAIResponse(response.getResponse(), request);
    }
    
    /**
     * 문제 유형별 프롬프트 생성
     * @param request 문제 생성 요청 정보
     * @return 문제 유형에 맞는 프롬프트
     */
    private String buildPromptForQuestionType(QuestionGenerationRequestDto request) {
        String difficultyDescription = getDifficultyDescription(request.getDifficulty());
        String topicsText = request.getTopics() != null && !request.getTopics().isEmpty() 
            ? String.join(", ", request.getTopics()) : request.getMajorCategory();
        
        switch (request.getQuestionType()) {
            case WORD:
                return buildWordQuestionPrompt(difficultyDescription, topicsText, request);
            case SENTENCE:
                return buildSentenceQuestionPrompt(difficultyDescription, topicsText, request);
            case CONVERSATION:
                return buildConversationQuestionPrompt(difficultyDescription, topicsText, request);
            default:
                throw new IllegalArgumentException("지원하지 않는 문제 유형: " + request.getQuestionType());
        }
    }
    
    /**
     * WORD 타입 문제 프롬프트 생성 (빈칸 채우기)
     */
    private String buildWordQuestionPrompt(String difficulty, String topics, QuestionGenerationRequestDto request) {
        return String.format(
            "다음 조건에 맞는 영어 학습 문제를 1개 생성해주세요:\n\n" +
            "【문제 유형】: 빈칸 채우기 (WORD)\n" +
            "【난이도】: %s\n" +
            "【주제/카테고리】: %s\n" +
            "【추가 컨텍스트】: %s\n\n" +
            "【요구사항】:\n" +
            "1. 문장에서 중요한 단어 하나를 빈칸(______)으로 만들어주세요\n" +
            "2. 빈칸에 들어갈 정답과 비슷하지만 틀린 선택지 2개를 포함해주세요\n" +
            "3. 선택지는 모두 같은 품사여야 합니다\n" +
            "4. 문제는 실용적이고 자연스러운 상황이어야 합니다\n\n" +
            "【응답 형식】: 다음 형식을 정확히 따라주세요\n" +
            "QUESTION: [빈칸이 포함된 영어 문장]\n" +
            "A: [선택지1]\n" +
            "B: [선택지2]\n" +
            "C: [선택지3]\n" +
            "ANSWER: [A, B, C 중 정답]\n" +
            "EXPLANATION: [정답 설명 (한국어)]",
            difficulty, topics, request.getAdditionalContext() != null ? request.getAdditionalContext() : "없음"
        );
    }
    
    /**
     * SENTENCE 타입 문제 프롬프트 생성 (동의어 찾기)
     */
    private String buildSentenceQuestionPrompt(String difficulty, String topics, QuestionGenerationRequestDto request) {
        return String.format(
            "다음 조건에 맞는 영어 학습 문제를 1개 생성해주세요:\n\n" +
            "【문제 유형】: 동의어 선택 (SENTENCE)\n" +
            "【난이도】: %s\n" +
            "【주제/카테고리】: %s\n" +
            "【추가 컨텍스트】: %s\n\n" +
            "【요구사항】:\n" +
            "1. 문장에서 한 단어나 구를 굵게 표시(**단어**)해주세요\n" +
            "2. 굵게 표시된 부분과 같은 의미의 동의어를 정답으로 하세요\n" +
            "3. 비슷하지만 의미가 다른 단어 2개를 오답으로 포함하세요\n" +
            "4. 문맥상 자연스럽고 의미가 명확한 문장을 만드세요\n\n" +
            "【응답 형식】: 다음 형식을 정확히 따라주세요\n" +
            "QUESTION: [굵은 글씨가 포함된 영어 문장]\n" +
            "A: [선택지1]\n" +
            "B: [선택지2]\n" +
            "C: [선택지3]\n" +
            "ANSWER: [A, B, C 중 정답]\n" +
            "EXPLANATION: [정답 설명 (한국어)]",
            difficulty, topics, request.getAdditionalContext() != null ? request.getAdditionalContext() : "없음"
        );
    }
    
    /**
     * CONVERSATION 타입 문제 프롬프트 생성 (대화 응답)
     */
    private String buildConversationQuestionPrompt(String difficulty, String topics, QuestionGenerationRequestDto request) {
        return String.format(
            "다음 조건에 맞는 영어 학습 문제를 1개 생성해주세요:\n\n" +
            "【문제 유형】: 대화 응답 (CONVERSATION)\n" +
            "【난이도】: %s\n" +
            "【주제/카테고리】: %s\n" +
            "【추가 컨텍스트】: %s\n\n" +
            "【요구사항】:\n" +
            "1. 일상적인 대화 상황을 제시해주세요\n" +
            "2. 상대방의 말에 가장 적절한 응답을 정답으로 하세요\n" +
            "3. 문법적으로는 맞지만 상황에 부적절한 응답 2개를 오답으로 포함하세요\n" +
            "4. 실제 대화에서 자주 사용되는 자연스러운 표현을 사용하세요\n\n" +
            "【응답 형식】: 다음 형식을 정확히 따라주세요\n" +
            "QUESTION: [상황 설명과 대화 문장]\n" +
            "A: [선택지1]\n" +
            "B: [선택지2]\n" +
            "C: [선택지3]\n" +
            "ANSWER: [A, B, C 중 정답]\n" +
            "EXPLANATION: [정답 설명 (한국어)]",
            difficulty, topics, request.getAdditionalContext() != null ? request.getAdditionalContext() : "없음"
        );
    }
    
    /**
     * 난이도별 설명 텍스트 반환
     */
    private String getDifficultyDescription(Difficulty difficulty) {
        switch (difficulty) {
            case A:
                return "초급 (기초 단어, 간단한 문장 구조)";
            case B:
                return "중급 (일반적인 어휘, 복합 문장)";
            case C:
                return "고급 (고급 어휘, 복잡한 문장 구조)";
            default:
                return "중급";
        }
    }
    
    /**
     * OpenAI 응답 파싱
     * @param response OpenAI 생성 텍스트
     * @param request 원래 요청 정보
     * @return 파싱된 문제 DTO
     */
    private GeneratedQuestionDto parseOpenAIResponse(String response, QuestionGenerationRequestDto request) {
        try {
            // 정규 표현식으로 응답 파싱
            Pattern questionPattern = Pattern.compile("QUESTION:\\s*(.+?)(?=\\n[A-C]:|\\nA:|$)", Pattern.DOTALL);
            Pattern optionAPattern = Pattern.compile("A:\\s*(.+?)(?=\\nB:|$)", Pattern.DOTALL);
            Pattern optionBPattern = Pattern.compile("B:\\s*(.+?)(?=\\nC:|$)", Pattern.DOTALL);
            Pattern optionCPattern = Pattern.compile("C:\\s*(.+?)(?=\\nANSWER:|$)", Pattern.DOTALL);
            Pattern answerPattern = Pattern.compile("ANSWER:\\s*([ABC])", Pattern.CASE_INSENSITIVE);
            Pattern explanationPattern = Pattern.compile("EXPLANATION:\\s*(.+)$", Pattern.DOTALL);
            
            String questionText = extractMatch(questionPattern, response);
            String optionA = extractMatch(optionAPattern, response);
            String optionB = extractMatch(optionBPattern, response);
            String optionC = extractMatch(optionCPattern, response);
            String answer = extractMatch(answerPattern, response);
            String explanation = extractMatch(explanationPattern, response);
            
            // 필수 필드 검증
            if (questionText == null || optionA == null || optionB == null || 
                optionC == null || answer == null) {
                return GeneratedQuestionDto.builder()
                    .isValid(false)
                    .errorMessage("OpenAI 응답 파싱 실패: 필수 필드 누락")
                    .generatedAt(LocalDateTime.now())
                    .build();
            }
            
            return GeneratedQuestionDto.builder()
                .questionText(questionText.trim())
                .optionA(optionA.trim())
                .optionB(optionB.trim())
                .optionC(optionC.trim())
                .correctAnswer(answer.trim().toUpperCase())
                .explanation(explanation != null ? explanation.trim() : "")
                .questionType(request.getQuestionType())
                .difficulty(request.getDifficulty())
                .majorCategory(request.getMajorCategory())
                .minorCategory(request.getMinorCategory())
                .isValid(true)
                .generatedAt(LocalDateTime.now())
                .build();
                
        } catch (Exception e) {
            log.error("OpenAI 응답 파싱 중 오류", e);
            return GeneratedQuestionDto.builder()
                .isValid(false)
                .errorMessage("응답 파싱 중 오류: " + e.getMessage())
                .generatedAt(LocalDateTime.now())
                .build();
        }
    }
    
    /**
     * 정규 표현식 매치 결과 추출
     */
    private String extractMatch(Pattern pattern, String text) {
        Matcher matcher = pattern.matcher(text);
        return matcher.find() ? matcher.group(1) : null;
    }
    
    /**
     * 생성된 문제를 데이터베이스에 저장
     * @param generatedQuestion 생성된 문제 DTO
     * @return 저장된 문제 엔티티
     */
    @Transactional
    public Question saveGeneratedQuestion(GeneratedQuestionDto generatedQuestion) {
        if (!generatedQuestion.isValid()) {
            throw new IllegalArgumentException("유효하지 않은 문제는 저장할 수 없습니다");
        }
        
        Question question = Question.builder()
            .questionId(UUID.randomUUID().toString())
            .questionText(generatedQuestion.getQuestionText())
            .optionA(generatedQuestion.getOptionA())
            .optionB(generatedQuestion.getOptionB())
            .optionC(generatedQuestion.getOptionC())
            .correctAnswer(generatedQuestion.getCorrectAnswer())
            .majorCategory(generatedQuestion.getMajorCategory())
            .minorCategory(generatedQuestion.getMinorCategory() != null ? 
                generatedQuestion.getMinorCategory() : generatedQuestion.getMajorCategory())
            .questionType(generatedQuestion.getQuestionType().name().toLowerCase())
            .explanation(generatedQuestion.getExplanation())
            .difficultyLevel(generatedQuestion.getDifficulty().getLevel())
            .build();
        
        return questionRepository.save(question);
    }
}