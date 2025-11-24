# 이벤트 수신 로그 확인 명령어

## 기본 명령어

### 1. 실시간 로그 확인 (가장 추천)
```bash
docker logs -f problem-service-app | grep "Received user profile event"
```

### 2. 최근 로그에서 검색
```bash
docker logs problem-service-app 2>&1 | grep "Received user profile event"
```

### 3. 최근 100줄에서 검색
```bash
docker logs --tail 100 problem-service-app 2>&1 | grep "Received user profile event"
```

### 4. 특정 시간 이후 로그 확인
```bash
docker logs --since 10m problem-service-app 2>&1 | grep "Received user profile event"
```

## 상세 검색

### 5. 이벤트 타입별 검색
```bash
# DIFFICULTY 이벤트만
docker logs problem-service-app 2>&1 | grep "Received user profile event.*type=DIFFICULTY"

# CATEGORIES 이벤트만
docker logs problem-service-app 2>&1 | grep "Received user profile event.*type=CATEGORIES"
```

### 6. 특정 사용자 이벤트 검색
```bash
docker logs problem-service-app 2>&1 | grep "Received user profile event.*userId=your-user-id"
```

### 7. 에러와 함께 확인
```bash
# 이벤트 수신 로그와 에러 로그 함께 확인
docker logs problem-service-app 2>&1 | grep -E "Received user profile event|Failed to parse|Error processing"
```

### 8. 최근 10개 이벤트만 확인
```bash
docker logs problem-service-app 2>&1 | grep "Received user profile event" | tail -10
```

## 전체 컨텍스트 확인

### 9. 이벤트 처리 전체 흐름 확인
```bash
docker logs problem-service-app 2>&1 | grep -A 5 "Received user profile event"
```

### 10. Consumer 초기화부터 모든 로그 확인
```bash
docker logs problem-service-app 2>&1 | grep -E "UserProfileEventConsumer|Received user profile event|User profile event processed"
```

## 실시간 모니터링

### 11. 실시간으로 모든 관련 로그 확인
```bash
docker logs -f problem-service-app 2>&1 | grep --line-buffered -E "UserProfileEventConsumer|Received user profile event|User profile event processed|Failed to"
```

## 파일로 저장 후 검색

### 12. 로그를 파일로 저장 후 검색
```bash
# 로그 저장
docker logs problem-service-app > docker-logs.txt 2>&1

# 파일에서 검색
grep "Received user profile event" docker-logs.txt

# 또는
cat docker-logs.txt | grep "Received user profile event"
```

## 빠른 확인 (한 줄 명령어)

```bash
# 가장 간단한 방법
docker logs problem-service-app 2>&1 | grep "Received user profile event" | tail -5
```

