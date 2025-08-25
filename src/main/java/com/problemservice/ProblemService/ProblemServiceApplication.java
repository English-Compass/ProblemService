package com.problemservice.ProblemService;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * ProblemService 애플리케이션의 메인 클래스
 * 언어 학습 퀴즈 문제 관리 및 학습 세션 관리 마이크로서비스
 * 기능: 문제 CRUD, 학습 세션 관리, Kafka 이벤트 발행, OpenAI 통합
 */
@SpringBootApplication
public class ProblemServiceApplication {

	/**
	 * 애플리케이션 시작점
	 * Spring Boot 애플리케이션을 초기화하고 실행
	 * 입력: 명령행 인수 배열
	 * 출력: 없음 (애플리케이션 실행)
	 */
	public static void main(String[] args) {
		// Spring Boot 애플리케이션 컨텍스트 초기화 및 실행
		SpringApplication.run(ProblemServiceApplication.class, args);
	}

}
