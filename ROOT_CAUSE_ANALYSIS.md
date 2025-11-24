# 근본 원인 분석

## 🔴 가장 가능성 높은 원인

### 문제: JsonDeserializer가 StringSerializer로 보낸 메시지를 파싱하지 못함

**UserService (발행)**
- `StringSerializer` 사용
- JSON 문자열을 UTF-8 바이트로 변환해서 전송
- 예: `{"userId":"123","difficulty":2,...}` → UTF-8 바이트 배열

**ProblemService (수신)**
- `JsonDeserializer` 사용
- 바이트 배열을 직접 JSON으로 파싱 시도
- **문제**: JsonDeserializer는 바이트 배열을 JSON으로 파싱하려고 하는데, StringSerializer가 보낸 바이트는 이미 UTF-8 인코딩된 문자열입니다.

**결과**: DeserializationException 발생 → ErrorHandlingDeserializer가 조용히 처리 → 메시지가 Consumer에 도달하지 않음

## 🔧 해결 방법

### 방법 1: StringDeserializer + 수동 JSON 파싱 (권장)

JsonDeserializer 대신 StringDeserializer를 사용하고, Consumer에서 수동으로 JSON 파싱:

```java
// KafkaConfig.java
configProps.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
```

```java
// UserProfileEventConsumer.java
@KafkaListener(...)
public void consumeUserProfileEvent(
    @Payload String message,  // String으로 받음
    ...
) {
    try {
        UserProfileEvent event = objectMapper.readValue(message, UserProfileEvent.class);
        // 처리...
    } catch (JsonProcessingException e) {
        log.error("Failed to parse user profile event: {}", message, e);
    }
}
```

### 방법 2: UserService를 JsonSerializer로 변경

UserService에서 JsonSerializer를 사용하도록 변경 (더 큰 변경 필요)

### 방법 3: 현재 설정 유지 + 에러 로깅 강화

ErrorHandlingDeserializer가 에러를 조용히 처리하고 있을 수 있으므로, 에러 로깅을 강화:

```java
// KafkaConfig.java에 추가
configProps.put(ErrorHandlingDeserializer.KEY_DESERIALIZER_CLASS, StringDeserializer.class);
// 에러 핸들러에서 더 자세한 로깅
```

## 🔍 확인 방법

### 1. 에러 로그 확인
```bash
docker logs problem-service-app 2>&1 | grep -i "deserialization\|error.*kafka\|exception" | tail -20
```

### 2. ErrorHandlingDeserializer 로그 확인
ErrorHandlingDeserializer는 에러를 조용히 처리할 수 있으므로, 로그 레벨을 TRACE로 설정:

```properties
logging.level.org.springframework.kafka.support.serializer.ErrorHandlingDeserializer=TRACE
```

### 3. 실제 메시지 확인
Kafka 토픽에서 직접 메시지를 확인해서 형식이 맞는지 확인:

```bash
docker exec -it <kafka-container> kafka-console-consumer.sh \
  --bootstrap-server localhost:9092 \
  --topic user-profile-events \
  --from-beginning \
  --max-messages 1 \
  --property print.key=true \
  --property print.value=true
```

## 💡 즉시 적용 가능한 해결책

가장 빠른 해결책은 **방법 1**입니다. StringDeserializer를 사용하고 Consumer에서 수동으로 JSON 파싱하면 확실히 작동합니다.

