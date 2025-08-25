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

/**
 * OpenAI API를 통한 AI 기반 콘텐츠 생성 서비스
 * GPT 모델을 이용한 범용 텍스트 생성 및 퀴즈 생성 기능 제공
 * 입력: OpenAI 요청 DTO (프롬프트, 모델, 매개변수)
 * 출력: OpenAI 응답 DTO (생성된 텍스트, 토큰 사용량, 성공 여부)
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class OpenAIService {

    // OpenAI API 클라이언트 서비스
    private final OpenAiService openAiService;

    /**
     * OpenAI API를 사용하여 텍스트 생성
     * 단계: 1) 프롬프트 유효성 검증 2) 채팅 메시지 구성 3) API 요청 실행 4) 응답 처리 5) 예외 처리
     * 입력: OpenAI 요청 DTO (프롬프트, 모델, 최대 토큰, 온도)
     * 출력: OpenAI 응답 DTO (생성된 텍스트, 모델 정보, 토큰 사용량, 성공 여부)
     * 조건: 프롬프트가 비어있으면 예외 발생, API 호출 실패 시 에러 응답 반환
     */
    public OpenAIResponseDto generateResponse(OpenAIRequestDto requestDto) {
        // API 호출 시작 로그
        log.info("OpenAI API 호출 시작 - 프롬프트: {}, 모델: {}", 
                requestDto.getPrompt(), requestDto.getModel());

        // 1단계: 입력 프롬프트의 유효성 검증
        validatePrompt(requestDto.getPrompt());

        try {
            // 2단계: 사용자 레롯의 채팅 메시지 구성
            ChatMessage message = new ChatMessage();
            message.setRole("user"); // 사용자 레롬로 설정
            message.setContent(requestDto.getPrompt()); // 입력 프롬프트 설정

            // 3단계: OpenAI Chat Completion 요청 객체 구성
            ChatCompletionRequest completionRequest = ChatCompletionRequest.builder()
                    .model(requestDto.getModel()) // 사용할 GPT 모델 (예: gpt-3.5-turbo)
                    .messages(Arrays.asList(message)) // 대화 메시지 목록
                    .maxTokens(requestDto.getMaxTokens()) // 최대 생성 토큰 수
                    .temperature(requestDto.getTemperature()) // 생성 창의성 (높을수록 다양한 응답)
                    .build();

            // 4단계: OpenAI API로 채팅 완료 요청 실행
            ChatCompletionResult result = openAiService.createChatCompletion(completionRequest);
            
            // 5단계: API 응답에서 생성된 텍스트와 토큰 사용량 추출
            String response = result.getChoices().get(0).getMessage().getContent(); // 첫 번째 선택지의 생성 텍스트
            Integer tokensUsed = result.getUsage() != null ? Math.toIntExact(result.getUsage().getTotalTokens()) : null; // 총 사용 토큰 수

            // 성공 로그
            log.info("OpenAI API 호출 성공 - 사용된 토큰: {}", tokensUsed);

            // 6단계: 성공 응답 DTO 생성 및 반환
            return OpenAIResponseDto.builder()
                    .response(response) // 생성된 텍스트
                    .model(result.getModel()) // 사용된 모델
                    .tokensUsed(tokensUsed) // 사용된 토큰 수
                    .createdAt(LocalDateTime.now()) // 응답 생성 시간
                    .success(true) // 성공 플래그
                    .build();

        } catch (Exception e) {
            // 7단계: API 호출 실패 시 에러 처리
            log.error("OpenAI API 호출 실패", e);
            
            // 에러 응답 DTO 생성 및 반환
            return OpenAIResponseDto.builder()
                    .success(false) // 실패 플래그
                    .errorMessage("OpenAI API 호출 중 오류가 발생했습니다: " + e.getMessage()) // 에러 메시지
                    .createdAt(LocalDateTime.now()) // 에러 발생 시간
                    .build();
        }
    }

    /**
     * 주제와 난이도에 따라 영어 학습 퀴즈를 AI로 생성
     * 단계: 1) 입력 매개변수 로깅 2) 구조화된 프롬프트 생성 3) OpenAI 요청 DTO 구성 4) AI 생성 요청
     * 입력: 퀴즈 주제, 난이도 레벨
     * 출력: AI가 생성한 객관식 3지 선다형 퀴즈 데이터
     */
    public OpenAIResponseDto generateQuiz(String topic, String level) {
        // 1단계: 퀴즈 생성 요청 로깅
        log.info("퀴즈 생성 요청 - 주제: {}, 레벨: {}", topic, level);

        // 2단계: 퀴즈 생성을 위한 상세한 프롬프트 구성
        String prompt = String.format(
                "다음 조건으로 영어 학습 퀴즈를 1개 생성해주세요:\n" +
                "- 주제: %s\n" + // 사용자가 지정한 퀴즈 주제
                "- 난이도: %s\n" + // 사용자가 지정한 난이도 레벨
                "- 형식: 객관식 3개 선택지\n" + // 퀴즈 유형 지정
                "- 응답 형식: '문제: [문제내용] 선택지: 1) [선택지1] 2) [선택지2] 3) [선택지3] 답: [정답번호]'", // 기대하는 응답 형식
                topic, level
        );

        // 3단계: 퀴즈 생성에 적합한 OpenAI 요청 매개변수 구성
        OpenAIRequestDto requestDto = OpenAIRequestDto.builder()
                .prompt(prompt) // 구성된 프롬프트
                .model("gpt-3.5-turbo") // GPT-3.5 Turbo 모델 사용
                .maxTokens(300) // 적당한 길이의 퀴즈를 위한 토큰 제한
                .temperature(0.8) // 창의적이지만 일관성 있는 응답을 위한 온도
                .build();

        // 4단계: 구성된 요청으로 AI 퀴즈 생성 실행
        return generateResponse(requestDto);
    }

    /**
     * 입력 프롬프트의 유효성을 검증하는 내부 메소드
     * 단계: 1) 프롬프트 공백 및 null 체크 2) 조건 불만족 시 예외 발생
     * 입력: 검증할 프롬프트 문자열
     * 출력: 없음 (void) - 유효하지 않으면 예외 발생
     * 조건: 프롬프트가 null이거나 공백만 포함된 경우 IllegalArgumentException 발생
     */
    private void validatePrompt(String prompt) {
        // 1단계: 프롬프트가 null이거나 공백 문자만 포함하지 않는지 확인
        if (!StringUtils.hasText(prompt)) {
            // 2단계: 조건을 만족하지 않으면 예외 발생
            throw new IllegalArgumentException("프롬프트는 비어있을 수 없습니다");
        }
    }
}