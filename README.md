# ProblemService

언어 학습 퀴즈 문제와 학습 세션을 관리하는 Java Spring Boot 마이크로서비스입니다.

## 개요

ProblemService는 언어 학습 문제에 대한 CRUD 작업을 제공하고, 학습 세션을 관리하며, Kafka 메시징과 OpenAI API를 통해 외부 시스템과 통합하여 AI 기반 기능을 제공합니다. 이 서비스는 포괄적인 진행률 추적과 함께 다양한 유형의 언어 학습 활동을 지원하도록 설계되었습니다.

## 주요 기능

- **문제 관리**: 카테고리, 난이도, 유형별 필터링을 통한 CRUD 작업
- **학습 세션**: 다양한 유형(연습, 복습, 오답)의 세션 생명주기 관리
- **진행률 추적**: 사용자 진행률과 세션 완료 모니터링
- **AI 통합**: 향상된 기능을 위한 OpenAI API 통합
- **이벤트 스트리밍**: 세션 완료 이벤트를 위한 Kafka 메시징
- **포괄적인 로깅**: API 요청/응답 추적 및 AOP 기반 메서드 로깅
- **정적 퀴즈 데이터**: 퀴즈 문제를 위한 계층적 JSON 구조
- **다중 세션 유형**: 다양한 학습 모드 지원

## 기술 스택

- **Java 17**
- **Spring Boot 3.5.4**
- **Spring Data JPA**
- **MySQL 8.0**
- **Kafka** 이벤트 스트리밍
- **OpenAI API** 통합
- **Docker & Docker Compose**
- **Gradle** 빌드 시스템
- **Lombok** 코드 간소화
- **Bean Validation** 입력 검증

## 빠른 시작

### 사전 요구사항
- Java 17
- Docker and Docker Compose
- 환경 변수:
  - `OPENAI_API_KEY` (AI 기능에 필요)
  - `KAFKA_BOOTSTRAP_SERVERS` (선택사항)

### 개발 환경 설정

1. **저장소 복제**
   ```bash
   git clone <repository-url>
   cd ProblemService
   ```

2. **Docker Compose로 실행** (권장)
   ```bash
   # MySQL 데이터베이스와 함께 빌드 및 실행
   docker-compose up --build
   
   # 데이터베이스만 실행
   docker-compose up db
   
   # 모든 서비스 중지
   docker-compose down
   ```

3. **MySQL 데이터베이스로 로컬 실행**
   ```bash
   # MySQL 데이터베이스가 실행 중인지 확인 후
   ./gradlew bootRun
   ```

### 빌드 명령어

```bash
# 프로젝트 빌드
./gradlew build

# 클린 빌드
./gradlew clean build

# 테스트 없이 빌드 (테스트는 현재 주석 처리됨)
./gradlew build -x test

# 애플리케이션 실행
./gradlew bootRun
```

## API 엔드포인트

### 문제 (Questions)
- `GET /api/questions` - 필터링을 통한 문제 목록 조회
- `POST /api/questions` - 새 문제 생성
- `GET /api/questions/{id}` - ID로 문제 조회
- `PUT /api/questions/{id}` - 문제 업데이트
- `DELETE /api/questions/{id}` - 문제 삭제

### 학습 세션 (Learning Sessions)
- `POST /api/learning-sessions` - 새 세션 생성
- `GET /api/learning-sessions/{id}` - 세션 상세 정보 조회
- `PUT /api/learning-sessions/{id}` - 세션 업데이트
- `POST /api/learning-sessions/{id}/complete` - 세션 완료

### 문제 답변 (Question Answers)
- 답변 제출 및 추적 엔드포인트

## 데이터 구조

### 문제 카테고리
- 학업 (Academic)
- 비즈니스 (Business)
- 여행 (Travel)
- 일상생활 (Daily Life)

### 난이도 수준
- **A**: 초급 (Beginner)
- **B**: 중급 (Intermediate)
- **C**: 고급 (Advanced)

### 문제 유형
- **Word**: 빈칸 채우기 문제
- **Sentence**: 유의어 매칭 문제

## 데이터베이스

### 데이터베이스 환경
- **MySQL 8.0** with Docker
- 초기화 스크립트는 `init-scripts/` 디렉토리에 위치

## 설정

주요 설정 파일:
- `src/main/resources/application.properties` - 메인 설정
- `src/main/resources/application-docker.properties` - Docker 전용 설정
- `docker-compose.yml` - Docker 서비스 설정
- `init-scripts/question_data.sql` - 데이터베이스 초기화
- `src/main/resources/static/quiz/` - 계층적 JSON 구조의 정적 퀴즈 데이터

## 아키텍처

### 핵심 엔티티
- **Question**: 카테고리와 난이도를 포함한 퀴즈 문제
- **LearningSession**: 진행률 추적을 포함한 사용자 학습 세션
- **SessionQuestion**: 순서와 함께 세션을 문제에 연결
- **QuestionAnswer**: 사용자 응답과 답변 추적

### 서비스
- **QuestionService**: 필터링을 포함한 문제 CRUD 작업
- **LearningSessionService**: 세션 생명주기 관리 및 진행률 추적
- **SessionQuestionService**: 문제-세션 연관 관리
- **QuestionAnswerService**: 사용자 답변 제출 및 추적
- **QuestionReadingService**: JSON 파일에서 퀴즈 데이터 로딩
- **OpenAIService**: 설정 가능한 타임아웃을 포함한 AI 통합
- **EventPublisherService**: 완료된 세션에 대한 Kafka 이벤트 발행

## 헬스 체크

애플리케이션 상태 확인: http://localhost:8080/actuator/health

## 개발 참고사항

- 코드 간소화를 위한 Lombok 사용
- 입력 검증을 위한 Bean Validation
- `@ControllerAdvice`를 통한 전역 예외 처리
- Kafka를 활용한 이벤트 기반 아키텍처
- 요청/응답 추적을 포함한 포괄적인 API 로깅
- RESTful API 설계 원칙
- **테스팅**: `build.gradle`에서 테스트 의존성이 현재 주석 처리됨
- Redis 의존성이 포함되어 있지만 활성 구성되지 않음
- 초기화 스크립트를 통한 데이터베이스 마이그레이션 처리

### 로깅 기능
- **LoggingFilter**: 메서드, URI, 클라이언트 IP, 본문 내용을 포함한 HTTP 요청/응답 상세 정보 캡처
- **ApiLoggingAspect**: 입력 매개변수와 반환 값을 포함한 컨트롤러 메서드 진입/종료에 대한 AOP 기반 로깅
- 실행 시간과 디버깅을 위한 명확한 시작/끝 마커가 있는 구조화된 형식을 포함한 로그
- 대용량 페이로드에 대한 잘라내기 기능을 포함한 요청/응답 본문 로깅

### 세션 유형
서비스는 여러 학습 세션 유형을 지원합니다:
- **Practice**: 일반 학습 세션
- **Review**: 이전에 답변한 문제 복습
- **Wrong-answer**: 잘못 답변한 문제에 집중