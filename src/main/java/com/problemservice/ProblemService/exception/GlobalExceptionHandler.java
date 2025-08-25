package com.problemservice.ProblemService.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * 애플리케이션 전역 예외 처리기
 * REST API에서 발생하는 다양한 예외를 일관된 형태로 처리
 * 입력: 다양한 유형의 예외 객체
 * 출력: HTTP 상태 코드와 에러 정보가 포함된 응답 엔티티
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 런타임 예외 처리
     * 단계: 1) 예외 메시지로 HTTP 상태 코드 결정 2) 에러 응답 객체 생성 3) HTTP 응답 반환
     * 입력: RuntimeException 및 그 하위 예외
     * 출력: 에러 정보가 포함된 HTTP 응답
     */
    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity<ErrorResponse> handleRuntimeException(RuntimeException ex) {
        // 1단계: 예외 메시지 내용을 분석하여 적절한 HTTP 상태 코드 결정
        HttpStatus status = determineHttpStatus(ex.getMessage());
        // 2단계: 에러 응답 객체 생성
        ErrorResponse errorResponse = ErrorResponse.builder()
                .message(ex.getMessage()) // 예외 메시지
                .status(status.value()) // HTTP 상태 코드
                .timestamp(LocalDateTime.now()) // 에러 발생 시간
                .build();
        // 3단계: 결정된 상태 코드와 에러 응답으로 HTTP 응답 반환
        return ResponseEntity.status(status).body(errorResponse);
    }

    /**
     * Bean Validation 예외 처리 (@Valid 어노테이션 검증 실패 시)
     * 단계: 1) 검증 오류 맵 초기화 2) 모든 필드 오류 수집 3) 유효성 에러 응답 객체 생성 4) HTTP 400 응답 반환
     * 입력: MethodArgumentNotValidException (요청 데이터 검증 실패)
     * 출력: 필드별 에러 메시지가 포함된 HTTP 400 응답
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ValidationErrorResponse> handleValidationException(MethodArgumentNotValidException ex) {
        // 1단계: 필드별 에러 메시지를 저장할 맵 초기화
        Map<String, String> errors = new HashMap<>();
        // 2단계: 모든 검증 오류를 순회하며 필드명과 에러 메시지 추출
        ex.getBindingResult().getAllErrors().forEach((error) -> {
            String fieldName = ((FieldError) error).getField(); // 에러가 발생한 필드 명
            String errorMessage = error.getDefaultMessage(); // 해당 필드의 에러 메시지
            errors.put(fieldName, errorMessage); // 맵에 저장
        });

        // 3단계: 수집된 에러 정보로 유효성 에러 응답 객체 생성
        ValidationErrorResponse errorResponse = ValidationErrorResponse.builder()
                .message("Validation failed") // 에러 전체 메시지
                .status(HttpStatus.BAD_REQUEST.value()) // HTTP 400 상태 코드
                .timestamp(LocalDateTime.now()) // 에러 발생 시간
                .errors(errors) // 필드별 에러 세부 내용
                .build();

        // 4단계: HTTP 400 Bad Request로 에러 응답 반환
        return ResponseEntity.badRequest().body(errorResponse);
    }

    /**
     * 예외 메시지 내용에 따라 적절한 HTTP 상태 코드 결정
     * 단계: 1) "not found" 문자열 포함 여부 확인 2) 조건에 따라 상태 코드 반환
     * 입력: 예외 메시지 문자열
     * 출력: HTTP 상태 코드 (404 또는 400)
     * 조건: "not found" 포함 시 404, 그 외에는 400 반환
     */
    private HttpStatus determineHttpStatus(String message) {
        // 1단계: 예외 메시지에 "not found" 문자열이 포함되어 있는지 확인
        if (message.contains("not found")) {
            // 2단계: 리소스를 찾을 수 없는 경우 HTTP 404 Not Found 반환
            return HttpStatus.NOT_FOUND;
        }
        // 3단계: 그 외의 모든 경우는 HTTP 400 Bad Request 반환
        return HttpStatus.BAD_REQUEST;
    }
}