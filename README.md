# 🎓 Problem Service - 맞춤형 영어 학습 문제 관리 서비스

> AI 기반 맞춤형 학습과 실시간 진행률 추적을 제공하는 언어 학습 마이크로서비스

[![Java](https://img.shields.io/badge/Java-17-orange.svg)](https://openjdk.org/projects/jdk/17/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.4-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-blue.svg)](https://www.mysql.com/)
[![Redis](https://img.shields.io/badge/Redis-Latest-red.svg)](https://redis.io/)
[![Kafka](https://img.shields.io/badge/Kafka-Latest-black.svg)](https://kafka.apache.org/)

---

## 📋 목차

- [프로젝트 개요](#-프로젝트-개요)
- [주요 기능](#-주요-기능)
- [기술 스택](#-기술-스택)
- [시스템 아키텍처](#-시스템-아키텍처)
- [API 엔드포인트](#-api-엔드포인트)
- [데이터베이스 스키마](#-데이터베이스-스키마)
- [시작하기](#-시작하기)
- [환경 설정](#-환경-설정)
- [주요 비즈니스 로직](#-주요-비즈니스-로직)
- [데이터 흐름](#-데이터-흐름)

---

## 🎯 프로젝트 개요

**Problem Service**는 사용자의 학습 패턴을 분석하여 맞춤형 영어 학습 경험을 제공하는 마이크로서비스입니다.

### 핵심 가치

- 🤖 **AI 기반 맞춤화**: OpenAI GPT-3.5를 활용한 개인화된 문제 생성 및 단어 추천
- 📊 **실시간 분석**: 사용자의 학습 패턴, 약점, 강점 실시간 분석
- 🎯 **적응형 학습**: Combined Tactic 2+3 전략을 통한 효율적인 학습 경로 제공
- 🔄 **이벤트 기반 아키텍처**: Kafka를 통한 확장 가능한 마이크로서비스 통신
- ⚡ **고성능 캐싱**: Redis를 활용한 빠른 응답 속도

---

## ✨ 주요 기능

### 1. 학습 세션 관리
- ✅ **연습 세션**: 사용자 레벨에 맞는 미풀이 문제 자동 선별
- ✅ **복습 세션**: 정답 맞힌 문제 중 복습 필요 문제 큐레이션
- ✅ **오답노트 세션**: 틀린 문제 우선순위 기반 재학습

### 2. AI 기반 기능
- 🤖 **문제 자동 생성**: 카테고리, 난이도, 유형별 AI 문제 생성
- 📝 **맞춤형 단어 학습**: 사용자 프로필 분석 기반 단어 목록 생성
- 🎯 **약점 분석**: 카테고리별, 난이도별, 문제 유형별 정답률 분석

### 3. 진행률 추적
- 📊 실시간 세션 진행률 추적
- 📈 학습 패턴 분석 (IMPROVING/STABLE/STRUGGLING)
- 🏆 일관성 점수 및 평균 소요 시간 측정

### 4. 고성능 최적화
- ⚡ Redis 캐싱으로 단어 학습 목록 24시간 캐시
- 🔄 Kafka 이벤트 스트리밍을 통한 비동기 처리
- 🎯 데이터베이스 쿼리 최적화

---

## 🛠 기술 스택

### Backend
- **Java 17** - 최신 Java LTS 버전
- **Spring Boot 3.5.4** - 마이크로서비스 프레임워크
- **Spring Data JPA** - ORM 및 데이터베이스 접근
- **Spring Security** - JWT 기반 인증/인가
- **Spring Validation** - 입력 검증
- **Lombok** - 보일러플레이트 코드 감소

### Database & Cache
- **MySQL 8.0** - 주 데이터베이스
- **Redis** - 캐싱 및 세션 관리

### Messaging & Integration
- **Apache Kafka** - 이벤트 스트리밍
- **OpenAI API** - AI 기반 문제 생성 및 단어 추천

### DevOps
- **Docker & Docker Compose** - 컨테이너화
- **Gradle** - 빌드 도구
- **Spring Boot Actuator** - 헬스 체크 및 모니터링

---

## 🏗 시스템 아키텍처

```
┌─────────────────────────────────────────────────────────────────┐
│                         API Gateway                             │
│                    (인증, 라우팅, 로드밸런싱)                      │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                      Problem Service                            │
│  ┌───────────────────────────────────────────────────────────┐ │
│  │  Controllers (8개)                                        │ │
│  │  • LearningSession  • QuestionAnswer  • Question          │ │
│  │  • WordStudy        • Quiz            • Profile           │ │
│  │  • QuestionGeneration • Test                              │ │
│  └───────────────────────────────────────────────────────────┘ │
│  ┌───────────────────────────────────────────────────────────┐ │
│  │  Services (15개)                                          │ │
│  │  • LearningSessionService  • QuestionAnswerService        │ │
│  │  • WordStudyService        • OpenAIService                │ │
│  │  • QuestionGenerationService • RecommendationService      │ │
│  └───────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────────┘
         │              │              │              │
         ↓              ↓              ↓              ↓
   ┌─────────┐   ┌─────────┐   ┌─────────┐   ┌─────────┐
   │  MySQL  │   │  Redis  │   │  Kafka  │   │ OpenAI  │
   │   DB    │   │  Cache  │   │ Events  │   │   API   │
   └─────────┘   └─────────┘   └─────────┘   └─────────┘
```

### 주요 컴포넌트

#### 엔티티 (Entities)
- `Question` - 퀴즈 문제 (카테고리, 난이도, 유형, 정답)
- `LearningSession` - 학습 세션 (상태, 진행률, 통계)
- `SessionQuestion` - 세션-문제 연결 (순서 관리)
- `QuestionAnswer` - 사용자 답변 (정답 여부, 소요 시간)
- `UserLearningProfile` - 사용자 학습 프로필 (약점, 강점 분석)

#### 서비스 레이어
- **LearningSessionService** - 세션 생성 및 관리, 문제 선별 로직
- **WordStudyService** - AI 기반 맞춤 단어 생성, 학습 프로필 분석
- **QuestionAnswerService** - 답변 처리, 정답 판정, 캐시 무효화
- **OpenAIService** - OpenAI API 통신
- **EventPublisherService** - Kafka 이벤트 발행

---

## 📡 API 엔드포인트

### 1. 학습 세션 관리 (`/api/learning-sessions`)

| Method | Endpoint | 설명 | 입력 | 출력 |
|--------|----------|------|------|------|
| POST | `/` | 새 세션 생성 | LearningSessionCreateDto | LearningSessionResponseDto |
| GET | `/{sessionId}` | 세션 상세 조회 | sessionId | LearningSessionResponseDto |
| PUT | `/{sessionId}` | 세션 수정 | LearningSessionUpdateDto | LearningSessionResponseDto |
| DELETE | `/{sessionId}` | 세션 삭제 | sessionId | void |
| POST | `/{sessionId}/start` | 세션 시작 | sessionId | LearningSessionResponseDto |
| POST | `/{sessionId}/complete` | 세션 완료 | sessionId | LearningSessionResponseDto |
| POST | `/{sessionId}/progress` | 진행률 업데이트 | {isCorrect: Boolean} | LearningSessionResponseDto |
| GET | `/{sessionId}/questions` | 세션 문제 목록 | sessionId | List\<SessionQuestionResponseDto\> |
| POST | `/{sessionId}/questions` | 문제 추가 | {questionId} | void |
| **세션 타입별 생성** |
| POST | `/practice` | 연습 세션 생성 | LearningSessionCreateDto | LearningSessionResponseDto |
| POST | `/review` | 복습 세션 생성 | LearningSessionCreateDto | LearningSessionResponseDto |
| POST | `/wrong-answer` | 오답노트 세션 생성 | LearningSessionCreateDto | LearningSessionResponseDto |
| **사용자별 조회** |
| GET | `/user/{userId}` | 사용자 세션 목록 | userId, Pageable | Page\<LearningSessionResponseDto\> |
| GET | `/user/{userId}/status/{status}` | 상태별 세션 조회 | userId, status | List\<LearningSessionResponseDto\> |
| GET | `/user/{userId}/type/{sessionType}` | 유형별 세션 조회 | userId, sessionType | List\<LearningSessionResponseDto\> |
| GET | `/user/{userId}/status/{status}/count` | 상태별 세션 수 | userId, status | Long |
| GET | `/user/{userId}/average-progress` | 평균 진행률 | userId | Double |
| GET | `/user/{userId}/date-range` | 기간별 세션 조회 | userId, startDate, endDate | List\<LearningSessionResponseDto\> |

### 2. 문제 답변 관리 (`/api/question-answers`)

| Method | Endpoint | 설명 | 입력 | 출력 |
|--------|----------|------|------|------|
| POST | `/` | 답변 제출 | QuestionAnswerCreateDto | QuestionAnswerResponseDto |
| GET | `/{id}` | 답변 조회 | id | QuestionAnswerResponseDto |
| GET | `/` | 전체 답변 목록 | Pageable | Page\<QuestionAnswerResponseDto\> |
| DELETE | `/{id}` | 답변 삭제 | id | void |
| GET | `/session/{sessionId}` | 세션별 답변 조회 | sessionId | List\<QuestionAnswerResponseDto\> |
| GET | `/question/{questionId}` | 문제별 답변 조회 | questionId | List\<QuestionAnswerResponseDto\> |
| GET | `/session/{sessionId}/question/{questionId}` | 세션+문제 답변 조회 | sessionId, questionId | List\<QuestionAnswerResponseDto\> |
| GET | `/session/{sessionType}` | 세션 타입별 답변 | sessionType | List\<QuestionAnswerResponseDto\> |
| GET | `/session/{sessionId}/correct/{isCorrect}` | 정답/오답 필터링 | sessionId, isCorrect | List\<QuestionAnswerResponseDto\> |

### 3. 문제 관리 (`/api/questions`)

| Method | Endpoint | 설명 | 입력 | 출력 |
|--------|----------|------|------|------|
| POST | `/` | 문제 생성 | QuestionCreateDto | QuestionResponseDto |
| GET | `/{id}` | 문제 조회 | id | QuestionResponseDto |
| GET | `/` | 문제 목록 | Pageable | Page\<QuestionResponseDto\> |
| PUT | `/{id}` | 문제 수정 | QuestionUpdateDto | QuestionResponseDto |
| DELETE | `/{id}` | 문제 삭제 | id | void |
| GET | `/category/{category}` | 카테고리별 조회 | category | List\<QuestionResponseDto\> |
| GET | `/difficulty/{level}` | 난이도별 조회 | level (1/2/3) | List\<QuestionResponseDto\> |
| GET | `/type/{type}` | 유형별 조회 | type | List\<QuestionResponseDto\> |

### 4. AI 문제 생성 (`/api/questions/generate`)

| Method | Endpoint | 설명 | 입력 | 출력 |
|--------|----------|------|------|------|
| POST | `/` | AI 문제 생성 | QuestionGenerationRequestDto | QuestionGenerationResponseDto |
| POST | `/quick` | 빠른 문제 생성 | questionType, difficulty, topic, count | QuestionGenerationResponseDto |

### 5. 맞춤형 단어 학습 (`/api/word-study`)

| Method | Endpoint | 설명 | 입력 | 출력 |
|--------|----------|------|------|------|
| POST | `/generate` | 맞춤 단어 생성 | WordStudyRequestDto | WordStudyResponseDto |
| GET | `/profile/{userId}` | 학습 프로필 분석 | userId | UserLearningProfileDto |
| POST | `/generate/category/{userId}` | 카테고리 집중 단어 | userId, category, wordCount | WordStudyResponseDto |
| POST | `/generate/difficulty/{userId}` | 난이도 집중 단어 | userId, difficulty, wordCount | WordStudyResponseDto |
| GET | `/today-words/{userId}` | 오늘의 단어 (5개) | userId | WordStudyResponseDto |
| GET | `/weakness-summary/{userId}` | 약점 영역 요약 | userId | Map |
| DELETE | `/cache/{userId}` | 캐시 무효화 | userId | Map |
| GET | `/cache/stats/{userId}` | 캐시 통계 조회 | userId | Map |
| POST | `/cache/preload/{userId}` | 캐시 사전 로딩 | userId, categories | Map |

### 6. 퀴즈 제공 (`/api/quiz`)

| Method | Endpoint | 설명 | 입력 | 출력 |
|--------|----------|------|------|------|
| GET | `/review` | 복습 퀴즈 | userId | List\<QuizQuestionDto\> |
| GET | `/wrong-answers` | 오답노트 | userId | List\<WrongAnswerQuestionDto\> |
| GET | `/user/{userId}/wrong-questions` | 틀린 문제 목록 | userId | List\<WrongAnswerQuestionDto\> |

### 7. 프로필 및 추천 (`/api/profile`)

| Method | Endpoint | 설명 | 입력 | 출력 |
|--------|----------|------|------|------|
| GET | `/analysis` | 학습 프로필 조회 | Authentication | UserLearningProfile |
| GET | `/recommendations` | 약점 카테고리 추천 | Authentication | List\<String\> |

### 8. 테스트용 API (`/api/test`)

| Method | Endpoint | 설명 |
|--------|----------|------|
| POST | `/setup-questions` | 테스트 문제 5개 생성 |
| POST | `/create-practice-session/{userId}` | 연습 세션 생성 |
| POST | `/create-review-session/{userId}` | 복습 세션 생성 |
| POST | `/create-wrong-answer-session/{userId}` | 오답노트 세션 생성 |
| POST | `/submit-answer` | 답변 제출 테스트 |
| POST | `/create-user` | 테스트 사용자 생성 |
| GET | `/user/{userId}/sessions` | 사용자 세션 목록 |
| GET | `/session/{sessionId}/questions` | 세션 문제 조회 |
| POST | `/complete-session/{sessionId}` | 세션 완료 |

---

## 🗄 데이터베이스 스키마

### 주요 테이블

#### 1. `question` - 문제
```sql
- question_id (VARCHAR, PK) - 문제 고유 ID
- question_text (TEXT) - 문제 내용
- option_a, option_b, option_c (VARCHAR) - 선택지
- correct_answer (VARCHAR) - 정답 (1/2/3)
- major_category (VARCHAR) - 주 카테고리
- minor_category (VARCHAR) - 세부 카테고리
- question_type (VARCHAR) - 문제 유형
- explanation (TEXT) - 해설
- difficulty_level (INT) - 난이도 (1=A, 2=B, 3=C)
- created_at, updated_at (TIMESTAMP)
```

#### 2. `learning_sessions` - 학습 세션
```sql
- session_id (VARCHAR, PK) - 세션 고유 ID
- user_id (VARCHAR) - 사용자 ID
- status (ENUM) - 상태 (STARTED, IN_PROGRESS, COMPLETED, CANCELLED)
- session_type (ENUM) - 유형 (PRACTICE, REVIEW, WRONG_ANSWER)
- session_metadata (TEXT) - 메타데이터 (JSON)
- total_questions (INT) - 총 문제 수
- answered_questions (INT) - 답변한 문제 수
- correct_answers (INT) - 정답 수
- wrong_answers (INT) - 오답 수
- progress_percentage (DOUBLE) - 진행률
- created_at, started_at, completed_at, updated_at (TIMESTAMP)
```

#### 3. `question_answer` - 문제 답변
```sql
- id (BIGINT, PK) - 답변 ID
- session_id (VARCHAR, FK) - 세션 ID
- question_id (VARCHAR, FK) - 문제 ID
- user_id (VARCHAR) - 사용자 ID
- session_type (VARCHAR) - 세션 타입
- user_answer (VARCHAR) - 사용자 답변
- is_correct (BIT) - 정답 여부
- time_spent (INT) - 소요 시간 (초)
- answered_at (DATETIME) - 답변 시간
- solve_count (INT) - 풀이 횟수
```

#### 4. `session_question` - 세션-문제 연결
```sql
- id (BIGINT, PK) - 연결 ID
- session_id (VARCHAR, FK) - 세션 ID
- question_id (VARCHAR, FK) - 문제 ID
- question_order (INT) - 문제 순서
```

#### 5. `user_learning_profiles` - 사용자 학습 프로필
```sql
- id (BIGINT, PK) - 프로필 ID
- user_id (VARCHAR, UNIQUE) - 사용자 ID
- weak_categories (TEXT) - 약점 카테고리 (JSON)
- strong_categories (TEXT) - 강점 카테고리 (JSON)
- category_accuracy (TEXT) - 카테고리별 정답률 (JSON)
- difficulty_accuracy (TEXT) - 난이도별 정답률 (JSON)
- learning_pattern (VARCHAR) - 학습 패턴
- last_analyzed_at (DATETIME) - 마지막 분석 시간
```

### 인덱스
- `idx_question_category` - 문제 카테고리 인덱스
- `idx_question_difficulty` - 문제 난이도 인덱스
- `idx_session_user` - 세션 사용자 인덱스
- `idx_session_status` - 세션 상태 인덱스
- `idx_answer_session` - 답변 세션 인덱스
- `idx_answer_user` - 답변 사용자 인덱스

### 카테고리 및 난이도 체계

**카테고리 (Category)**
- `학업` (school) - 과제, 수업, 학과 대화
- `비즈니스` (business) - 고객 서비스, 이메일, 회의
- `여행` (travel) - 배낭여행, 가족 여행, 친구와 여행
- `일상생활` (daily) - 쇼핑, 병원, 대중교통

**난이도 (Difficulty)**
- `A (1)` - 초급 (Beginner)
- `B (2)` - 중급 (Intermediate)
- `C (3)` - 고급 (Advanced)

**문제 유형 (Question Type)**
- `WORD` - 빈칸 채우기
- `SENTENCE` - 동의어 매칭
- `CONVERSATION` - 대화 완성

---

## 🚀 시작하기

### 사전 요구사항

```bash
# 필수
- Java 17+
- Docker & Docker Compose
- Gradle 7.0+

# 선택 (로컬 개발 시)
- MySQL 8.0
- Redis
- Kafka
```

### 1. 저장소 클론

```bash
git clone <repository-url>
cd ProblemService
```

### 2. 환경 변수 설정

프로젝트 루트에 `.env` 파일 생성:

```bash
# MySQL Database (인프라 docker-compose의 MySQL 사용)
SPRING_DATASOURCE_URL=jdbc:mysql://problem-db:3306/problem_service_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Seoul
SPRING_DATASOURCE_USERNAME=problem_service_user
SPRING_DATASOURCE_PASSWORD=problem_service_password

# Kafka (공용)
KAFKA_BOOTSTRAP_SERVERS=kafka:9092

# Redis (공용)
REDIS_HOST=redis
REDIS_PORT=6379
REDIS_DATABASE=0
REDIS_PASSWORD=

# OpenAI API (필수)
OPENAI_API_KEY=your_openai_api_key_here

# 기타 API 키 (선택)
KAKAO_API_KEY=your_kakao_api_key
GOOGLE_API_KEY=your_google_api_key
GEMINI_API_KEY=your_gemini_api_key
PERPLEXITY_API_KEY=your_perplexity_api_key
```

### 3. 데이터베이스 초기화 (선택)

**Quiz 문제 데이터 자동 생성**

```bash
# JSON 파일에서 SQL INSERT 문 생성 (696개 문제)
python3 generate_quiz_inserts.py

# 생성된 파일 확인
# - init-scripts/quiz_data_inserts.sql (696개 문제 INSERT 문)
```

**MySQL 컨테이너에 볼륨 마운트**

인프라의 `docker-compose.yml`에 다음과 같이 볼륨을 추가하면 컨테이너 시작 시 자동으로 초기화됩니다:

```yaml
services:
  problem-db:
    image: mysql:8.0
    volumes:
      # 스키마 생성 (01번으로 먼저 실행)
      - ./ProblemService/src/main/resources/DB/schema.sql:/docker-entrypoint-initdb.d/01-schema.sql
      # 문제 데이터 삽입 (02번으로 나중에 실행)
      - ./ProblemService/init-scripts/quiz_data_inserts.sql:/docker-entrypoint-initdb.d/02-quiz-data.sql
```

> **💡 Tip**: MySQL의 `/docker-entrypoint-initdb.d/` 디렉토리에 있는 `.sql` 파일은 컨테이너 최초 실행 시 알파벳 순서로 자동 실행됩니다.

**포함된 문제 데이터**:
- 📚 **4개 대분류**: 비즈니스, 일상생활, 학업, 여행
- 📖 **12개 소분류**: 고객 서비스, 이메일 보고서, 회의, 쇼핑/외식, 병원, 대중교통, 과제/시험, 수업, 학과 대화, 배낭여행, 가족여행, 친구 여행
- 🎯 **3개 문제 유형**: conversation, sentence, word
- 📊 **3개 난이도**: 초급(A), 중급(B), 고급(C)
- **총 696개 문제**

### 4. Docker Compose로 실행

```bash
# 전체 빌드 및 실행 (app 컨테이너만)
docker-compose up --build

# 백그라운드 실행
docker-compose up -d

# 로그 확인
docker-compose logs -f app

# 중지
docker-compose down
```

### 5. 로컬 개발 모드 실행

```bash
# 빌드
./gradlew clean build

# 로컬 프로필로 실행 (Kafka 비활성화)
./gradlew bootRun --args='--spring.profiles.active=local'

# Docker 프로필로 실행
./gradlew bootRun --args='--spring.profiles.active=docker'
```

### 6. 헬스 체크

```bash
# 애플리케이션 상태 확인
curl http://localhost:8082/actuator/health

# 응답 예시
{
  "status": "UP"
}
```

---

## ⚙️ 환경 설정

### 프로필별 설정

#### `application-local.properties` (로컬 개발)
```properties
# MySQL
spring.datasource.url=jdbc:mysql://localhost:3306/problem_service_db
spring.datasource.username=root
spring.datasource.password=your_password

# Kafka 비활성화 (로컬 개발 시)
spring.kafka.enabled=false

# Redis
spring.data.redis.host=localhost
spring.data.redis.port=6379
```

#### `application-docker.properties` (Docker 환경)
```properties
# MySQL (공용 인프라)
spring.datasource.url=jdbc:mysql://problem-db:3306/problem_service_db

# Kafka (공용)
spring.kafka.bootstrap-servers=kafka:9092

# Redis (공용)
spring.data.redis.host=redis
```

### 주요 설정 파일

- `src/main/resources/application.properties` - 기본 설정
- `src/main/resources/application-local.properties` - 로컬 개발
- `src/main/resources/application-docker.properties` - Docker 환경
- `src/main/resources/DB/DDL.sql` - 데이터베이스 스키마
- `docker-compose.yml` - Docker 서비스 정의

---

## 🧠 주요 비즈니스 로직

### 1. 세션 생성 전략

#### 연습 세션 (Practice Session)
```java
// 사용자 레벨과 카테고리 기반 문제 선별
- 사용자 레벨 ±1 범위의 난이도 문제 선택
- 선택한 카테고리의 미풀이 문제 우선
- 문제 유형 균형 있게 분배 (WORD, SENTENCE, CONVERSATION)
- 키워드(세부 카테고리) 필터링 지원
```

#### 복습 세션 (Review Session)
```java
// 정답 맞힌 문제 중 복습이 필요한 문제 선별
- 이전에 정답을 맞힌 문제 조회
- 카테고리별 필터링
- 기존 미시작 세션 재사용 (중복 방지)
- 최대 5개 문제 선별
```

#### 오답노트 세션 (Wrong Answer Session)
```java
// 틀린 문제 우선순위 기반 선별
- 틀린 횟수가 많은 문제 우선
- 최근에 틀린 문제 우선
- 카테고리별 필터링
- 기존 미시작 세션 재사용
```

### 2. 답변 처리 로직

```java
// QuestionAnswerService.createQuestionAnswer()
1. 답변 형식 변환: A/B/C → 1/2/3
2. 정답 자동 판정 (DB 정답과 비교)
3. QuestionAnswer 엔티티 저장
4. 세션 진행률 업데이트 (answered_questions++, correct/wrong_answers++)
5. WordStudyService 캐시 무효화 (학습 프로필 변경)
```

### 3. 맞춤형 단어 학습 알고리즘

**Combined Tactic 2+3 전략**

```java
// WordStudyService.generateWordStudyList()
1. 사용자 학습 프로필 분석
   - 카테고리별 정답률 계산
   - 난이도별 정답률 계산
   - 약점/중간/강점 카테고리 분류 (70%, 85% 기준)
   - 학습 패턴 분석 (IMPROVING/STABLE/STRUGGLING)

2. 단어 분배 전략
   - 약점 카테고리 (40%) + 가장 약한 난이도
   - 약점 카테고리 (35%) + 중간 난이도
   - 중간 카테고리 (15%)
   - 강점 카테고리 (10%) - 자신감 부스터

3. OpenAI GPT-3.5 프롬프트 생성
   - 사용자 프로필 데이터 포함
   - 카테고리/난이도 분배 요구사항
   - JSON 형식 응답 요청

4. 응답 파싱 및 캐싱
   - JSON 파싱 및 DTO 변환
   - Redis 캐시 저장 (24시간 TTL)
```

### 4. Kafka 이벤트 발행

```java
// LearningSessionService.completeSession()
1. 세션 상태를 COMPLETED로 변경
2. 진행률 최종 계산
3. SessionCompletedEventDto 생성
4. Kafka 토픽 'learning-session-completed'로 발행
5. 분석 서비스에서 이벤트 소비
```

---

## 🔄 데이터 흐름

### 1. 학습 세션 플로우

```
[사용자] 
    ↓ POST /api/learning-sessions/practice
[LearningSessionController]
    ↓ createPracticeSession()
[LearningSessionService]
    ↓ 1. 사용자 레벨 확인
    ↓ 2. 미풀이 문제 조회 (QuestionRepository)
    ↓ 3. 문제 선별 (난이도, 카테고리)
    ↓ 4. LearningSession 생성
    ↓ 5. SessionQuestion 생성 (순서 관리)
[MySQL]
    ↓ LearningSessionResponseDto 반환
[사용자]
```

### 2. 문제 풀이 플로우

```
[사용자]
    ↓ POST /api/question-answers
    ↓ {sessionId, questionId, userAnswer: "A"}
[QuestionAnswerController]
    ↓ createQuestionAnswer()
[QuestionAnswerService]
    ↓ 1. Question 조회
    ↓ 2. 답변 변환 (A→1, B→2, C→3)
    ↓ 3. 정답 판정 (question.correctAnswer == userAnswer)
    ↓ 4. QuestionAnswer 저장
    ↓ 5. LearningSession 진행률 업데이트
    ↓ 6. WordStudyService.evictCache() 호출
[Redis]
    ↓ 사용자 캐시 무효화
[MySQL]
    ↓ QuestionAnswerResponseDto 반환
[사용자]
```

### 3. 맞춤형 단어 생성 플로우

```
[사용자]
    ↓ POST /api/word-study/generate
[WordStudyController]
    ↓ generateWordStudyList()
[WordStudyService]
    ↓ 1. Redis 캐시 확인
    ├─ 캐시 HIT → 캐시된 데이터 반환
    └─ 캐시 MISS ↓
       ↓ 2. analyzeUserLearningProfile()
       ↓    - QuestionAnswer 조회
       ↓    - 카테고리/난이도 정답률 계산
       ↓    - 약점 영역 분석
       ↓ 3. buildCombinedTacticPrompt()
       ↓    - 사용자 프로필 데이터 포함
       ↓    - 분배 전략 명시
       ↓ 4. OpenAI API 호출
[OpenAI GPT-3.5]
       ↓ JSON 형식 단어 목록 생성
       ↓ 5. parseWordStudyResponse()
       ↓ 6. Redis 캐시 저장 (24시간)
[Redis]
       ↓ WordStudyResponseDto 반환
[사용자]
```

### 4. 세션 완료 및 이벤트 발행

```
[사용자]
    ↓ POST /api/learning-sessions/{sessionId}/complete
[LearningSessionController]
    ↓ completeSession()
[LearningSessionService]
    ↓ 1. LearningSession 조회
    ↓ 2. 상태 → COMPLETED
    ↓ 3. 진행률 계산
    ↓ 4. completedAt 설정
    ↓ 5. 저장
[MySQL]
    ↓ 6. publishSessionCompletedEvent()
[EventPublisherService]
    ↓ SessionCompletedEventDto 생성
    ↓ Kafka Producer 호출
[Kafka - learning-session-completed]
    ↓ 이벤트 발행
[LearningAnalysisEventConsumer]
    ↓ 이벤트 소비
    ↓ 학습 분석 처리
[분석 서비스]
```

---

## 📊 모니터링 및 로깅

### 로깅 기능

#### 1. LoggingFilter
```java
// HTTP 요청/응답 상세 로깅
- 메서드 (GET, POST, PUT, DELETE)
- URI 경로
- 클라이언트 IP
- 요청/응답 본문
- 실행 시간
- 대용량 페이로드 잘림 처리
```

#### 2. ApiLoggingAspect
```java
// AOP 기반 컨트롤러 메서드 로깅
- 메서드 진입/종료 로그
- 입력 매개변수 로깅
- 반환 값 로깅
- 예외 로깅
```

### Spring Boot Actuator

```bash
# 헬스 체크
GET /actuator/health

# 메트릭 조회
GET /actuator/metrics

# 환경 정보
GET /actuator/env
```

---

## 🧪 테스트

### 테스트용 API 활용

```bash
# 1. 테스트 사용자 생성
curl -X POST http://localhost:8082/api/test/create-user?userName=TestUser

# 2. 테스트 문제 생성 (5개)
curl -X POST http://localhost:8082/api/test/setup-questions

# 3. 연습 세션 생성
curl -X POST http://localhost:8082/api/test/create-practice-session/{userId}

# 4. 세션 문제 조회
curl http://localhost:8082/api/test/session/{sessionId}/questions

# 5. 답변 제출
curl -X POST "http://localhost:8082/api/test/submit-answer?sessionId={sessionId}&questionId={questionId}&userAnswer=A&userId={userId}"

# 6. 세션 완료
curl -X POST http://localhost:8082/api/test/complete-session/{sessionId}
```

---

## 🔐 보안

### JWT 인증
```java
// JwtAuthenticationFilter
- Authorization Bearer 토큰 검증
- SecurityContext에 인증 정보 설정
- /api/test/** 경로는 인증 제외
```

### CORS 설정
```java
// WebConfig
- 허용된 Origin 설정
- 허용된 HTTP 메서드
- 자격 증명 허용
```

---

## 📦 빌드 및 배포

### Gradle 빌드

```bash
# 전체 빌드
./gradlew clean build

# 테스트 제외 빌드
./gradlew clean build -x test

# JAR 파일 생성
./gradlew bootJar

# 빌드 결과: build/libs/ProblemService-0.0.1-SNAPSHOT.jar
```

### Docker 이미지 빌드

```bash
# Docker 이미지 빌드
docker build -t problem-service:latest .

# 이미지 실행
docker run -p 8082:8080 \
  -e SPRING_PROFILES_ACTIVE=docker \
  -e OPENAI_API_KEY=your_key \
  problem-service:latest
```

### Docker Compose 배포

```bash
# 프로덕션 배포
docker-compose up -d

# 로그 확인
docker-compose logs -f

# 스케일링
docker-compose up -d --scale app=3
```

---

## 🛣 로드맵

### 현재 버전 (v1.0)
- ✅ 학습 세션 관리
- ✅ AI 기반 문제 생성
- ✅ 맞춤형 단어 학습
- ✅ Redis 캐싱
- ✅ Kafka 이벤트 스트리밍

### 향후 계획 (v1.1)
- ⏳ GraphQL API 추가
- ⏳ 실시간 학습 분석 대시보드
- ⏳ 음성 인식 기반 발음 평가
- ⏳ 소셜 학습 기능 (친구와 경쟁)

---

## 🤝 기여

기여를 환영합니다! Pull Request를 보내주세요.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📝 라이선스

This project is licensed under the MIT License.

---

## 📧 연락처

프로젝트 관련 문의: [이메일 주소]

프로젝트 링크: [GitHub Repository URL]

---

## 🙏 감사의 말

- [Spring Boot](https://spring.io/projects/spring-boot)
- [OpenAI](https://openai.com/)
- [Apache Kafka](https://kafka.apache.org/)
- [Redis](https://redis.io/)
- [MySQL](https://www.mysql.com/)

---

**Made with ❤️ for English Learners**
