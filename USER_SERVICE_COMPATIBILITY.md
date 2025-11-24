# UserService와 ProblemService 호환성 검토

## 🔍 발견된 문제점

### 1. ⚠️ Serializer/Deserializer 불일치

**UserService (발행)**
- `KafkaTemplate<String, String>` 사용
- `StringSerializer` 사용
- JSON 문자열로 직렬화해서 전송

**ProblemService (수신)**
- `JsonDeserializer` 사용
- 객체로 역직렬화 시도

**상태**: ✅ **호환 가능** - JsonDeserializer는 JSON 문자열을 객체로 변환 가능

### 2. ✅ 토픽 이름 일치

**UserService**
```properties
spring.kafka.topic.user-profile=user-profile-events
```

**ProblemService**
```properties
spring.kafka.topic.user-profile=user-profile-events
```

**상태**: ✅ **일치함**

### 3. ✅ Kafka Bootstrap Servers 설정

**UserService (Docker)**
```properties
spring.kafka.bootstrap-servers=${KAFKA_BOOTSTRAP_SERVERS:kafka:9092}
```

**ProblemService (Docker)**
```properties
spring.kafka.bootstrap-servers=${KAFKA_BOOTSTRAP_SERVERS:localhost:9092}
```

**상태**: ⚠️ **환경변수로 동일하게 설정 가능** - `KAFKA_BOOTSTRAP_SERVERS` 환경변수로 통일

### 4. ⚠️ UserProfileEvent DTO 필드 차이

**UserService가 보내는 필드:**
```java
- userId: String
- categories: Map<String, List<String>>
- difficulty: Integer
- updatedAt: LocalDateTime
- eventType: String (DIFFICULTY, CATEGORIES)
```

**ProblemService가 기대하는 필드:**
```java
- userId: String ✅
- categories: Map<String, List<String>> ✅
- difficulty: Integer ✅
- difficultyLevel: Integer (하위 호환성) ✅
- selectedCategories: List<String> (하위 호환성) ✅
- preferredQuestionTypes: List<String> (선택) ✅
- updatedAt: LocalDateTime ✅
- eventType: String ✅
- eventTimestamp: LocalDateTime (하위 호환성) ✅
- eventSource: String (선택) ✅
```

**상태**: ✅ **호환 가능** - ProblemService가 null 체크로 처리 가능

### 5. ⚠️ EventType 불일치 가능성

**UserService가 보내는 eventType:**
- `"DIFFICULTY"`
- `"CATEGORIES"`

**ProblemService가 처리하는 eventType:**
- `"PROFILE_CREATED"`
- `"PROFILE_UPDATED"`
- `"DIFFICULTY"` ✅
- `"CATEGORIES"` ✅
- `"PROFILE_DELETED"`

**상태**: ✅ **호환 가능** - ProblemService가 DIFFICULTY와 CATEGORIES를 처리함

## 🔧 수정 필요 사항

### 1. ProblemService의 JsonDeserializer 설정 확인

현재 설정:
```java
configProps.put(JsonDeserializer.USE_TYPE_INFO_HEADERS, false);
// VALUE_DEFAULT_TYPE 제거 - @Payload의 타입을 자동으로 인식하도록 함
```

**문제**: JsonDeserializer가 String을 받아서 객체로 변환할 때 타입 정보가 없으면 실패할 수 있음

**해결책**: JsonDeserializer에 타입 정보 명시
```java
configProps.put(JsonDeserializer.VALUE_DEFAULT_TYPE, UserProfileEvent.class);
```

또는 Consumer에서 명시적으로 타입 지정:
```java
@KafkaListener(
    topics = "${spring.kafka.topic.user-profile:user-profile-events}",
    groupId = "${spring.kafka.consumer.group-id:problem-service-group}",
    containerFactory = "kafkaListenerContainerFactory"
)
public void consumeUserProfileEvent(
    @Payload UserProfileEvent event,  // 타입이 명시되어 있음
    ...
)
```

**현재 상태**: ✅ **문제 없음** - @Payload에 타입이 명시되어 있어서 자동 인식 가능

### 2. 환경변수 확인

**Docker Compose에서 확인 필요:**
```yaml
# UserService
KAFKA_BOOTSTRAP_SERVERS=kafka:9092

# ProblemService  
KAFKA_BOOTSTRAP_SERVERS=kafka:9092  # 동일한 Kafka 서버 사용
```

**상태**: ✅ **일치해야 함** - 같은 Kafka 클러스터 사용

## 📋 체크리스트

### UserService 발행 확인
- [x] 토픽 이름: `user-profile-events` ✅
- [x] Serializer: `StringSerializer` ✅
- [x] 메시지 형식: JSON 문자열 ✅
- [x] 이벤트 타입: `DIFFICULTY`, `CATEGORIES` ✅

### ProblemService 수신 확인
- [x] 토픽 이름: `user-profile-events` ✅
- [x] Deserializer: `JsonDeserializer` ✅
- [x] Consumer Group: `problem-service-group` ✅
- [x] 이벤트 타입 처리: `DIFFICULTY`, `CATEGORIES` ✅

### 환경 설정 확인
- [ ] Kafka Bootstrap Servers 동일한지 확인
- [ ] Consumer Group이 중복되지 않는지 확인
- [ ] 네트워크 연결 확인 (같은 Docker 네트워크)

## 🚨 잠재적 문제

### 1. Deserialization 실패 가능성

UserService가 보내는 JSON 문자열이 JsonDeserializer에 의해 제대로 파싱되지 않을 수 있음.

**증상:**
- Consumer에서 `DeserializationException` 발생
- 로그에 "Error processing Kafka record" 메시지

**해결책:**
- Consumer의 에러 핸들러에서 로그 확인
- 실제 전송되는 JSON 형식 확인

### 2. Consumer Group Offset 문제

이미 다른 Consumer가 같은 group-id로 메시지를 소비했다면, ProblemService가 메시지를 받지 못할 수 있음.

**해결책:**
- Consumer group 리셋
- 새로운 group-id 사용

## ✅ 결론

**대부분 호환 가능하지만, 다음을 확인해야 함:**

1. **Kafka Bootstrap Servers가 동일한지 확인**
2. **실제 메시지가 전송되는지 확인** (UserService 로그)
3. **Consumer가 메시지를 받는지 확인** (ProblemService 로그)
4. **Deserialization 에러가 없는지 확인** (에러 로그)

## 🔍 디버깅 명령어

### UserService에서 메시지 발행 확인
```bash
docker logs <user-service-container> | grep "KAFKA.*이벤트 발행"
```

### ProblemService에서 메시지 수신 확인
```bash
docker logs problem-service-app | grep "Received user profile event"
```

### Kafka 토픽에서 직접 확인
```bash
docker exec -it <kafka-container> kafka-console-consumer.sh \
  --bootstrap-server localhost:9092 \
  --topic user-profile-events \
  --from-beginning \
  --max-messages 10
```

