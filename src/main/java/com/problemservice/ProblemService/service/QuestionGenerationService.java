package com.problemservice.ProblemService.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.problemservice.ProblemService.model.dto.*;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.model.enums.Difficulty;

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
    private final ObjectMapper objectMapper = new ObjectMapper();
    
    /**
     * 요청에 따라 문제를 생성하고 응답 DTO를 반환
     * @param request 문제 생성 요청 정보
     * @return 생성된 문제들과 메타데이터를 포함한 응답
     */
    /**
     * N개 문제를 API 1번 호출로 한 번에 생성 (기존: N번 호출)
     */
    public QuestionGenerationResponseDto generateQuestions(QuestionGenerationRequestDto request) {
        long startTime = System.currentTimeMillis();
        int count = request.getQuestionCount();

        log.info("문제 bulk 생성 시작 - 유형: {}, 난이도: {}, 개수: {}, API 호출: 1회",
            request.getQuestionType(), request.getDifficulty(), count);

        List<GeneratedQuestionDto> generatedQuestions = new ArrayList<>();
        List<String> errorMessages = new ArrayList<>();

        // 한 번에 너무 많으면 토큰 초과·RPM 위험 → 최대 3개씩
        int batchSize = Math.min(count, 3);
        int batches = (int) Math.ceil((double) count / batchSize);

        try {
            for (int b = 0; b < batches && generatedQuestions.size() < count; b++) {
                int remaining = count - generatedQuestions.size();
                int thisCount = Math.min(batchSize, remaining);

                String prompt = buildBulkPrompt(request, thisCount);

                OpenAIRequestDto aiRequest = OpenAIRequestDto.builder()
                    .prompt(prompt)
                    .model("gemini-2.0-flash")
                    .maxTokens(thisCount * 400)
                    .temperature(0.8)
                    .build();

            OpenAIResponseDto response = openAIService.generateResponse(aiRequest);

            if (!response.isSuccess()) {
                errorMessages.add("Gemini API 오류: " + response.getErrorMessage());
                break;
            }
            generatedQuestions.addAll(parseBulkResponse(response.getResponse(), request));
            log.info("배치 {}/{} 완료: {}개 누적", b + 1, batches, generatedQuestions.size());
            }

            if (generatedQuestions.isEmpty() && errorMessages.isEmpty()) {
                errorMessages.add("응답 파싱 실패 - JSON 배열 추출 불가");
            }

        } catch (Exception e) {
            log.error("bulk 문제 생성 오류", e);
            errorMessages.add("생성 중 오류: " + e.getMessage());
        }

        long processingTime = System.currentTimeMillis() - startTime;
        log.info("문제 bulk 생성 완료 - 성공: {}/{}, 소요시간: {}ms",
            generatedQuestions.size(), count, processingTime);

        return QuestionGenerationResponseDto.builder()
            .questions(generatedQuestions)
            .requestedCount(count)
            .successfullyGenerated(generatedQuestions.size())
            .failedCount(count - generatedQuestions.size())
            .success(!generatedQuestions.isEmpty())
            .errorMessages(errorMessages)
            .totalTokensUsed(0)
            .generatedAt(LocalDateTime.now())
            .processingTimeMs(processingTime)
            .build();
    }
    
    /**
     * 중복 방지를 위한 다양성이 있는 단일 문제 생성
     * @param request 문제 생성 요청 정보
     * @param variation 변형 번호 (다양성을 위해)
     * @param usedPromptVariations 이미 사용된 프롬프트 변형들
     * @return 생성된 문제 DTO
     */
    private GeneratedQuestionDto generateSingleQuestionWithVariation(QuestionGenerationRequestDto request, int variation, List<String> usedPromptVariations) {
        String prompt = buildPromptForQuestionTypeWithVariation(request, variation);
        usedPromptVariations.add(prompt);
        
        OpenAIRequestDto openAIRequest = OpenAIRequestDto.builder()
            .prompt(prompt)
            .model("gpt-3.5-turbo")
            .maxTokens(500)
            .temperature(0.8 + (variation * 0.1)) // 다양성을 위해 temperature 조정
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
     * 기존 단일 문제 생성 (하위 호환성)
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
     * 중복 방지를 위한 다양성 있는 프롬프트 생성
     * @param request 문제 생성 요청 정보
     * @param variation 변형 번호
     * @return 문제 유형에 맞는 다양성 있는 프롬프트
     */
    private String buildPromptForQuestionTypeWithVariation(QuestionGenerationRequestDto request, int variation) {
        String difficultyDescription = getDifficultyDescription(request.getDifficulty());
        String topicsText = request.getTopics() != null && !request.getTopics().isEmpty() 
            ? String.join(", ", request.getTopics()) : request.getMajorCategory();
        
        switch (request.getQuestionType()) {
            case WORD:
                return buildWordQuestionPromptWithVariation(difficultyDescription, topicsText, request, variation);
            case SENTENCE:
                return buildSentenceQuestionPromptWithVariation(difficultyDescription, topicsText, request, variation);
            case CONVERSATION:
                return buildConversationQuestionPromptWithVariation(difficultyDescription, topicsText, request, variation);
            default:
                throw new IllegalArgumentException("지원하지 않는 문제 유형: " + request.getQuestionType());
        }
    }
    
    /**
     * 기존 문제 유형별 프롬프트 생성 (하위 호환성)
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
     * 답안을 A, B, C에서 1, 2, 3으로 변환
     * 프론트엔드에는 A, B, C로 표시하지만 데이터베이스에는 1, 2, 3으로 저장
     */
    private String convertAnswerToNumber(String letterAnswer) {
        switch (letterAnswer.toUpperCase()) {
            case "A":
                return "1";
            case "B":
                return "2";
            case "C":
                return "3";
            default:
                throw new IllegalArgumentException("유효하지 않은 답안 형식: " + letterAnswer + " (A, B, C만 허용)");
        }
    }
    
    /**
     * 중복 문제 체크
     * @param newQuestion 새로 생성된 문제
     * @param existingQuestions 이미 생성된 문제들
     * @return 중복 여부
     */
    private boolean isDuplicateQuestion(GeneratedQuestionDto newQuestion, List<GeneratedQuestionDto> existingQuestions) {
        for (GeneratedQuestionDto existing : existingQuestions) {
            // 문제 텍스트의 유사성 검사 (빈칸 제거 후 비교)
            String newQuestionText = newQuestion.getQuestionText().replaceAll("_+", "").trim().toLowerCase();
            String existingQuestionText = existing.getQuestionText().replaceAll("_+", "").trim().toLowerCase();
            
            // 80% 이상 유사하면 중복으로 판단
            if (calculateSimilarity(newQuestionText, existingQuestionText) > 0.8) {
                return true;
            }
            
            // 선택지가 동일한지 체크
            if (newQuestion.getOptionA().equals(existing.getOptionA()) &&
                newQuestion.getOptionB().equals(existing.getOptionB()) &&
                newQuestion.getOptionC().equals(existing.getOptionC())) {
                return true;
            }
        }
        return false;
    }
    
    /**
     * 문자열 유사도 계산 (간단한 Levenshtein distance 기반)
     */
    private double calculateSimilarity(String s1, String s2) {
        if (s1.equals(s2)) return 1.0;
        if (s1.length() == 0 || s2.length() == 0) return 0.0;
        
        int maxLength = Math.max(s1.length(), s2.length());
        int distance = levenshteinDistance(s1, s2);
        return 1.0 - (double) distance / maxLength;
    }
    
    /**
     * Levenshtein distance 계산
     */
    private int levenshteinDistance(String s1, String s2) {
        int[][] dp = new int[s1.length() + 1][s2.length() + 1];
        
        for (int i = 0; i <= s1.length(); i++) {
            dp[i][0] = i;
        }
        for (int j = 0; j <= s2.length(); j++) {
            dp[0][j] = j;
        }
        
        for (int i = 1; i <= s1.length(); i++) {
            for (int j = 1; j <= s2.length(); j++) {
                int cost = s1.charAt(i - 1) == s2.charAt(j - 1) ? 0 : 1;
                dp[i][j] = Math.min(Math.min(
                    dp[i - 1][j] + 1,        // deletion
                    dp[i][j - 1] + 1),      // insertion
                    dp[i - 1][j - 1] + cost // substitution
                );
            }
        }
        return dp[s1.length()][s2.length()];
    }
    
    /**
     * 다양성 있는 WORD 타입 문제 프롬프트 생성
     */
    private String buildWordQuestionPromptWithVariation(String difficulty, String topics, QuestionGenerationRequestDto request, int variation) {
        String[] scenarios = {
            "일상 대화에서 자주 사용되는 상황",
            "직장이나 학교에서의 상황", 
            "여행이나 쇼핑 상황",
            "친구나 가족과의 대화",
            "뉴스나 잡지에서 볼 수 있는 문장"
        };
        
        String[] questionStyles = {
            "빈칸에 들어갈 가장 적절한 단어는?",
            "다음 문장을 완성하는 올바른 단어는?",
            "문맥상 가장 자연스러운 단어는?",
            "다음 상황에서 사용할 적절한 단어는?"
        };
        
        String scenario = scenarios[variation % scenarios.length];
        String questionStyle = questionStyles[variation % questionStyles.length];
        
        return String.format(
            "다음 조건에 맞는 영어 학습 문제를 1개 생성해주세요:\n\n" +
            "【문제 유형】: 빈칸 채우기 (WORD)\n" +
            "【난이도】: %s\n" +
            "【주제/카테고리】: %s\n" +
            "【상황】: %s\n" +
            "【질문 스타일】: %s\n" +
            "【추가 컨텍스트】: %s\n\n" +
            "【요구사항】:\n" +
            "1. %s 맥락에서 자연스럽게 사용되는 문장을 만들어주세요\n" +
            "2. 문장에서 핵심 단어 하나를 빈칸(______)으로 만들어주세요\n" +
            "3. 빈칸에 들어갈 정답과 비슷하지만 틀린 선택지 2개를 포함해주세요\n" +
            "4. 선택지는 모두 같은 품사여야 합니다\n" +
            "5. 이전에 생성한 문제와 다른 새로운 상황과 단어를 사용해주세요\n\n" +
            "【응답 형식】: 다음 형식을 정확히 따라주세요\n" +
            "QUESTION: [빈칸이 포함된 영어 문장]\n" +
            "A: [선택지1]\n" +
            "B: [선택지2]\n" +
            "C: [선택지3]\n" +
            "ANSWER: [A, B, C 중 정답]\n" +
            "EXPLANATION: [정답 설명 (한국어)]",
            difficulty, topics, scenario, questionStyle,
            request.getAdditionalContext() != null ? request.getAdditionalContext() : "없음",
            scenario
        );
    }
    
    /**
     * 다양성 있는 SENTENCE 타입 문제 프롬프트 생성
     */
    private String buildSentenceQuestionPromptWithVariation(String difficulty, String topics, QuestionGenerationRequestDto request, int variation) {
        // 기존 buildSentenceQuestionPrompt와 동일하지만 다양성 추가
        return buildSentenceQuestionPrompt(difficulty, topics, request) + 
               "\n\n【다양성 요구】: 이전 문제와 다른 새로운 단어와 문맥을 사용해주세요.";
    }
    
    /**
     * 다양성 있는 CONVERSATION 타입 문제 프롬프트 생성
     */
    private String buildConversationQuestionPromptWithVariation(String difficulty, String topics, QuestionGenerationRequestDto request, int variation) {
        // 기존 buildConversationQuestionPrompt와 동일하지만 다양성 추가
        return buildConversationQuestionPrompt(difficulty, topics, request) + 
               "\n\n【다양성 요구】: 이전 문제와 다른 새로운 대화 상황과 표현을 사용해주세요.";
    }
    
    // ── Bulk 생성 핵심 메서드 ───────────────────────────────────────────────

    /**
     * N개 문제를 한 번에 JSON 배열로 요청하는 프롬프트 생성
     */
    private String buildBulkPrompt(QuestionGenerationRequestDto request, int count) {
        String difficulty = getDifficultyDescription(request.getDifficulty());
        String topics = request.getTopics() != null && !request.getTopics().isEmpty()
            ? String.join(", ", request.getTopics()) : request.getMajorCategory();
        String typeDesc = getTypeDescription(request.getQuestionType());

        return String.format(
            "영어 학습 문제 %d개를 아래 조건으로 생성하고, 반드시 JSON 배열 형식으로만 응답하세요.\n\n" +
            "【조건】\n" +
            "- 문제 유형: %s\n" +
            "- 난이도: %s\n" +
            "- 주제: %s\n" +
            "- 각 문제는 서로 다른 상황/단어를 사용할 것\n\n" +
            "【응답 형식 — 이 JSON 배열만 출력, 다른 텍스트 없음】\n" +
            "[\n" +
            "  {\n" +
            "    \"questionText\": \"(문제 문장)\",\n" +
            "    \"optionA\": \"(선택지 A)\",\n" +
            "    \"optionB\": \"(선택지 B)\",\n" +
            "    \"optionC\": \"(선택지 C)\",\n" +
            "    \"correctAnswer\": \"A 또는 B 또는 C\",\n" +
            "    \"explanation\": \"(한국어 해설)\"\n" +
            "  }\n" +
            "]\n\n" +
            "지금 %d개 문제를 JSON 배열로 생성하세요.",
            count, typeDesc, difficulty, topics, count
        );
    }

    private String getTypeDescription(com.problemservice.ProblemService.model.enums.QuestionType type) {
        switch (type) {
            case WORD: return "빈칸 채우기 (문장에서 단어 하나를 빈칸으로, 3개 선택지 중 정답 선택)";
            case SENTENCE: return "동의어 선택 (굵게 표시된 단어/구와 같은 의미의 선택지 고르기)";
            case CONVERSATION: return "대화 완성 (상황에 가장 적절한 응답 선택)";
            default: return "빈칸 채우기";
        }
    }

    /**
     * Gemini의 JSON 배열 응답을 GeneratedQuestionDto 리스트로 파싱
     */
    private List<GeneratedQuestionDto> parseBulkResponse(String raw, QuestionGenerationRequestDto request) {
        List<GeneratedQuestionDto> result = new ArrayList<>();
        try {
            // JSON 배열 추출 (마크다운 코드블록 등 제거)
            int start = raw.indexOf('[');
            int end = raw.lastIndexOf(']') + 1;
            if (start < 0 || end <= start) {
                log.warn("JSON 배열을 찾지 못함. 응답: {}", raw.substring(0, Math.min(200, raw.length())));
                return result;
            }
            String json = raw.substring(start, end);

            JsonNode array = objectMapper.readTree(json);
            if (!array.isArray()) return result;

            for (JsonNode node : array) {
                try {
                    String questionText = node.path("questionText").asText();
                    String optionA = node.path("optionA").asText();
                    String optionB = node.path("optionB").asText();
                    String optionC = node.path("optionC").asText();
                    String correctAnswer = node.path("correctAnswer").asText().trim().toUpperCase();
                    String explanation = node.path("explanation").asText("");

                    if (questionText.isBlank() || optionA.isBlank() || correctAnswer.isEmpty()) continue;
                    if (!List.of("A","B","C").contains(correctAnswer)) continue;

                    result.add(GeneratedQuestionDto.builder()
                        .questionText(questionText)
                        .optionA(optionA)
                        .optionB(optionB)
                        .optionC(optionC)
                        .correctAnswer(correctAnswer)
                        .explanation(explanation)
                        .questionType(request.getQuestionType())
                        .difficulty(request.getDifficulty())
                        .majorCategory(request.getMajorCategory())
                        .minorCategory(request.getMinorCategory() != null ? request.getMinorCategory() : request.getMajorCategory())
                        .isValid(true)
                        .generatedAt(LocalDateTime.now())
                        .build());
                } catch (Exception e) {
                    log.warn("개별 문제 파싱 실패: {}", e.getMessage());
                }
            }
            log.info("bulk 파싱 완료: {}개", result.size());
        } catch (Exception e) {
            log.error("bulk JSON 파싱 오류", e);
        }
        return result;
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
            .correctAnswer(convertAnswerToNumber(generatedQuestion.getCorrectAnswer()))
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