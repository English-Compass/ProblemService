-- English Compass Database Schema
-- 마이크로서비스 아키텍처 기반 확장된 ERD
--
-- =============================================
-- 사용 방법:
-- 1. 이 schema.sql은 테이블 구조만 생성합니다.
-- 2. 문제 데이터는 init-scripts/quiz_data_inserts.sql에 있습니다.
-- 3. Docker 볼륨 설정:
--    volumes:
--      - ./src/main/resources/DB/schema.sql:/docker-entrypoint-initdb.d/01-schema.sql
--      - ./init-scripts/quiz_data_inserts.sql:/docker-entrypoint-initdb.d/02-quiz-data.sql
-- =============================================

-- ===========================================
-- 1. 퀴즈 및 학습 콘텐츠 테이블
-- ===========================================

-- Question table aligned with init.sql structure
CREATE TABLE question (
    question_id VARCHAR(255) NOT NULL PRIMARY KEY,                                  -- 문제 식별자
    question_text TEXT NOT NULL COMMENT '문제 내용',                               -- 문제 내용
    option_a VARCHAR(500) NOT NULL COMMENT '선택지 A',                              -- 선택지 A
    option_b VARCHAR(500) NOT NULL COMMENT '선택지 B',                              -- 선택지 B
    option_c VARCHAR(500) NOT NULL COMMENT '선택지 C',                              -- 선택지 C
    correct_answer VARCHAR(1) NOT NULL COMMENT '정답 (A, B, C)',                   -- 정답
    
    -- 카테고리 정보
    major_category VARCHAR(50) NOT NULL COMMENT '대분류',                           -- 대분류
    minor_category VARCHAR(50) NOT NULL COMMENT '소분류',                           -- 소분류
    question_type VARCHAR(50) NOT NULL COMMENT '문제 유형',                         -- 문제 유형
    
    -- 메타데이터
    explanation TEXT COMMENT '문제 해설',                                           -- 문제 해설
    difficulty_level INT NOT NULL DEFAULT 1 COMMENT '난이도 (1: 초급, 2: 중급, 3: 상급)', -- 난이도
    created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),                  -- 생성일자
    updated_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) -- 수정일자
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='문제 마스터 테이블';

-- Add learning sessions table from init.sql
CREATE TABLE learning_sessions (
    session_id VARCHAR(255) NOT NULL PRIMARY KEY,                                   -- 세션 식별자
    user_id VARCHAR(255) NOT NULL COMMENT '사용자 ID',                               -- 사용자 ID
    
    -- 시간 정보
    created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '세션 생성 시간', -- 세션 생성 시간
    started_at DATETIME(6) COMMENT '세션 시작 시간',                                  -- 세션 시작 시간
    completed_at DATETIME(6) COMMENT '세션 완료 시간',                                -- 세션 완료 시간
    updated_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), -- 수정일자
    
    -- 세션 메타데이터
    status ENUM('STARTED', 'IN_PROGRESS', 'COMPLETED') NOT NULL DEFAULT 'STARTED',  -- 세션 상태
    session_type ENUM('PRACTICE', 'REVIEW', 'WRONG_ANSWER') NOT NULL DEFAULT 'PRACTICE', -- 세션 유형
    session_metadata TEXT COMMENT '세션 메타데이터 (JSON)',                            -- 세션 메타데이터
    
    -- 통계 정보
    total_questions INT COMMENT '총 문제 수',                                         -- 총 문제 수
    answered_questions INT DEFAULT 0 COMMENT '답변한 문제 수',                        -- 답변한 문제 수
    correct_answers INT DEFAULT 0 COMMENT '정답 수',                                 -- 정답 수
    wrong_answers INT DEFAULT 0 COMMENT '오답 수',                                   -- 오답 수
    progress_percentage DOUBLE DEFAULT 0.0 COMMENT '진행률 (%)'                      -- 진행률
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='학습 세션 테이블';

-- Question answer table aligned with init.sql structure  
CREATE TABLE question_answer (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,                                  -- 답변 식별자
    session_id VARCHAR(255) NOT NULL COMMENT '세션 ID',                             -- 세션 ID
    question_id VARCHAR(255) NOT NULL COMMENT '문제 ID',                            -- 문제 ID
    user_id VARCHAR(255) NOT NULL COMMENT '사용자 ID',                              -- 사용자 ID
    session_type VARCHAR(50) NOT NULL COMMENT '세션 타입',                          -- 세션 타입
    
    -- 답변 정보
    user_answer VARCHAR(1) NOT NULL COMMENT '사용자 답변 (A, B, C)',                 -- 사용자 답변
    is_correct BIT(1) NOT NULL COMMENT '정답 여부',                                 -- 정답 여부
    time_spent INT COMMENT '풀이 시간 (초)',                                         -- 풀이 시간
    answered_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '답변 시간', -- 답변 시간
    solve_count INT NOT NULL DEFAULT 1 COMMENT '해당 문제 풀이 횟수',                 -- 풀이 횟수
    
    -- 외래키 제약조건
    FOREIGN KEY (session_id) REFERENCES learning_sessions(session_id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES question(question_id) ON DELETE CASCADE,
    
    -- 유니크 제약조건 (한 세션에서 같은 문제는 한 번만 답변)
    UNIQUE KEY uk_session_question_answer (session_id, question_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사용자 문제 답변 테이블';

-- ===========================================
-- 2. 학습 진행 및 이력 테이블
-- ===========================================

-- Session question table aligned with init.sql structure
CREATE TABLE session_question (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,                                  -- 식별자
    session_id VARCHAR(255) NOT NULL COMMENT '세션 ID',                             -- 세션 ID
    question_id VARCHAR(255) NOT NULL COMMENT '문제 ID',                            -- 문제 ID
    question_order INT NOT NULL COMMENT '문제 순서 (1, 2, 3, ...)',                 -- 문제 순서
    
    -- 외래키 제약조건
    FOREIGN KEY (session_id) REFERENCES learning_sessions(session_id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES question(question_id) ON DELETE CASCADE,
    
    -- 유니크 제약조건
    UNIQUE KEY uk_session_question (session_id, question_id),
    UNIQUE KEY uk_session_order (session_id, question_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='세션별 문제 할당 테이블';

-- User profile table (통합 프로필: UserService 설정 + LearningAnalysisService 분석 결과)
CREATE TABLE user_profiles (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '식별자',
    user_id VARCHAR(255) NOT NULL UNIQUE COMMENT '사용자 ID',
    
    -- UserService로부터 받는 프로필 정보
    difficulty_level VARCHAR(50) COMMENT '사용자 선택 난이도 (BEGINNER, INTERMEDIATE, ADVANCED)',
    selected_categories TEXT COMMENT '사용자 선택 카테고리 (JSON array: ["학업", "비즈니스", ...])',
    preferred_question_types TEXT COMMENT '선호 문제 유형 (JSON array: ["WORD", "SENTENCE", "CONVERSATION"])',
    
    -- LearningAnalysisService로부터 받는 분석 정보
    weak_categories TEXT COMMENT '약점 카테고리 (JSON array: ["여행", "일상생활", ...])',
    weak_question_types TEXT COMMENT '약점 문제 유형 (JSON array: ["CONVERSATION", ...])',
    recommended_question_ids TEXT COMMENT '추천 문제 ID (JSON array: [123, 456, ...])',
    focus_areas TEXT COMMENT '집중 학습 영역 (JSON array: ["grammar", "vocabulary", ...])',
    consistency_score DOUBLE COMMENT '학습 일관성 점수 (0.0 ~ 100.0)',
    overall_learning_pattern VARCHAR(50) COMMENT '전체 학습 패턴 (FAST_LEARNER, STEADY, NEEDS_SUPPORT)',
    average_time_per_question DOUBLE COMMENT '문제당 평균 소요 시간 (ms)',
    
    -- 메타데이터
    profile_version INT DEFAULT 1 COMMENT '프로필 버전 (업데이트마다 증가)',
    created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '생성 시간',
    updated_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '업데이트 시간',
    last_analysis_at DATETIME(6) COMMENT '마지막 분석 시간'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사용자 프로필 테이블 (UserService + LearningAnalysisService)';

-- ===========================================
-- 3. 인덱스 및 성능 최적화
-- ===========================================

-- 문제 관련 인덱스 (aligned with init.sql structure)
-- UNNECESSARY: Single column indexes when composite index exists
-- CREATE INDEX idx_question_major_category ON question(major_category);
-- CREATE INDEX idx_question_minor_category ON question(minor_category);
CREATE INDEX idx_question_type ON question(question_type);
-- UNNECESSARY: Single column index when composite index exists
-- CREATE INDEX idx_question_difficulty ON question(difficulty_level);
CREATE INDEX idx_question_category_combo ON question(major_category, minor_category, difficulty_level);

-- 학습 세션 인덱스 (aligned with init.sql structure)
-- UNNECESSARY: Single column index when composite index exists
-- CREATE INDEX idx_learning_sessions_user ON learning_sessions(user_id);
CREATE INDEX idx_learning_sessions_status ON learning_sessions(status);
CREATE INDEX idx_learning_sessions_type ON learning_sessions(session_type);
CREATE INDEX idx_learning_sessions_user_status ON learning_sessions(user_id, status);
CREATE INDEX idx_learning_sessions_created ON learning_sessions(created_at);
CREATE INDEX idx_learning_sessions_completed ON learning_sessions(completed_at);

-- 문제 답변 인덱스 (aligned with init.sql structure)
CREATE INDEX idx_question_answer_session ON question_answer(session_id);
-- UNNECESSARY: Single column index when composite index exists
-- CREATE INDEX idx_question_answer_question ON question_answer(question_id);
-- UNNECESSARY: Single column index when composite index exists  
-- CREATE INDEX idx_question_answer_correct ON question_answer(is_correct);
-- UNNECESSARY: Single column index when composite index exists
-- CREATE INDEX idx_question_answer_time ON question_answer(time_spent);
CREATE INDEX idx_question_answer_answered_at ON question_answer(answered_at);
-- DUPLICATE: Same as idx_question_answer_session
-- CREATE INDEX idx_question_answer_user_session ON question_answer(session_id);
CREATE INDEX idx_question_answer_combo ON question_answer(question_id, is_correct, time_spent);

-- 세션 문제 인덱스 (aligned with init.sql structure)
-- UNNECESSARY: Single column index when composite index exists
-- CREATE INDEX idx_session_question_session ON session_question(session_id);
CREATE INDEX idx_session_question_question ON session_question(question_id);
CREATE INDEX idx_session_question_order ON session_question(session_id, question_order);

-- 문제 답변 인덱스에 user_id 인덱스 추가
CREATE INDEX idx_question_answer_user ON question_answer(user_id);

-- 사용자 프로필 인덱스
CREATE INDEX idx_up_user_id ON user_profiles(user_id);
CREATE INDEX idx_up_difficulty ON user_profiles(difficulty_level);
CREATE INDEX idx_up_pattern ON user_profiles(overall_learning_pattern);
CREATE INDEX idx_up_updated_at ON user_profiles(updated_at);

-- ===========================================
-- 4. Kafka 이벤트 로그 테이블
-- ===========================================

-- Kafka 이벤트 로그 테이블 (Problem Service 전용)
-- 다른 서비스와 구분되도록 problem_service_ 접두사 사용
CREATE TABLE problem_service_event_log (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '이벤트 로그 식별자',
    
    -- 이벤트 기본 정보
    event_id VARCHAR(255) COMMENT '이벤트 고유 ID (있는 경우)',
    event_type VARCHAR(100) NOT NULL COMMENT '이벤트 타입 (SESSION_COMPLETED, QUESTION_ANSWERED 등)',
    event_source VARCHAR(100) NOT NULL DEFAULT 'Problem_Service' COMMENT '이벤트 발생 소스',
    
    -- Kafka 메타데이터
    topic_name VARCHAR(255) NOT NULL COMMENT 'Kafka 토픽 이름',
    partition_num INT COMMENT 'Kafka 파티션 번호',
    offset_num BIGINT COMMENT 'Kafka 오프셋',
    
    -- 이벤트 연관 정보
    user_id VARCHAR(255) COMMENT '관련 사용자 ID',
    session_id VARCHAR(255) COMMENT '관련 세션 ID',
    question_id VARCHAR(255) COMMENT '관련 문제 ID',
    
    -- 이벤트 페이로드
    event_payload TEXT NOT NULL COMMENT '전체 이벤트 데이터 (JSON)',
    
    -- 처리 상태
    processing_status ENUM('RECEIVED', 'PROCESSING', 'COMPLETED', 'FAILED') NOT NULL DEFAULT 'RECEIVED' COMMENT '처리 상태',
    error_message TEXT COMMENT '에러 메시지 (실패 시)',
    retry_count INT DEFAULT 0 COMMENT '재시도 횟수',
    
    -- 시간 정보
    event_timestamp DATETIME(6) COMMENT '이벤트 발생 시간 (이벤트 내부 타임스탬프)',
    received_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '이벤트 수신 시간',
    processed_at DATETIME(6) COMMENT '이벤트 처리 완료 시간',
    
    -- 인덱스
    INDEX idx_event_type (event_type),
    INDEX idx_topic_name (topic_name),
    INDEX idx_user_id (user_id),
    INDEX idx_session_id (session_id),
    INDEX idx_event_timestamp (event_timestamp),
    INDEX idx_received_at (received_at),
    INDEX idx_processing_status (processing_status),
    INDEX idx_user_event_type (user_id, event_type, event_timestamp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Problem Service Kafka 이벤트 로그 테이블';