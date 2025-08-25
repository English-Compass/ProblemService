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

/**
 * 정적 퀴즈 데이터 파일 읽기 및 처리 서비스
 * JSON 형태로 저장된 퀴즈 데이터를 읽고 필터링하여 DTO로 변환
 * 입력: 퀴즈 필터 옵션 (카테고리, 키워드, 레벨)
 * 출력: 조건에 맞는 문제 응답 DTO 목록
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class QuestionReadingService {

    // 스프링 리소스 로더 (클래스패스 자원 접근을 위한)
    private final ResourceLoader resourceLoader;
    // JSON 파싱을 위한 Jackson ObjectMapper
    private final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * 필터 옵션에 따라 정적 JSON 파일에서 문제 데이터 조회
     * 단계: 1) 필터 옵션으로 리소스 경로 생성 2) 각 파일 읽기 3) JSON 파싱 4) 필터링 5) DTO 변환 6) 예외 처리
     * 입력: 문제 필터 옵션 (카테고리, 키워드, 레벨 등)
     * 출력: 필터 조건에 맞는 문제 응답 DTO 목록
     * 조건: 파일 읽기 오류 시 빈 목록 반환 및 에러 로그 기록
     */
    public List<QuestionResponseDto> findQuestionsByOptions(QuestionFilterOptions options) {
        // 결과를 저장할 목록 초기화
        List<QuestionResponseDto> result = new ArrayList<>();
        
        try {
            // 1단계: 필터 옵션에 기반하여 읽어야 할 JSON 파일들의 경로 리스트 생성
            List<String> resourcePaths = buildResourcePaths(options);
            
            // 2단계: 각 리소스 경로에 대해 반복 처리
            for (String resourcePath : resourcePaths) {
                Resource resource = resourceLoader.getResource(resourcePath); // 리소스 로드
                
                // 파일이 존재하지 않으면 다음 파일로 이동
                if (!resource.exists()) {
                    continue;
                }
                
                // 3단계: 파일 입력 스트림으로 JSON 데이터 읽기
                try (InputStream inputStream = resource.getInputStream()) {
                    JsonNode jsonArray = objectMapper.readTree(inputStream); // JSON 배열 파싱
                    
                    // 4단계: JSON 배열의 각 요소에 대해 처리
                    for (JsonNode jsonNode : jsonArray) {
                        // 5단계: 필터 조건에 맞는지 확인
                        if (matchesFilter(jsonNode, options)) {
                            // 6단계: 조건에 맞으면 JSON을 DTO로 변환하여 결과에 추가
                            QuestionResponseDto question = mapJsonToDto(jsonNode);
                            result.add(question);
                        }
                    }
                }
            }
            
        } catch (IOException e) {
            // 7단계: 파일 읽기 오류 시 로그 기록
            log.error("Error reading quiz data", e);
        }
        
        // 최종 결과 목록 반환
        return result;
    }

    /**
     * 필터 옵션에 기반하여 읽어야 할 JSON 파일들의 리소스 경로 목록 생성
     * 단계: 1) 기본 경로 설정 2) 특정 조건 매칭 3) 해당 디렉토리 경로 구성 4) 파일명 패턴 생성
     * 입력: 문제 필터 옵션
     * 출력: 읽어야 할 JSON 파일들의 classpath 경로 목록
     * 조건: 현재는 특정 비즈니스 퀴즈 데이터만 지원
     */
    private List<String> buildResourcePaths(QuestionFilterOptions options) {
        // 리소스 경로를 저장할 목록 초기화
        List<String> paths = new ArrayList<>();
        
        // 1단계: 퀴즈 데이터 파일들의 기본 classpath 경로
        String basePath = "classpath:static/quiz/";
        
        // 2단계: 특정 비즈니스 관련 퀴즈 데이터에 대한 조건 체크
        if (options.getKeyword() != null && options.getKeyword().equals("industry-global-business") &&
            options.getCategory() != null && options.getCategory().equals("sentence") &&
            options.getLevel() != null && options.getLevel().equals("A1")) {
            
            // 3단계: 특정 디렉토리 경로 구성 (business/industry-global-business/sentence/A1/)
            String dirPath = basePath + "business/industry-global-business/sentence/A1/";
            
            // 4단계: 순차적으로 번호가 매겨진 파일들의 경로 생성 (01부터 10까지)
            for (int i = 1; i <= 10; i++) {
                paths.add(dirPath + String.format("industry-global-business-sentence-A1-%02d.json", i));
            }
            // 추가로 특정 파일들 지정
            paths.add(dirPath + "industry-global-business-sentence-A1-001.json");
            paths.add(dirPath + "industry-global-business-sentence-A1-007.json");
        }
        
        // 최종 경로 목록 반환
        return paths;
    }

    /**
     * JSON 노드가 필터 옵션 조건을 만족하는지 확인
     * 단계: 1) 카테고리 매칭 확인 2) 키워드 매칭 확인 3) 레벨 매칭 확인 4) 최종 결과 반환
     * 입력: JSON 노드, 필터 옵션
     * 출력: 필터 조건 만족 여부 (boolean)
     * 조건: 지정된 모든 필터 조건을 만족해야 true 반환
     */
    private boolean matchesFilter(JsonNode jsonNode, QuestionFilterOptions options) {
        // 1단계: 카테고리 필터 체크 - 지정되어 있고 일치하지 않으면 false
        if (options.getCategory() != null && !options.getCategory().equals(jsonNode.get("category").asText())) {
            return false;
        }
        
        // 2단계: 키워드 필터 체크 - 지정되어 있고 일치하지 않으면 false
        if (options.getKeyword() != null && !options.getKeyword().equals(jsonNode.get("keyword").asText())) {
            return false;
        }
        
        // 3단계: 레벨 필터 체크 - 지정되어 있고 일치하지 않으면 false
        if (options.getLevel() != null && !options.getLevel().equals(jsonNode.get("level").asText())) {
            return false;
        }
        
        // 4단계: 모든 조건을 통과했으므로 true 반환
        return true;
    }

    private QuestionResponseDto mapJsonToDto(JsonNode jsonNode) {
        return QuestionResponseDto.builder()
                .questionText(jsonNode.get("question").asText())
                .majorCategory(jsonNode.get("category").asText())
                .minorCategory(jsonNode.get("category").asText())
                .questionType(jsonNode.get("category").asText())
                .level(jsonNode.get("level").asText())
                .difficultyLevel(parseDifficultyLevel(jsonNode.get("level").asText()))
                .optionA(jsonNode.get("option1").asText())
                .optionB(jsonNode.get("option2").asText())
                .optionC(jsonNode.get("option3").asText())
                .correctAnswer(convertAnswerIndexToLetter(jsonNode.get("answer").asInt()))
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