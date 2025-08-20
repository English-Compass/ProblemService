package com.problemservice.ProblemService.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.problemservice.ProblemService.model.dto.QuestionFilterOptions;
import com.problemservice.ProblemService.model.dto.QuestionResponseDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class QuestionReadingService {

    private final ResourceLoader resourceLoader;
    private final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * 필터 조건에 따라 정적 JSON 파일에서 문제를 찾습니다
     * 
     * @param options 카테고리, 키워드, 레벨을 포함한 필터 조건
     * @return 필터 조건과 일치하는 문제가 포함된 List<QuestionResponseDto>
     */
    public List<QuestionResponseDto> findQuestionsByOptions(QuestionFilterOptions options) {
        List<QuestionResponseDto> result = new ArrayList<>();
        
        try {
            List<String> resourcePaths = buildResourcePaths(options);
            
            for (String resourcePath : resourcePaths) {
                Resource resource = resourceLoader.getResource(resourcePath);
                
                if (!resource.exists()) {
                    continue;
                }
                
                try (InputStream inputStream = resource.getInputStream()) {
                    JsonNode jsonArray = objectMapper.readTree(inputStream);
                    
                    for (JsonNode jsonNode : jsonArray) {
                        if (matchesFilter(jsonNode, options)) {
                            QuestionResponseDto question = mapJsonToDto(jsonNode);
                            result.add(question);
                        }
                    }
                }
            }
            
        } catch (IOException e) {
            log.error("Error reading quiz data", e);
        }
        
        return result;
    }

    /**
     * 필터 조건에 따라 정적 문제 JSON 파일의 경로를 구성합니다
     * 
     * @param options 로드할 파일을 결정하는 데 사용되는 필터 조건
     * @return JSON 파일에 대한 클래스패스 리소스 경로가 포함된 List<String>
     */
    private List<String> buildResourcePaths(QuestionFilterOptions options) {
        List<String> paths = new ArrayList<>();
        
        // Build paths for known files based on the directory structure
        String basePath = "classpath:static/quiz/";
        
        if (options.getKeyword() != null && options.getKeyword().equals("industry-global-business") &&
            options.getCategory() != null && options.getCategory().equals("sentence") &&
            options.getLevel() != null && options.getLevel().equals("A1")) {
            
            // Add all known A1 sentence files for industry-global-business
            String dirPath = basePath + "business/industry-global-business/sentence/A1/";
            for (int i = 1; i <= 10; i++) {
                paths.add(dirPath + String.format("industry-global-business-sentence-A1-%02d.json", i));
            }
            // Also add the variants with different numbering
            paths.add(dirPath + "industry-global-business-sentence-A1-001.json");
            paths.add(dirPath + "industry-global-business-sentence-A1-007.json");
        }
        
        return paths;
    }

    /**
     * 문제 JSON 노드가 지정된 필터 조건과 일치하는지 확인합니다
     * 
     * @param jsonNode 정적 파일에서 가져온 문제의 JSON 표현
     * @param options 일치시킬 필터 조건
     * @return 문제가 지정된 모든 필터 조건과 일치하면 true, 그렇지 않으면 false
     */
    private boolean matchesFilter(JsonNode jsonNode, QuestionFilterOptions options) {
        if (options.getCategory() != null && !options.getCategory().equals(jsonNode.get("category").asText())) {
            return false;
        }
        
        if (options.getKeyword() != null && !options.getKeyword().equals(jsonNode.get("keyword").asText())) {
            return false;
        }
        
        if (options.getLevel() != null && !options.getLevel().equals(jsonNode.get("level").asText())) {
            return false;
        }
        
        return true;
    }

    /**
     * 문제를 나타내는 JSON 노드를 QuestionResponseDto로 변환합니다
     * 
     * @param jsonNode 정적 파일에서 가져온 문제의 JSON 표현
     * @return API 응답 형식으로 포맷된 문제 데이터가 포함된 QuestionResponseDto
     */
    private QuestionResponseDto mapJsonToDto(JsonNode jsonNode) {
        return QuestionResponseDto.builder()
                .questionText(jsonNode.get("question").asText())
                .majorCategory(jsonNode.get("category").asText())
                .minorCategory(jsonNode.get("category").asText()) // Use same for both for static files
                .questionType(jsonNode.get("category").asText()) // Map category to questionType for static files
                .level(jsonNode.get("level").asText())
                .difficultyLevel(parseDifficultyLevel(jsonNode.get("level").asText()))
                .optionA(jsonNode.get("option1").asText())
                .optionB(jsonNode.get("option2").asText())
                .optionC(jsonNode.get("option3").asText())
                .correctAnswer(convertAnswerIndexToLetter(jsonNode.get("answer").asInt()))
                // For backward compatibility
                .option1(jsonNode.get("option1").asText())
                .option2(jsonNode.get("option2").asText())
                .option3(jsonNode.get("option3").asText())
                .answerIndex(jsonNode.get("answer").asInt())
                .build();
    }

    private Integer parseDifficultyLevel(String level) {
        switch (level.toUpperCase()) {
            case "A1": return 1;
            case "A2": return 1;
            case "B1": return 2;
            case "B2": return 2;
            case "C1": return 3;
            case "C2": return 3;
            default: return 1;
        }
    }

    private String convertAnswerIndexToLetter(int index) {
        switch (index) {
            case 1: return "A";
            case 2: return "B";
            case 3: return "C";
            default: return "A";
        }
    }
}