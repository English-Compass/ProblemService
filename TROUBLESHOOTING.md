# 이벤트 수신 문제 해결 가이드

## 문제: 이벤트는 발행되지만 수신되지 않음

### 1. 설정 확인 (수정 완료)
- ✅ `application-docker.properties`에 `spring.kafka.topic.user-profile=user-profile-events` 추가됨

### 2. Consumer가 실제로 시작되었는지 확인

컨테이너 로그에서 다음 메시지 확인:
```bash
docker logs problem-service-app 2>&1 | grep -i "UserProfileEventConsumer\|KafkaListener"
```

예상 로그:
```
INFO  c.p.P.c.UserProfileEventConsumer - UserProfileEventConsumer initialized - ready to consume from topic: user-profile-events
```

### 3. Consumer Group Offset 확인

가장 흔한 원인: **Consumer group의 offset이 이미 최신으로 커밋되어 있어서 새로운 메시지를 받지 못함**

해결 방법:
```bash
# Consumer group의 offset 확인
docker exec -it <kafka-container> kafka-consumer-groups.sh \
  --bootstrap-server localhost:9092 \
  --group problem-service-group \
  --describe

# 만약 offset이 최신이라면, consumer group을 리셋
docker exec -it <kafka-container> kafka-consumer-groups.sh \
  --bootstrap-server localhost:9092 \
  --group problem-service-group \
  --topic user-profile-events \
  --reset-offsets \
  --to-earliest \
  --execute
```

### 4. 토픽에 실제로 메시지가 있는지 확인

```bash
# 토픽의 메시지 확인
docker exec -it <kafka-container> kafka-console-consumer.sh \
  --bootstrap-server localhost:9092 \
  --topic user-profile-events \
  --from-beginning \
  --max-messages 10

# 토픽 정보 확인
docker exec -it <kafka-container> kafka-topics.sh \
  --bootstrap-server localhost:9092 \
  --describe \
  --topic user-profile-events
```

### 5. Deserialization 에러 확인

로그에서 에러 메시지 확인:
```bash
docker logs problem-service-app 2>&1 | grep -i "error\|exception\|deserialization" | tail -20
```

특히 다음 에러들을 확인:
- `DeserializationException`
- `SerializationException`
- `ClassNotFoundException`

### 6. Consumer가 다른 Consumer Group에 속해 있는지 확인

```bash
# 모든 consumer group 확인
docker exec -it <kafka-container> kafka-consumer-groups.sh \
  --bootstrap-server localhost:9092 \
  --list

# problem-service-group의 상태 확인
docker exec -it <kafka-container> kafka-consumer-groups.sh \
  --bootstrap-server localhost:9092 \
  --group problem-service-group \
  --describe
```

### 7. 토픽 이름 확인

실제 발행되는 토픽 이름과 Consumer가 구독하는 토픽 이름이 일치하는지 확인:

Consumer 설정:
```java
topics = "${spring.kafka.topic.user-profile:user-profile-events}"
```

실제 토픽 이름 확인:
```bash
docker exec -it <kafka-container> kafka-topics.sh \
  --bootstrap-server localhost:9092 \
  --list | grep user-profile
```

### 8. Consumer가 실제로 메시지를 받는지 테스트

새로운 메시지를 발행하고 로그 확인:
```bash
# 메시지 발행 (테스트용)
docker exec -it <kafka-container> kafka-console-producer.sh \
  --bootstrap-server localhost:9092 \
  --topic user-profile-events

# 그 다음 컨테이너 로그 확인
docker logs -f problem-service-app | grep -i "Received user profile event"
```

### 9. 빠른 진단 명령어

```bash
# 1. Consumer 초기화 로그 확인
docker logs problem-service-app 2>&1 | grep "UserProfileEventConsumer initialized"

# 2. Consumer가 토픽을 구독하는지 확인
docker logs problem-service-app 2>&1 | grep -i "kafka.*listener.*started\|subscribed"

# 3. 에러 로그 확인
docker logs problem-service-app 2>&1 | grep -i "error\|exception" | grep -i "kafka\|consumer" | tail -10

# 4. 최근 이벤트 수신 로그 확인
docker logs problem-service-app 2>&1 | grep "Received user profile event" | tail -10
```

### 10. 가장 가능성 높은 원인

1. **Consumer group offset이 이미 최신** (가장 흔함)
   - 해결: Consumer group 리셋 또는 새로운 group-id 사용

2. **토픽 이름 불일치**
   - 해결: 실제 토픽 이름 확인 후 설정 수정

3. **Deserialization 에러**
   - 해결: 로그에서 에러 확인 후 UserProfileEvent DTO 구조 확인

4. **Consumer가 시작되지 않음**
   - 해결: @Profile("!local") 조건 확인, 프로필이 docker인지 확인

### 11. 임시 해결책: Consumer Group 변경

새로운 Consumer Group으로 테스트:
```properties
# application-docker.properties에 추가
spring.kafka.consumer.group-id=problem-service-group-test-$(date +%s)
```

또는 환경변수로:
```bash
export SPRING_KAFKA_CONSUMER_GROUP_ID=problem-service-group-test-$(date +%s)
```

