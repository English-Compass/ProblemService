package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.dto.OpenAIRequestDto;
import com.problemservice.ProblemService.model.dto.OpenAIResponseDto;
import com.theokanning.openai.completion.chat.ChatCompletionRequest;
import com.theokanning.openai.completion.chat.ChatCompletionResult;
import com.theokanning.openai.completion.chat.ChatMessage;
import com.theokanning.openai.service.OpenAiService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.Arrays;

@Service
@RequiredArgsConstructor
@Slf4j
public class OpenAIService {

    private final OpenAiService openAiService;

    /**
     * OpenAI API를 호출하여 응답을 생성합니다. 출력 형식은 JSON입니다.
     * 
     * @param requestDto OpenAI 요청 데이터 (프롬프트, 모델, 최대 토큰 수, 온도)
     * @return OpenAI API 응답 데이터
     * @throws IllegalArgumentException 프롬프트가 비어있거나 null인 경우
     */
    public OpenAIResponseDto generateResponse(OpenAIRequestDto requestDto) {
        log.info("OpenAI API 호출 시작 - 프롬프트: {}, 모델: {}", 
                requestDto.getPrompt(), requestDto.getModel());

        validatePrompt(requestDto.getPrompt());

        try {
            ChatMessage message = new ChatMessage();
            message.setRole("user");
            message.setContent(requestDto.getPrompt());

            ChatCompletionRequest completionRequest = ChatCompletionRequest.builder()
                    .model(requestDto.getModel())
                    .messages(Arrays.asList(message))
                    .maxTokens(requestDto.getMaxTokens())
                    .temperature(requestDto.getTemperature())
                    .build();

            ChatCompletionResult result = openAiService.createChatCompletion(completionRequest);
            
            String response = result.getChoices().get(0).getMessage().getContent();
            Integer tokensUsed = result.getUsage() != null ? Math.toIntExact(result.getUsage().getTotalTokens()) : null;

            log.info("OpenAI API 호출 성공 - 사용된 토큰: {}", tokensUsed);

            return OpenAIResponseDto.builder()
                    .response(response)
                    .model(result.getModel())
                    .tokensUsed(tokensUsed)
                    .createdAt(LocalDateTime.now())
                    .success(true)
                    .build();

        } catch (Exception e) {
            log.error("OpenAI API 호출 실패", e);
            
            return OpenAIResponseDto.builder()
                    .success(false)
                    .errorMessage("OpenAI API 호출 중 오류가 발생했습니다: " + e.getMessage())
                    .createdAt(LocalDateTime.now())
                    .build();
        }
    }

    /**
     * 주제와 레벨, 문제유형을 기반으로 퀴즈를 생성합니다.
     * 
     * @param topic 퀴즈 주제
     * @param level 난이도 레벨 (A1, A2, B1, B2, C1, C2)
     * @return 생성된 퀴즈가 포함된 OpenAI 응답
     */
    public OpenAIResponseDto generateQuiz(String topic, String level) {
        log.info("퀴즈 생성 요청 - 주제: {}, 레벨: {}", topic, level);

        String prompt = String.format(
                "다음 조건으로 영어 학습 퀴즈를 1개 생성해주세요:\n" +
                "- 주제: %s\n" +
                "- 난이도: %s\n" +
                "- 형식: 객관식 3개 선택지\n" +
                "- 응답 형식: '문제: [문제내용] 선택지: 1) [선택지1] 2) [선택지2] 3) [선택지3] 답: [정답번호]'",
                topic, level
        );

        OpenAIRequestDto requestDto = OpenAIRequestDto.builder()
                .prompt(prompt)
                .model("gpt-3.5-turbo")
                .maxTokens(300)
                .temperature(0.8)
                .build();

        return generateResponse(requestDto);
    }

    /**
     * 프롬프트의 유효성을 검증합니다
     * 
     * @param prompt 검증할 프롬프트
     * @throws IllegalArgumentException 프롬프트가 비어있거나 null인 경우
     */
    private void validatePrompt(String prompt) {
        if (!StringUtils.hasText(prompt)) {
            throw new IllegalArgumentException("프롬프트는 비어있을 수 없습니다");
        }
    }
}