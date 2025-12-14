# ProblemService Internal Session API 구현 완료

## ✅ 구현 완료 체크리스트

### API 엔드포인트
- [x] **GET `/api/problem/internal/sessions/{sessionId}?userId={userId}`** 엔드포인트 구현
- [x] Path Variable로 `sessionId` 받기
- [x] Query Parameter로 `userId` 받기
- [x] ResponseEntity로 응답 래핑

### 보안 및 검증
- [x] 세션 존재 여부 검증
- [x] **userId 일치 여부 검증** (보안 - 다른 사용자 세션 정보 노출 방지)
- [x] 불일치 시 404 반환 (존재하지 않는 것처럼 처리)

### 데이터 조회 최적화
- [x] **N+1 문제 해결**: `@Query` + `LEFT JOIN FETCH`로 Question과 함께 조회
- [x] **정렬**: `answeredAt` 기준 오름차순 정렬 (시간 순서대로)
- [x] 세션 이벤트 조회 (KafkaEventLog)

### 응답 데이터 구조
- [x] **session**: 세션 메타데이터 (sessionId, userId, sessionType, status, timestamps, metadata)
- [x] **questions[]**: 문제 + 답변 데이터 배열
  - questionId, questionType, majorCategory, minorCategory, difficultyLevel
  - userAnswer, isCorrect, timeSpent, answeredAt, solveCount
  - metadata (questionText, options, explanation)
- [x] **events[]**: 세션 이벤트 로그 배열 (선택 사항)

### 에러 처리
- [x] 세션 없음: HTTP 404 (EntityNotFoundException)
- [x] userId 불일치: HTTP 404 (보안)
- [x] 잘못된 파라미터: HTTP 400 (Validation)

---

## 📂 구현된 파일

### 1. Controller
**파일**: `src/main/java/com/problemservice/ProblemService/controller/InternalSessionController.java`

```java
@RestController
@RequestMapping("/api/problem/internal/sessions")
@RequiredArgsConstructor
@Validated
public class InternalSessionController {

    private final LearningSessionAnalysisService sessionAnalysisService;

    @GetMapping("/{sessionId}")
    public ResponseEntity<SessionAnalysisResponseDto> getSessionForAnalysis(
            @PathVariable String sessionId,
            @RequestParam @NotBlank String userId) {

        SessionAnalysisResponseDto response = sessionAnalysisService.getSessionAnalysisData(sessionId, userId);
        return ResponseEntity.ok(response);
    }
}
```

### 2. Service
**파일**: `src/main/java/com/problemservice/ProblemService/service/LearningSessionAnalysisService.java`

**주요 기능**:
- 세션 조회 및 userId 검증
- N+1 문제 해결 (JOIN FETCH)
- answeredAt 기준 정렬
- 엔티티 → DTO 변환
- metadata JSON 파싱

### 3. Repository
**파일**: `src/main/java/com/problemservice/ProblemService/repository/QuestionAnswerRepository.java`

**추가된 메서드**:
```java
@Query("SELECT qa FROM QuestionAnswer qa LEFT JOIN FETCH qa.question WHERE qa.sessionId = :sessionId ORDER BY qa.answeredAt ASC")
List<QuestionAnswer> findBySessionIdWithQuestion(@Param("sessionId") String sessionId);
```

### 4. DTO
**파일**: `src/main/java/com/problemservice/ProblemService/model/dto/SessionAnalysisResponseDto.java`

**구조**:
- `SessionInfo` (내부 클래스)
- `QuestionRecord` (내부 클래스)
- `EventRecord` (내부 클래스)

---

## 🧪 테스트 방법

### 1. 정상 케이스
```bash
curl -X GET "http://localhost:8080/api/problem/internal/sessions/S-20241124-001?userId=USER-123"
```

**예상 응답 (200 OK)**:
```json
{
  "session": {
    "sessionId": "S-20241124-001",
    "userId": "USER-123",
    "sessionType": "PRACTICE",
    "status": "COMPLETED",
    "startedAt": "2025-11-24T10:00:00",
    "completedAt": "2025-11-24T10:25:30",
    "createdAt": "2025-11-24T09:55:00",
    "updatedAt": "2025-11-24T10:25:30",
    "metadata": {}
  },
  "questions": [
    {
      "questionId": "Q-10001",
      "questionType": "WORD",
      "majorCategory": "school",
      "minorCategory": "attending-class",
      "difficultyLevel": 2,
      "userAnswer": "B",
      "isCorrect": true,
      "timeSpent": 42,
      "answeredAt": "2025-11-24T10:05:12",
      "solveCount": 1,
      "metadata": {
        "questionText": "...",
        "optionA": "...",
        "optionB": "...",
        "optionC": "...",
        "explanation": "..."
      }
    }
  ],
  "events": [
    {
      "eventId": "...",
      "eventType": "SESSION_COMPLETED",
      "sessionId": "S-20241124-001",
      "userId": "USER-123",
      "sessionType": "PRACTICE",
      "createdAt": "2025-11-24T10:25:30",
      "metadata": {}
    }
  ]
}
```

### 2. 세션 없음 (404)
```bash
curl -X GET "http://localhost:8080/api/problem/internal/sessions/INVALID-SESSION?userId=USER-123"
```

**예상 응답 (404 NOT_FOUND)**:
```json
{
  "error": "Entity Not Found",
  "message": "Learning Session not found: INVALID-SESSION",
  "status": 404,
  "timestamp": "2025-11-24T10:30:00"
}
```

### 3. userId 불일치 (404)
```bash
curl -X GET "http://localhost:8080/api/problem/internal/sessions/S-20241124-001?userId=WRONG-USER"
```

**예상 응답 (404 NOT_FOUND)**:
```json
{
  "error": "Entity Not Found",
  "message": "Learning Session not found: S-20241124-001",
  "status": 404,
  "timestamp": "2025-11-24T10:30:00"
}
```

### 4. userId 파라미터 누락 (400)
```bash
curl -X GET "http://localhost:8080/api/problem/internal/sessions/S-20241124-001"
```

**예상 응답 (400 BAD_REQUEST)**:
```json
{
  "error": "Bad Request",
  "message": "Required parameter 'userId' is missing",
  "status": 400,
  "timestamp": "2025-11-24T10:30:00"
}
```

---

## 🔍 성능 최적화

### 1. N+1 문제 해결
- **문제**: QuestionAnswer 조회 시 각 답변마다 Question을 개별 조회
- **해결**: `LEFT JOIN FETCH`로 한 번의 쿼리로 모든 데이터 조회

**Before**:
```sql
SELECT * FROM question_answer WHERE session_id = ?;  -- 1번
SELECT * FROM question WHERE question_id = ?;        -- N번 (각 답변마다)
```

**After**:
```sql
SELECT qa.*, q.* 
FROM question_answer qa 
LEFT JOIN question q ON qa.question_id = q.question_id 
WHERE qa.session_id = ? 
ORDER BY qa.answered_at ASC;  -- 1번만
```

### 2. 정렬 최적화
- DB 레벨에서 `ORDER BY answered_at ASC` 수행
- 애플리케이션 레벨 정렬 불필요

### 3. 인덱스 활용
- `question_answer.session_id`: 인덱스 활용
- `question_answer.answered_at`: 정렬 최적화

---

## 📊 데이터 흐름

```
LearningService (외부)
    ↓ HTTP GET /api/problem/internal/sessions/{sessionId}?userId={userId}
InternalSessionController
    ↓ getSessionForAnalysis()
LearningSessionAnalysisService
    ↓ getSessionAnalysisData()
    ├─ LearningSessionRepository.findById()
    ├─ QuestionAnswerRepository.findBySessionIdWithQuestion() [JOIN FETCH + ORDER BY]
    └─ KafkaEventLogService.getSessionEvents()
    ↓ 엔티티 → DTO 변환
SessionAnalysisResponseDto
    ↓ JSON 응답
LearningService (외부)
```

---

## 🔐 보안 고려사항

1. **userId 검증**: 세션의 userId와 요청 파라미터의 userId가 일치하는지 확인
2. **404 반환**: 불일치 시 403이 아닌 404 반환 (세션 존재 여부 노출 방지)
3. **내부 API**: `/internal/` 경로로 외부 노출 방지 권장
4. **네트워크 레벨 보안**: API Gateway 또는 방화벽에서 내부 서비스만 접근 가능하도록 설정

---

## 📝 추가 개선 사항 (선택)

### 1. 캐싱
- Redis 캐싱으로 반복 조회 성능 향상
- TTL: 5분 (세션 완료 후 변경 가능성 낮음)

### 2. 페이징
- 문제 수가 많은 경우 페이징 지원
- `?page=0&size=20`

### 3. 필드 선택
- 필요한 필드만 조회
- `?fields=session,questions`

### 4. 압축
- Gzip 압축으로 네트워크 트래픽 감소

---

## ✅ 최종 확인

- [x] API 엔드포인트 정상 작동
- [x] userId 검증 로직 작동
- [x] N+1 문제 해결
- [x] 정렬 (answeredAt ASC) 적용
- [x] 에러 처리 완료
- [x] DTO 구조 요구사항 충족
- [x] 보안 고려사항 반영

**구현 완료일**: 2025-12-14
**구현자**: AI Assistant
**상태**: ✅ 완료

