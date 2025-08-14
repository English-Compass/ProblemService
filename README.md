# 퀴즈 서비스 (Problem Service)

퀴즈와 문제 관리를 위한 RESTful API를 제공하는 Spring Boot 3.5.4 마이크로서비스 애플리케이션입니다.

## 주요 기능

- **퀴즈 CRUD 관리** 퀴즈 생성, 조회, 수정, 삭제 기능
 - **페이지네이션** 대용량 데이터 효율적 조회

## 기술 스택

- **Java 17**
- **Spring Boot 3.5.4**
- **Spring Data JPA** 데이터 액세스 계층
- **Spring Boot Validation** 입력 데이터 검증
- **H2 Database** 개발 및 테스트용 인메모리 데이터베이스
- **MySQL Connector 8.0.33** 프로덕션 데이터베이스
- **Spring Data Redis** 캐싱 지원
- **Spring Kafka** 메시징 지원
- **Spring Boot Actuator** 애플리케이션 모니터링
- **Lombok** 코드 단순화
- **JUnit 5 & Mockito** 테스트

## 시작하기

### 필수 조건

- Java 17 이상
- Docker 및 Docker Compose (인프라용)
- Gradle (래퍼 포함)

### 설치

1. 저장소 클론:
   ```bash
   git clone <repository-url>
   cd ProblemService
   ```

2. 애플리케이션 빌드:
   ```bash
   ./gradlew build
   ```

3. 애플리케이션 실행:
   ```bash
   ./gradlew bootRun
   ```

애플리케이션은 `http://localhost:8080` (또는 설정된 포트)에서 시작됩니다.

## 개발

### 빌드 및 테스트

```bash
# 클린 빌드
./gradlew clean build

# 모든 테스트 실행
./gradlew test

# 특정 테스트 클래스 실행
./gradlew test --tests "QuizTest"

# 특정 테스트 메서드 실행
./gradlew test --tests "QuizTest.testCreateQuizWithAllFields"

# 지속적 테스트
./gradlew test --continuous
```

### 핫 리로드

애플리케이션은 개발 중 자동 재시작을 위한 Spring Boot DevTools를 포함합니다. 코드를 변경하면 애플리케이션이 자동으로 다시 로드됩니다.

## 아키텍처

### 계층 구조

```
src/main/java/com/problemservice/ProblemService/
├── controller/     # REST API 엔드포인트
├── service/        # 비즈니스 로직 계층
├── repository/     # 데이터 액세스 계층
├── model/
│   ├── entity/     # JPA 엔티티 (Quiz, QuizCategory, QuizOptions)
│   └── dto/        # 데이터 전송 객체
├── exception/      # 예외 처리 클래스
└── config/         # 설정 클래스
```

### 인프라 구성 요소

- **H2 Database**: 개발용 인메모리 데이터베이스 (기본값)
- **MySQL**: 프로덕션 환경용 데이터베이스
- **Redis**: 캐싱 지원 (선택적)
- **Apache Kafka**: 메시징 지원 (선택적)

## API 문서

### 기본 URL
```
http://localhost:8080/api/quizzes
```

### 엔드포인트

#### 퀴즈 CRUD
```http
GET    /api/quizzes                    # 모든 퀴즈 조회 (페이지네이션)
POST   /api/quizzes                    # 새 퀴즈 생성
GET    /api/quizzes/{id}               # 특정 퀴즈 조회
PUT    /api/quizzes/{id}               # 퀴즈 수정
DELETE /api/quizzes/{id}               # 퀴즈 삭제
```

#### 필터링 및 검색
```http
GET    /api/quizzes/category/{categoryId}    # 카테고리별 퀴즈 조회
GET    /api/quizzes/difficulty/{level}       # 난이도별 퀴즈 조회
GET    /api/quizzes/type/{type}              # 문제 유형별 퀴즈 조회
```

## 설정

### 애플리케이션 속성

주요 설정 파일:
- `src/main/resources/application.properties` - 메인 설정
- `src/test/resources/application-test.properties` - 테스트 설정

### 데이터베이스 설정

#### H2 (개발용 - 기본 설정)
```properties
spring.datasource.url=jdbc:h2:mem:devdb
spring.datasource.username=sa
spring.datasource.password=
spring.h2.console.enabled=true  # http://localhost:8080/h2-console
```

#### MySQL (프로덕션용)
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/problemdb
spring.datasource.username=${DB_USERNAME:root}
spring.datasource.password=${DB_PASSWORD:password}
spring.jpa.database-platform=org.hibernate.dialect.MySQLDialect
```

### 환경 변수

| 변수 | 설명 | 기본값 |
|------|------|--------|
| `DB_USERNAME` | 데이터베이스 사용자명 | `root` |
| `DB_PASSWORD` | 데이터베이스 비밀번호 | `password` |
| `SERVER_PORT` | 서버 포트 | `8080` |

## 테스트

### 테스트 구조

```
src/test/java/com/problemservice/ProblemService/
├── controller/     # 웹 계층 테스트 (QuizControllerTest)
├── service/        # 서비스 계층 단위 테스트 (QuizServiceTest)
├── repository/     # 데이터 액세스 테스트 (QuizRepositoryTest)
├── integration/    # 통합 테스트 (QuizIntegrationTest)
├── model/entity/   # 엔티티 테스트 (QuizTest)
└── validation/     # 유효성 검증 테스트 (QuizValidationTest)
```

### 테스트 실행

```bash
# 모든 테스트
./gradlew test

# 특정 테스트 카테고리
./gradlew test --tests "*ControllerTest"
./gradlew test --tests "*ServiceTest"
./gradlew test --tests "*RepositoryTest"
./gradlew test --tests "*IntegrationTest"
```

## Docker 지원

### MySQL 데이터베이스 (프로덕션용)

```bash
# MySQL 컨테이너 실행
docker run -d \
  --name mysql-problemservice \
  -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=password \
  -e MYSQL_DATABASE=problemdb \
  mysql:8.0

# 데이터베이스 연결 확인
docker exec -it mysql-problemservice mysql -u root -p
```

### 애플리케이션 Docker 이미지

```bash
# Dockerfile 생성 후 이미지 빌드
docker build -t problemservice .

# 컨테이너 실행
docker run -p 8080:8080 problemservice
```

## 기여하기

1. 저장소 포크
2. 기능 브랜치 생성 (`git checkout -b feature/amazing-feature`)
3. 변경 사항 커밋 (`git commit -m 'Add amazing feature'`)
4. 브랜치에 푸시 (`git push origin feature/amazing-feature`)
5. Pull Request 생성

### 코드 스타일

- 표준 Java 관례 따르기
- Lombok 어노테이션을 사용하여 상용구 코드 줄이기
- 포괄적인 단위 테스트 작성
- JavaDoc으로 공개 API 문서화

## 모니터링 및 관찰가능성

[모니터링 설정 정보 추가]

- 애플리케이션 메트릭
- 상태 확인
- 로깅 설정

## 배포

[배포 지침 추가]

### 프로덕션 고려사항

- 환경별 설정
- 데이터베이스 마이그레이션
- 모니터링 및 알림
- 백업 전략

## 문제 해결

### 일반적인 문제

1. **H2 콘솔 접근 문제**
   - URL: `http://localhost:8080/h2-console`
   - JDBC URL: `jdbc:h2:mem:devdb`
   - 사용자명: `sa`, 비밀번호: (빈 값)

2. **MySQL 연결 문제**
   ```bash
   # MySQL 연결 확인
   docker exec -it mysql-problemservice mysql -u root -p
   ```

3. **빌드 문제**
   ```bash
   # 클린 및 재빌드
   ./gradlew clean build --refresh-dependencies
   ```

4. **테스트 데이터 로딩 확인**
   - `TestDataLoader.java`에서 초기 데이터 설정 확인
   - H2 콘솔에서 데이터 확인

## 라이선스

[라이선스 정보 추가]

## 지원

[지원 정보 추가]

- 저장소에 이슈 생성
- 개발팀에 문의
- 문서 위키 확인