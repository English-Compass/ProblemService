# ProblemService

AI 기반 영어 학습 문제 관리 서비스입니다. 학습 세션 생성, 문제 출제, 답변 처리, 맞춤형 단어 학습을 담당합니다.

## 기술 스택

| 항목 | 내용 |
|------|------|
| 언어 | Java 17 |
| 빌드 도구 | Gradle |
| 프레임워크 | Spring Boot 3.5.4 |
| 포트 | 8082 |
| AI | Google Gemini API (gemini-2.5-flash) |
| 데이터베이스 | MySQL 8.0 |
| 캐시 | Redis (단어 학습 목록 24시간 TTL) |
| 메시징 | Kafka |

## 주요 기능

- **학습 세션 관리**: 연습, 복습, 오답노트 세션 생성 및 진행률 추적
- **AI 문제 생성**: Gemini API로 카테고리/난이도/유형별 문제 자동 생성
- **맞춤형 단어 추천**: Combined Tactic 2+3 전략으로 사용자 약점 기반 단어 목록 생성 후 Redis 캐싱
- **답변 처리**: A/B/C → 1/2/3 변환, 정답 판정, 세션 진행률 업데이트
- **Kafka 이벤트 발행**: 세션 완료 시 `learning-session-completed` 발행

## 문제 데이터

| 항목 | 내용 |
|------|------|
| 총 문제 수 | 696개 |
| 대분류 | 비즈니스, 일상생활, 학업, 여행 (4개) |
| 소분류 | 고객 서비스, 이메일, 회의, 쇼핑, 병원, 대중교통 등 (12개) |
| 문제 유형 | WORD (빈칸 채우기), SENTENCE (동의어), CONVERSATION (대화 완성) |
| 난이도 | A (초급), B (중급), C (고급) |

초기 데이터 생성: `python3 generate_quiz_inserts.py` 실행 후 생성된 SQL을 MySQL에 적용

## API 엔드포인트

### 학습 세션

| Method | 경로 | 설명 |
|--------|------|------|
| POST | `/api/learning-sessions/practice` | 연습 세션 생성 |
| POST | `/api/learning-sessions/review` | 복습 세션 생성 |
| POST | `/api/learning-sessions/wrong-answer` | 오답노트 세션 생성 |
| GET | `/api/learning-sessions/{sessionId}` | 세션 조회 |
| POST | `/api/learning-sessions/{sessionId}/start` | 세션 시작 |
| POST | `/api/learning-sessions/{sessionId}/complete` | 세션 완료 (Kafka 이벤트 발행) |
| GET | `/api/learning-sessions/{sessionId}/questions` | 세션 문제 목록 |
| GET | `/api/learning-sessions/user/{userId}` | 사용자 세션 목록 |

### 답변 제출

| Method | 경로 | 설명 |
|--------|------|------|
| POST | `/api/question-answers` | 답변 제출 (정답 판정 및 진행률 업데이트) |
| GET | `/api/question-answers/session/{sessionId}` | 세션별 답변 조회 |

### 복습 및 오답

| Method | 경로 | 설명 |
|--------|------|------|
| GET | `/api/quiz/review` | 복습 퀴즈 문제 |
| GET | `/api/quiz/wrong-answers` | 오답노트 |
| GET | `/api/quiz/users/{userId}/wrong-questions` | 사용자 오답 목록 |

### 단어 학습

| Method | 경로 | 설명 |
|--------|------|------|
| POST | `/api/word-study/generate` | 맞춤형 단어 목록 생성 (Redis 캐싱) |
| GET | `/api/word-study/today-words/{userId}` | 오늘의 단어 5개 |
| DELETE | `/api/word-study/cache/{userId}` | 단어 캐시 초기화 |

### AI 문제 생성

| Method | 경로 | 설명 |
|--------|------|------|
| POST | `/api/questions/generate` | Gemini로 문제 생성 |

### 내부 API (서비스 간 통신)

| Method | 경로 | 설명 |
|--------|------|------|
| GET | `/problem/internal/sessions/{sessionId}` | LearningService용 세션 상세 데이터 (JWT 불필요) |

## 맞춤형 단어 추천 알고리즘 (Combined Tactic 2+3)

```
사용자 전체 답변 이력 분석
  │
  ├── 카테고리/난이도별 정답률 계산
  │     └── 70% 미만: 약점 / 85% 미만: 중간 / 85% 이상: 강점
  │
  └── 단어 분배
        ├── 40% - 약점 카테고리 + 가장 어려운 난이도
        ├── 35% - 약점 카테고리 + 중간 난이도
        ├── 15% - 중간 카테고리
        └── 10% - 강점 카테고리 (자신감 유지)

→ Gemini API로 프롬프트 전송 → JSON 파싱 → Redis 24시간 캐싱
```

답변 제출(`POST /api/question-answers`) 시 해당 사용자 캐시 자동 무효화.

## Kafka 이벤트

| 토픽 | 방향 | 설명 |
|------|------|------|
| `learning-session-completed` | 발행 | 세션 완료 시 LearningService로 전달 |
| `user-profile-events` | 구독 | UserService에서 발행하는 사용자 프로필 이벤트 수신 |
| `learning-analysis-completed` | 구독 | LearningService 분석 완료 이벤트 수신 |

## 환경 변수

| 변수 | 설명 | 필수 |
|------|------|------|
| `GEMINI_API_KEY_EN` | Google Gemini API 키 | 필수 |
| `KAFKA_BOOTSTRAP_SERVERS` | Kafka 브로커 주소 | 선택 (기본값: `localhost:9092`) |
| `REDIS_HOST` | Redis 호스트 | 선택 (기본값: `localhost`) |
| `REDIS_PORT` | Redis 포트 | 선택 (기본값: `6379`) |
| `SPRING_DATASOURCE_URL` | MySQL 접속 URL | 선택 |
| `OPENAI_API_KEY` | OpenAI API 키 (레거시) | 선택 |

## 실행 방법

### 로컬 실행 (Kafka 비활성화)

```bash
# 인프라 먼저 실행 (api-gateway 디렉토리에서)
cd ../api-gateway && docker-compose up -d

cd ProblemService
export GEMINI_API_KEY_EN="your-gemini-api-key"
./gradlew bootRun --args='--spring.profiles.active=local'
```

### Docker (전체 인프라 포함)

```bash
cd ProblemService
docker-compose up --build -d
docker-compose logs -f app
```

### 초기 문제 데이터 적용

```bash
# SQL 생성 (696개 문제)
python3 generate_quiz_inserts.py

# MySQL 컨테이너에 마운트하거나 직접 실행
mysql -u problem_user -p problem_service_db < init-scripts/quiz_data_inserts.sql
```

## 프로필별 설정

| 프로필 | 데이터베이스 | Kafka |
|--------|-------------|-------|
| `local` | 로컬 MySQL | 비활성화 |
| `docker` | Docker 내 MySQL | 활성화 |

## 프로젝트 구조

```
src/main/java/com/problemservice/ProblemService/
├── controller/
│   ├── LearningSessionController.java
│   ├── QuestionAnswerController.java
│   ├── WordStudyController.java
│   ├── QuestionGenerationController.java
│   ├── QuizController.java
│   ├── ProfileController.java
│   └── InternalSessionController.java   # 서비스 간 내부 API
├── service/
│   ├── LearningSessionService.java
│   ├── QuestionAnswerService.java
│   ├── WordStudyService.java            # 단어 추천 + Redis 캐싱
│   ├── QuestionGenerationService.java   # Gemini API 연동
│   ├── OpenAIService.java
│   ├── UserProfileService.java
│   └── EventPublisherService.java       # Kafka 이벤트 발행
├── model/
│   ├── entity/
│   │   ├── Question.java
│   │   ├── LearningSession.java
│   │   ├── SessionQuestion.java
│   │   ├── QuestionAnswer.java
│   │   └── UserProfile.java
│   └── enums/
│       ├── Difficulty.java
│       └── QuestionType.java
└── consumer/
    ├── UserProfileEventConsumer.java
    └── LearningAnalysisEventConsumer.java
```

## 헬스 체크

```bash
curl http://localhost:8082/actuator/health
```

## 트러블슈팅

| 증상 | 원인 | 해결 방법 |
|------|------|-----------|
| Gemini API 오류 | API 키 미설정 또는 만료 | `GEMINI_API_KEY_EN` 환경 변수 확인 |
| 단어 생성 응답 지연 | Redis 캐시 미스 시 Gemini 호출 | 첫 호출 후 캐싱됨, 이후 빠른 응답 |
| Kafka 이벤트 미수신 | 컨슈머 그룹 오프셋 문제 | Kafka UI(`localhost:8090`)에서 컨슈머 그룹 상태 확인 |
| 문제 데이터 없음 | 초기 SQL 미적용 | `generate_quiz_inserts.py` 실행 후 SQL 적용 |
