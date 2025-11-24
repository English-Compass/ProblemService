# 이벤트 수신 확인 방법

## 1. 컨테이너 로그 확인

### 이벤트 수신 로그 확인
```bash
# 컨테이너 로그에서 "Received user profile event" 검색
docker logs problem-service-app 2>&1 | grep "Received user profile event"

# 또는 실시간 로그 확인
docker logs -f problem-service-app | grep -E "Received user profile event|User profile event processed"
```

### 예상되는 로그 메시지
```
INFO  c.p.P.c.UserProfileEventConsumer - Received user profile event: type=PROFILE_UPDATED, userId=xxx, partition=0, offset=123
INFO  c.p.P.c.UserProfileEventConsumer - User profile event processed successfully: userId=xxx, type=PROFILE_UPDATED
```

### 현재 상태 확인
터미널 로그를 보면:
```
DEBUG o.s.k.l.KafkaMessageListenerContainer - Received: 0 records
```
이 메시지는 **이벤트가 수신되지 않았다**는 의미입니다.

## 2. 데이터베이스 확인

### 이벤트 로그 테이블 조회
```sql
-- 최근 수신된 user-profile-events 확인
SELECT 
    id,
    event_type,
    user_id,
    topic_name,
    partition_num,
    offset_num,
    processing_status,
    received_at,
    processed_at,
    error_message
FROM problem_service_event_log
WHERE topic_name = 'user-profile-events'
ORDER BY received_at DESC
LIMIT 10;
```

### 처리 상태별 통계
```sql
-- 처리 상태별 이벤트 개수
SELECT 
    processing_status,
    COUNT(*) as count
FROM problem_service_event_log
WHERE topic_name = 'user-profile-events'
GROUP BY processing_status;
```

## 3. API 엔드포인트로 확인 (방금 추가한 기능)

### 최근 이벤트 조회
```bash
curl http://localhost:8082/problem/profile/events/recent?limit=10
```

### 이벤트 통계 조회
```bash
curl http://localhost:8082/problem/profile/events/stats
```

### 특정 사용자의 이벤트 조회 (인증 필요)
```bash
curl -H "X-User-Id: your-user-id" \
     http://localhost:8082/problem/profile/events
```

## 4. 이벤트가 수신되지 않는 경우 확인 사항

### Kafka 연결 확인
```bash
# 컨테이너 내부에서 Kafka 연결 테스트
docker exec -it problem-service-app sh
# 또는
docker exec problem-service-app curl -f http://localhost:8080/actuator/health
```

### Consumer 그룹 상태 확인
```bash
# Kafka 컨테이너에서 consumer group 확인
docker exec -it <kafka-container> kafka-consumer-groups.sh \
  --bootstrap-server localhost:9092 \
  --group problem-service-group \
  --describe
```

### 토픽 메시지 확인
```bash
# user-profile-events 토픽에 메시지가 있는지 확인
docker exec -it <kafka-container> kafka-console-consumer.sh \
  --bootstrap-server localhost:9092 \
  --topic user-profile-events \
  --from-beginning \
  --max-messages 10
```

## 5. 로그 레벨 확인

현재 설정 (`application-docker.properties`):
```properties
logging.level.com.problemservice.ProblemService.consumer=DEBUG
logging.level.org.springframework.kafka=DEBUG
```

이 설정으로 다음 로그들이 출력되어야 합니다:
- Consumer 시작/중지 로그
- 토픽 구독 로그
- 메시지 수신 로그
- 에러 로그

## 6. 문제 해결 체크리스트

- [ ] Kafka가 실행 중인가?
- [ ] `user-profile-events` 토픽이 존재하는가?
- [ ] Consumer가 토픽을 구독하고 있는가? (로그에서 확인)
- [ ] 이벤트가 실제로 발행되었는가? (다른 서비스에서 확인)
- [ ] Consumer group이 올바르게 설정되었는가?
- [ ] 네트워크 연결이 정상인가? (컨테이너 간 통신)

## 7. 빠른 확인 명령어

```bash
# 1. 최근 이벤트 로그 확인
docker logs problem-service-app --tail 100 | grep -i "user profile"

# 2. Consumer 상태 확인
docker logs problem-service-app 2>&1 | grep -i "kafka.*consumer\|listener"

# 3. 에러 로그 확인
docker logs problem-service-app 2>&1 | grep -i "error\|exception" | tail -20
```

