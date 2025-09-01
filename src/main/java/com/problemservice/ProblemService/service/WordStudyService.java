package com.problemservice.ProblemService.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.problemservice.ProblemService.model.dto.*;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.model.entity.QuestionAnswer;
import com.problemservice.ProblemService.repository.QuestionAnswerRepository;
import com.problemservice.ProblemService.repository.QuestionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 사용자별 맞춤형 단어 학습 서비스
 * 사용자의 학습 성과 데이터를 분석하여 약점 카테고리와 난이도에 집중한 단어 목록 생성
 * Combined Tactic 2+3: Category Proficiency + Progressive Difficulty 전략 적용
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class WordStudyService {

    private final QuestionAnswerRepository questionAnswerRepository;
    private final QuestionRepository questionRepository;
    private final OpenAIService openAIService;
    private final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * 사용자 맞춤형 단어 학습 목록 생성
     * 단계: 1) 사용자 학습 프로필 분석 2) OpenAI 프롬프트 생성 3) AI 단어 생성 요청 4) 응답 파싱
     */
    public WordStudyResponseDto generateWordStudyList(WordStudyRequestDto requestDto) {
        log.info("단어 학습 목록 생성 시작 - 사용자: {}, 단어 수: {}", 
                requestDto.getUserId(), requestDto.getWordCount());

        try {
            // 1단계: 사용자 학습 프로필 분석
            UserLearningProfileDto userProfile = analyzeUserLearningProfile(requestDto.getUserId());
            
            // 2단계: Combined Tactic 프롬프트 생성
            String combinedTacticPrompt = buildCombinedTacticPrompt(userProfile, requestDto);
            
            // 3단계: OpenAI API 호출
            OpenAIRequestDto openAIRequest = OpenAIRequestDto.builder()
                    .prompt(combinedTacticPrompt)
                    .model("gpt-3.5-turbo")
                    .maxTokens(4000)
                    .temperature(0.8)
                    .build();
            
            OpenAIResponseDto aiResponse = openAIService.generateResponse(openAIRequest);
            
            // 4단계: AI 응답 파싱 및 DTO 변환
            if (aiResponse.isSuccess()) {
                return parseWordStudyResponse(aiResponse.getResponse());
            } else {
                return WordStudyResponseDto.builder()
                        .success(false)
                        .errorMessage("단어 생성 중 오류가 발생했습니다: " + aiResponse.getErrorMessage())
                        .generatedAt(LocalDateTime.now())
                        .build();
            }
            
        } catch (Exception e) {
            log.error("단어 학습 목록 생성 실패", e);
            return WordStudyResponseDto.builder()
                    .success(false)
                    .errorMessage("단어 학습 목록 생성 중 오류가 발생했습니다: " + e.getMessage())
                    .generatedAt(LocalDateTime.now())
                    .build();
        }
    }

    /**
     * 사용자의 학습 성과 데이터를 분석하여 프로필 생성
     * 카테고리별, 난이도별 정답률 및 약점 영역 식별
     */
    public UserLearningProfileDto analyzeUserLearningProfile(String userId) {
        log.info("사용자 학습 프로필 분석 시작 - 사용자: {}", userId);

        // 사용자의 모든 답안 기록 조회
        List<QuestionAnswer> userAnswers = questionAnswerRepository.findByUserId(userId);
        
        if (userAnswers.isEmpty()) {
            // 신규 사용자의 경우 기본 프로필 반환
            return createDefaultUserProfile(userId);
        }

        // 카테고리별 정답률 계산
        Map<String, Double> categoryAccuracy = calculateCategoryAccuracy(userAnswers);
        
        // 난이도별 정답률 계산
        Map<String, Double> difficultyAccuracy = calculateDifficultyAccuracy(userAnswers);
        Map<String, Integer> difficultyQuestionsSolved = calculateDifficultyQuestionsSolved(userAnswers);
        
        // 약점/중간/강점 카테고리 분류
        List<String> weakCategories = categorizeByPerformance(categoryAccuracy, 0.7);
        List<String> mediumCategories = categorizeByPerformance(categoryAccuracy, 0.85, 0.7);
        List<String> strongCategories = categorizeByPerformance(categoryAccuracy, 1.0, 0.85);
        
        // 가장 약한/강한 난이도 식별
        String weakestDifficulty = findWeakestDifficulty(difficultyAccuracy);
        String strongestDifficulty = findStrongestDifficulty(difficultyAccuracy);
        
        // 약점 문제 유형 식별
        List<String> weakQuestionTypes = identifyWeakQuestionTypes(userAnswers);
        
        // 학습 패턴 분석
        String learningPattern = analyzeLearningPattern(userAnswers);
        
        // 평균 소요 시간 계산
        Double averageTime = calculateAverageTime(userAnswers);
        
        // 일관성 점수 계산
        Double consistencyScore = calculateConsistencyScore(userAnswers);

        return UserLearningProfileDto.builder()
                .userId(userId)
                .categoryAccuracy(categoryAccuracy)
                .difficultyAccuracy(difficultyAccuracy)
                .difficultyQuestionsSolved(difficultyQuestionsSolved)
                .weakCategories(weakCategories)
                .mediumCategories(mediumCategories)
                .strongCategories(strongCategories)
                .weakestDifficulty(weakestDifficulty)
                .strongestDifficulty(strongestDifficulty)
                .weakestDifficultyAccuracy(difficultyAccuracy.get(weakestDifficulty))
                .strongestDifficultyAccuracy(difficultyAccuracy.get(strongestDifficulty))
                .weakQuestionTypes(weakQuestionTypes)
                .learningPattern(learningPattern)
                .averageTime(averageTime)
                .consistencyScore(consistencyScore)
                .build();
    }

    /**
     * Combined Tactic 2+3 전략에 따른 OpenAI 프롬프트 생성
     * 40% 약점 카테고리 + 35% 약점 카테고리 중간 난이도 + 15% 중간 카테고리 + 10% 강점 카테고리
     */
    private String buildCombinedTacticPrompt(UserLearningProfileDto profile, WordStudyRequestDto requestDto) {
        StringBuilder prompt = new StringBuilder();
        prompt.append("You are an expert English vocabulary instructor for Korean learners. Create a personalized vocabulary study list based on the following user profile:\n\n");
        
        // 사용자 학습 프로필
        prompt.append("**USER LEARNING PROFILE:**\n");
        prompt.append("- User ID: ").append(profile.getUserId()).append("\n");
        prompt.append("- Total Words Needed: ").append(requestDto.getWordCount()).append("\n\n");
        
        // 카테고리 성과 데이터
        prompt.append("**CATEGORY PERFORMANCE DATA:**\n");
        prompt.append("- Weak Categories (Low Proficiency): ").append(String.join(", ", profile.getWeakCategories()))
                .append(" - ").append(String.format("%.1f", getAverageAccuracy(profile.getCategoryAccuracy(), profile.getWeakCategories()))).append("% accuracy\n");
        prompt.append("- Medium Categories: ").append(String.join(", ", profile.getMediumCategories()))
                .append(" - ").append(String.format("%.1f", getAverageAccuracy(profile.getCategoryAccuracy(), profile.getMediumCategories()))).append("% accuracy\n");
        prompt.append("- Strong Categories: ").append(String.join(", ", profile.getStrongCategories()))
                .append(" - ").append(String.format("%.1f", getAverageAccuracy(profile.getCategoryAccuracy(), profile.getStrongCategories()))).append("% accuracy\n\n");
        
        // 난이도 성과 데이터
        prompt.append("**DIFFICULTY PERFORMANCE DATA:**\n");
        prompt.append("- Difficulty A (Beginner): ").append(String.format("%.1f", profile.getDifficultyAccuracy().getOrDefault("A", 0.0) * 100))
                .append("% accuracy, ").append(profile.getDifficultyQuestionsSolved().getOrDefault("A", 0)).append(" questions solved\n");
        prompt.append("- Difficulty B (Intermediate): ").append(String.format("%.1f", profile.getDifficultyAccuracy().getOrDefault("B", 0.0) * 100))
                .append("% accuracy, ").append(profile.getDifficultyQuestionsSolved().getOrDefault("B", 0)).append(" questions solved\n");
        prompt.append("- Difficulty C (Advanced): ").append(String.format("%.1f", profile.getDifficultyAccuracy().getOrDefault("C", 0.0) * 100))
                .append("% accuracy, ").append(profile.getDifficultyQuestionsSolved().getOrDefault("C", 0)).append(" questions solved\n");
        prompt.append("- Weakest Difficulty Level: ").append(profile.getWeakestDifficulty())
                .append(" (").append(String.format("%.1f", profile.getWeakestDifficultyAccuracy() * 100)).append("% accuracy)\n");
        prompt.append("- Strongest Difficulty Level: ").append(profile.getStrongestDifficulty())
                .append(" (").append(String.format("%.1f", profile.getStrongestDifficultyAccuracy() * 100)).append("% accuracy)\n\n");
        
        // 학습 맥락
        prompt.append("**LEARNING CONTEXT:**\n");
        prompt.append("- Primary Focus Areas: ").append(String.join(", ", profile.getWeakCategories())).append("\n");
        prompt.append("- Weak Question Types: ").append(String.join(", ", profile.getWeakQuestionTypes())).append("\n");
        prompt.append("- Learning Pattern: ").append(profile.getLearningPattern()).append("\n");
        prompt.append("- Average Time per Question: ").append(String.format("%.1f", profile.getAverageTime())).append(" seconds\n");
        prompt.append("- Consistency Score: ").append(String.format("%.1f", profile.getConsistencyScore())).append("%\n\n");
        
        // 단어 생성 요구사항
        int wordCount = requestDto.getWordCount();
        int weakPrimaryWords = (int) Math.ceil(wordCount * 0.40);
        int weakSecondaryWords = (int) Math.ceil(wordCount * 0.35);
        int mediumWords = (int) Math.ceil(wordCount * 0.15);
        int strongWords = (int) Math.floor(wordCount * 0.10);
        
        prompt.append("**WORD GENERATION REQUIREMENTS:**\n\n");
        prompt.append("1. **Category and Difficulty Distribution (Performance-Based Focus):**\n");
        prompt.append("   - ").append(weakPrimaryWords).append(" words from WEAK categories at ").append(profile.getWeakestDifficulty()).append(" level (primary focus)\n");
        prompt.append("   - ").append(weakSecondaryWords).append(" words from WEAK categories at medium-performing difficulty level\n");
        prompt.append("   - ").append(mediumWords).append(" words from MEDIUM categories at appropriate difficulty levels\n");
        prompt.append("   - ").append(strongWords).append(" words from STRONG categories and difficulty levels (confidence builders)\n\n");
        
        // 나머지 프롬프트 추가
        prompt.append(getRestOfCombinedTacticPrompt(profile));
        
        return prompt.toString();
    }

    private String getRestOfCombinedTacticPrompt(UserLearningProfileDto profile) {
        return """
                2. **Question Type Alignment:**
                   - Prioritize vocabulary that commonly appears in weak question formats
                   - Include words suitable for fill-in-the-blank, synonym matching, and conversation response contexts
                   - Focus on question types where user shows lowest accuracy rates
                
                3. **Difficulty-Based Strategy:**
                   - Heavy emphasis on weakest level vocabulary (where user struggles most)
                   - Moderate inclusion of better-performing difficulty levels for balance
                   - Focus on practical, high-frequency words appropriate for Korean English learners
                   - Ensure vocabulary matches the difficulty performance patterns
                
                **OUTPUT FORMAT:**
                Return ONLY a valid JSON object with this exact structure:
                
                ```json
                {
                  "words": [
                    {
                      "word": "example",
                      "difficulty": "A",
                      "category": "학업",
                      "questionType": "WORD",
                      "definition": "Clear definition in simple English",
                      "koreanMeaning": "Korean translation",
                      "exampleSentence": "Example sentence using the word naturally",
                      "commonMistakes": "Common errors Korean learners make with this word",
                      "studyTip": "Specific learning tip or memory aid",
                      "categoryContext": "How this word relates to the category context"
                    }
                  ],
                  "studyStrategy": "Explanation of the combined approach used",
                  "focusAreas": ["Primary areas these words address"],
                  "estimatedStudyTime": 25,
                  "difficultyDistribution": {
                    "A": 0,
                    "B": 0,
                    "C": 0
                  },
                  "categoryDistribution": {
                    "weak": 0,
                    "medium": 0,
                    "strong": 0
                  }
                }
                ```
                
                **QUALITY REQUIREMENTS:**
                - No duplicate words or word roots
                - Words must be practical and commonly used in target categories
                - Ensure cultural appropriateness for Korean learners
                - Include variety in word types (nouns, verbs, adjectives, phrases)
                - Maintain logical difficulty progression
                - Focus on vocabulary that will improve performance in weak question types
                
                Generate the vocabulary list now, ensuring perfect adherence to the distribution requirements and JSON format.
                """;
    }

    /**
     * OpenAI 응답을 파싱하여 WordStudyResponseDto로 변환
     */
    private WordStudyResponseDto parseWordStudyResponse(String aiResponse) throws JsonProcessingException {
        log.info("AI 응답 파싱 시작");
        
        // JSON 부분 추출
        String jsonContent = extractJsonFromResponse(aiResponse);
        
        // JSON을 Map으로 파싱
        Map<String, Object> responseMap = objectMapper.readValue(jsonContent, new TypeReference<Map<String, Object>>() {});
        
        // words 배열 파싱
        List<Map<String, Object>> wordsData = (List<Map<String, Object>>) responseMap.get("words");
        List<WordStudyWordDto> words = wordsData.stream()
                .map(this::convertToWordStudyWordDto)
                .collect(Collectors.toList());
        
        // difficultyDistribution 파싱
        Map<String, Object> difficultyDistributionObj = (Map<String, Object>) responseMap.get("difficultyDistribution");
        Map<String, Integer> difficultyDistribution = convertToIntegerMap(difficultyDistributionObj);
        
        // categoryDistribution 파싱
        Map<String, Object> categoryDistributionObj = (Map<String, Object>) responseMap.get("categoryDistribution");
        Map<String, Integer> categoryDistribution = convertToIntegerMap(categoryDistributionObj);
        
        return WordStudyResponseDto.builder()
                .words(words)
                .studyStrategy((String) responseMap.get("studyStrategy"))
                .focusAreas((List<String>) responseMap.get("focusAreas"))
                .estimatedStudyTime((Integer) responseMap.get("estimatedStudyTime"))
                .difficultyDistribution(difficultyDistribution)
                .categoryDistribution(categoryDistribution)
                .generatedAt(LocalDateTime.now())
                .success(true)
                .build();
    }

    private WordStudyWordDto convertToWordStudyWordDto(Map<String, Object> wordData) {
        return WordStudyWordDto.builder()
                .word((String) wordData.get("word"))
                .difficulty((String) wordData.get("difficulty"))
                .category((String) wordData.get("category"))
                .questionType((String) wordData.get("questionType"))
                .definition((String) wordData.get("definition"))
                .koreanMeaning((String) wordData.get("koreanMeaning"))
                .exampleSentence((String) wordData.get("exampleSentence"))
                .commonMistakes((String) wordData.get("commonMistakes"))
                .studyTip((String) wordData.get("studyTip"))
                .categoryContext((String) wordData.get("categoryContext"))
                .build();
    }

    private Map<String, Integer> convertToIntegerMap(Map<String, Object> sourceMap) {
        return sourceMap.entrySet().stream()
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        entry -> ((Number) entry.getValue()).intValue()
                ));
    }

    private String extractJsonFromResponse(String response) {
        // ```json으로 시작하는 코드 블록에서 JSON 추출
        int startIndex = response.indexOf("{");
        int endIndex = response.lastIndexOf("}") + 1;
        
        if (startIndex != -1 && endIndex != -1) {
            return response.substring(startIndex, endIndex);
        }
        
        throw new IllegalArgumentException("유효한 JSON을 찾을 수 없습니다");
    }

    // 헬퍼 메소드들
    private UserLearningProfileDto createDefaultUserProfile(String userId) {
        return UserLearningProfileDto.builder()
                .userId(userId)
                .categoryAccuracy(Map.of("학업", 0.5, "비즈니스", 0.5, "여행", 0.5, "일상생활", 0.5))
                .difficultyAccuracy(Map.of("A", 0.6, "B", 0.4, "C", 0.3))
                .difficultyQuestionsSolved(Map.of("A", 0, "B", 0, "C", 0))
                .weakCategories(Arrays.asList("학업", "비즈니스", "여행", "일상생활"))
                .mediumCategories(new ArrayList<>())
                .strongCategories(new ArrayList<>())
                .weakestDifficulty("C")
                .strongestDifficulty("A")
                .weakestDifficultyAccuracy(0.3)
                .strongestDifficultyAccuracy(0.6)
                .weakQuestionTypes(Arrays.asList("WORD", "SENTENCE"))
                .learningPattern("STRUGGLING")
                .averageTime(30.0)
                .consistencyScore(50.0)
                .build();
    }

    private Map<String, Double> calculateCategoryAccuracy(List<QuestionAnswer> userAnswers) {
        Map<String, List<QuestionAnswer>> categoryAnswers = userAnswers.stream()
                .filter(answer -> answer.getQuestion() != null && answer.getQuestion().getMajorCategory() != null)
                .collect(Collectors.groupingBy(answer -> answer.getQuestion().getMajorCategory()));

        return categoryAnswers.entrySet().stream()
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        entry -> {
                            List<QuestionAnswer> answers = entry.getValue();
                            long correctCount = answers.stream().mapToLong(answer -> answer.getIsCorrect() ? 1 : 0).sum();
                            return (double) correctCount / answers.size();
                        }
                ));
    }

    private Map<String, Double> calculateDifficultyAccuracy(List<QuestionAnswer> userAnswers) {
        Map<String, List<QuestionAnswer>> difficultyAnswers = userAnswers.stream()
                .filter(answer -> answer.getQuestion() != null && answer.getQuestion().getDifficultyLevel() != null)
                .collect(Collectors.groupingBy(answer -> answer.getQuestion().getDifficultyLevel()));

        return difficultyAnswers.entrySet().stream()
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        entry -> {
                            List<QuestionAnswer> answers = entry.getValue();
                            long correctCount = answers.stream().mapToLong(answer -> answer.getIsCorrect() ? 1 : 0).sum();
                            return (double) correctCount / answers.size();
                        }
                ));
    }

    private Map<String, Integer> calculateDifficultyQuestionsSolved(List<QuestionAnswer> userAnswers) {
        return userAnswers.stream()
                .filter(answer -> answer.getQuestion() != null && answer.getQuestion().getDifficultyLevel() != null)
                .collect(Collectors.groupingBy(
                        answer -> answer.getQuestion().getDifficultyLevel(),
                        Collectors.collectingAndThen(Collectors.counting(), Math::toIntExact)
                ));
    }

    private List<String> categorizeByPerformance(Map<String, Double> accuracyMap, double maxThreshold) {
        return accuracyMap.entrySet().stream()
                .filter(entry -> entry.getValue() < maxThreshold)
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());
    }

    private List<String> categorizeByPerformance(Map<String, Double> accuracyMap, double maxThreshold, double minThreshold) {
        return accuracyMap.entrySet().stream()
                .filter(entry -> entry.getValue() >= minThreshold && entry.getValue() < maxThreshold)
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());
    }

    private String findWeakestDifficulty(Map<String, Double> difficultyAccuracy) {
        return difficultyAccuracy.entrySet().stream()
                .min(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey)
                .orElse("A");
    }

    private String findStrongestDifficulty(Map<String, Double> difficultyAccuracy) {
        return difficultyAccuracy.entrySet().stream()
                .max(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey)
                .orElse("C");
    }

    private List<String> identifyWeakQuestionTypes(List<QuestionAnswer> userAnswers) {
        Map<String, Double> typeAccuracy = userAnswers.stream()
                .filter(answer -> answer.getQuestion() != null && answer.getQuestion().getQuestionType() != null)
                .collect(Collectors.groupingBy(
                        answer -> answer.getQuestion().getQuestionType(),
                        Collectors.averagingDouble(answer -> answer.getIsCorrect() ? 1.0 : 0.0)
                ));

        return typeAccuracy.entrySet().stream()
                .filter(entry -> entry.getValue() < 0.7)
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());
    }

    private String analyzeLearningPattern(List<QuestionAnswer> userAnswers) {
        if (userAnswers.size() < 10) return "STRUGGLING";
        
        // 최근 답안들의 정답률 계산
        List<QuestionAnswer> recentAnswers = userAnswers.stream()
                .sorted(Comparator.comparing(QuestionAnswer::getAnsweredAt).reversed())
                .limit(20)
                .collect(Collectors.toList());
        
        double recentAccuracy = recentAnswers.stream()
                .mapToDouble(answer -> answer.getIsCorrect() ? 1.0 : 0.0)
                .average()
                .orElse(0.0);
        
        if (recentAccuracy >= 0.8) return "IMPROVING";
        else if (recentAccuracy >= 0.6) return "STABLE";
        else return "STRUGGLING";
    }

    private Double calculateAverageTime(List<QuestionAnswer> userAnswers) {
        return userAnswers.stream()
                .filter(answer -> answer.getTimeSpent() != null)
                .mapToDouble(QuestionAnswer::getTimeSpent)
                .average()
                .orElse(30.0);
    }

    private Double calculateConsistencyScore(List<QuestionAnswer> userAnswers) {
        if (userAnswers.size() < 5) return 50.0;
        
        // 최근 답안들의 정답률 분산을 기반으로 일관성 계산
        List<Boolean> recentResults = userAnswers.stream()
                .sorted(Comparator.comparing(QuestionAnswer::getAnsweredAt).reversed())
                .limit(20)
                .map(QuestionAnswer::getIsCorrect)
                .collect(Collectors.toList());
        
        double variance = calculateVariance(recentResults);
        return Math.max(0, 100 - (variance * 100));
    }

    private double calculateVariance(List<Boolean> results) {
        double mean = results.stream().mapToDouble(result -> result ? 1.0 : 0.0).average().orElse(0.0);
        double variance = results.stream()
                .mapToDouble(result -> Math.pow((result ? 1.0 : 0.0) - mean, 2))
                .average()
                .orElse(0.0);
        return variance;
    }

    private double getAverageAccuracy(Map<String, Double> accuracyMap, List<String> categories) {
        if (categories.isEmpty()) return 0.0;
        
        return categories.stream()
                .mapToDouble(category -> accuracyMap.getOrDefault(category, 0.0) * 100)
                .average()
                .orElse(0.0);
    }
}