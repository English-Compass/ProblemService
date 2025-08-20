-- English Compass Database Schema
-- 마이크로서비스 아키텍처 기반 확장된 ERD

-- ===========================================
-- 1. 사용자 관련 테이블
-- ===========================================

CREATE TABLE user
(                                                                                   -- 사용자
    id              BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 식별자
    name            VARCHAR(255) NOT NULL,                                          -- 사용자명
    kakao_id        BIGINT       NOT NULL,                                          -- 카카오 ID (고유 식별자)
    profile         VARCHAR(255),                                                   -- 프로필 사진 URL
    prefer_category VARCHAR(255),                                                   -- 관심 분야
    level           VARCHAR(10),                                                    -- 사용자 수준(A1, A2, B1, B2, C1, C2/숫자는 외부에 표기 X)
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                            -- 생성일자
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- 수정일자
);

CREATE TABLE user_session
(                                                                                  -- 사용자 세션
    id            BIGINT              NOT NULL AUTO_INCREMENT PRIMARY KEY,         -- 세션 식별자
    user_id       BIGINT              NOT NULL,                                    -- 사용자 ID
    session_token VARCHAR(255) UNIQUE NOT NULL,                                    -- 세션 토큰
    is_active     BOOLEAN   DEFAULT TRUE,                                          -- 활성 상태
    expires_at    TIMESTAMP           NOT NULL,                                    -- 만료 시간
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                             -- 생성일자
    updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 수정일자

    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
);

-- ===========================================
-- 2. 퀴즈 및 학습 콘텐츠 테이블
-- ===========================================

CREATE TABLE quiz_category
(                                                                      -- 퀴즈 카테고리
    id               BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 카테고리 식별자
    name             VARCHAR(100) NOT NULL,                            -- 카테고리명
    parent_id        BIGINT,                                           -- 상위 카테고리 ID
    difficulty_level VARCHAR(10),                                      -- 난이도 레벨
    description      TEXT,                                             -- 카테고리 설명
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,              -- 생성일자

    FOREIGN KEY (parent_id) REFERENCES quiz_category (id)
);

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
-- 3. 학습 진행 및 이력 테이블
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


-- ===========================================
-- 4. 어휘 및 문장 테이블
-- ===========================================

CREATE TABLE word
(                                                                               -- 어휘
    id         BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,                      -- 식별자
    word       VARCHAR(100) NOT NULL,                                           -- 어휘
    definition TEXT NOT NULL,                                                   -- 정의
    example    TEXT,                                                            -- 예문
    difficulty_level VARCHAR(10),                                               -- 난이도 레벨
    category   VARCHAR(100),                                                    -- 카테고리
    keyword    VARCHAR(500),                                                    -- 키워드 (쉼표 구분)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                             -- 생성일자
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  -- 수정일자
);

CREATE TABLE word_log
(                                                                                     -- 사용자 어휘 기록
    id               BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,                      -- 로그 식별자
    user_id          BIGINT NOT NULL,                                                 -- 사용자 ID
    word_id          BIGINT NOT NULL,                                                 -- 어휘 ID
    mastery_level    BIGINT    DEFAULT 0,                                             -- 숙련도 레벨 (0-5)
    review_count     BIGINT    DEFAULT 0,                                             -- 복습 횟수
    next_review_date DATE,                                                            -- 다음 복습 날짜
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                             -- 생성일자
    updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 수정일자

    PRIMARY KEY (user_id, word_id),
    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE,
    FOREIGN KEY (word_id) REFERENCES word (id) ON DELETE CASCADE
);

CREATE TABLE sentence
(                                                                                    -- 문장
    id               BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY,               -- 식별자
    category         VARCHAR(100) NOT NULL,                                          -- 분류
    sentence         TEXT         NOT NULL,                                          -- 문장
    translation      TEXT         NOT NULL,                                          -- 해석
    difficulty_level VARCHAR(10),                                                    -- 난이도 레벨
    keyword          VARCHAR(500),                                                   -- 키워드 (쉼표 구분)
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                            -- 생성일자
    updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- 수정일자
);

-- ===========================================
-- 5. 음성 평가 관련 테이블
-- ===========================================

CREATE TABLE speech_session
(                                                                 -- 음성 평가 세션
    id           BIGINT      NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 세션 식별자
    user_id      BIGINT      NOT NULL,                            -- 사용자 ID
    session_type VARCHAR(50) NOT NULL,                            -- 세션 유형 (roleplay, pronunciation, grammar)
    start_time   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             -- 시작 시간
    end_time     TIMESTAMP   NULL,                                -- 종료 시간
    total_score  DECIMAL(5, 2),                                   -- 총점
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             -- 생성일자

    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
);

CREATE TABLE speech_evaluation
(                                                                   -- 음성 평가 결과
    id                  BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 평가 식별자
    speech_session_id   BIGINT NOT NULL,                            -- 음성 세션 ID
    audio_url           VARCHAR(255),                               -- 음성 파일 URL
    pronunciation_score DECIMAL(3, 2),                              -- 발음 점수 (0.00-1.00)
    grammar_score       DECIMAL(3, 2),                              -- 문법 점수 (0.00-1.00)
    fluency_score       DECIMAL(3, 2),                              -- 유창성 점수 (0.00-1.00)
    feedback            TEXT,                                       -- 피드백
    ai_analysis         JSON,                                       -- AI 분석 결과 (JSON)
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,        -- 생성일자

    FOREIGN KEY (speech_session_id) REFERENCES speech_session (id) ON DELETE CASCADE
);

-- ===========================================
-- 6. 미디어 콘텐츠 추천 테이블
-- ===========================================

CREATE TABLE media_content
(                                                                                    -- 미디어 콘텐츠
    id               BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 콘텐츠 식별자
    content_type     VARCHAR(50)  NOT NULL,                                          -- 콘텐츠 유형 (video, podcast, movie, drama)
    title            VARCHAR(255) NOT NULL,                                          -- 제목
    description      TEXT,                                                           -- 설명
    url              VARCHAR(255),                                                   -- URL
    thumbnail_url    VARCHAR(255),                                                   -- 썸네일 URL
    duration         BIGINT,                                                         -- 재생 시간 (초)
    difficulty_level VARCHAR(10),                                                    -- 난이도 레벨
    category         VARCHAR(100),                                                   -- 카테고리
    keyword          VARCHAR(500),                                                   -- 키워드 (쉼표 구분)
    view_count       BIGINT    DEFAULT 0,                                            -- 조회수
    rating           DECIMAL(3, 2),                                                  -- 평점 (0.00-5.00)
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                            -- 생성일자
    updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- 수정일자
);

CREATE TABLE user_media_preference
(                                                                                         -- 사용자 미디어 선호도
    id               BIGINT      NOT NULL AUTO_INCREMENT PRIMARY KEY,                     -- 선호도 식별자
    user_id          BIGINT      NOT NULL,                                                -- 사용자 ID
    content_type     VARCHAR(50) NOT NULL,                                                -- 콘텐츠 유형
    category         VARCHAR(100),                                                        -- 카테고리
    preference_score DECIMAL(3, 2) DEFAULT 0.5,                                           -- 선호도 점수 (0.00-1.00)
    created_at       TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,                             -- 생성일자
    updated_at       TIMESTAMP     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 수정일자

    UNIQUE KEY unique_user_content (user_id, content_type, category),
    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
);

-- ===========================================
-- 7. 사용자 행동 추적 및 분석 테이블
-- ===========================================

CREATE TABLE user_behavior_log
(                                                                   -- 사용자 행동 로그
    id            BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 로그 식별자
    user_id       BIGINT       NOT NULL,                            -- 사용자 ID
    behavior_type VARCHAR(100) NOT NULL,                            -- 행동 유형 (quiz_start, quiz_complete, video_watch, etc.)
    target_id     BIGINT,                                           -- 대상 ID (퀴즈 ID, 비디오 ID 등)
    target_type   VARCHAR(50),                                      -- 대상 유형 (quiz, video, podcast, etc.)
    metadata      JSON,                                             -- 추가 메타데이터
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,              -- 발생 시간

    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
);

CREATE TABLE learning_analytics
(                                                                                         -- 학습 분석 데이터
    id                   BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,                      -- 분석 식별자
    user_id              BIGINT NOT NULL,                                                 -- 사용자 ID
    date                 DATE   NOT NULL,                                                 -- 분석 날짜
    total_study_time     BIGINT    DEFAULT 0,                                             -- 총 학습 시간 (분)
    quizzes_completed    BIGINT    DEFAULT 0,                                             -- 완료한 퀴즈 수
    correct_rate         DECIMAL(5, 2),                                                   -- 정답률
    words_learned        BIGINT    DEFAULT 0,                                             -- 학습한 단어 수
    speech_practice_time BIGINT    DEFAULT 0,                                             -- 음성 연습 시간 (분)
    created_at           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                             -- 생성일자
    updated_at           TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 수정일자

    UNIQUE KEY unique_user_date (user_id, date),
    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
);

CREATE TABLE recommendation_log
(                                                                        -- 추천 시스템 로그
    id                  BIGINT      NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 로그 식별자
    user_id             BIGINT      NOT NULL,                            -- 사용자 ID
    recommendation_type VARCHAR(50) NOT NULL,                            -- 추천 유형 (quiz, video, word, etc.)
    recommended_id      BIGINT      NOT NULL,                            -- 추천된 콘텐츠 ID
    user_action         VARCHAR(50),                                     -- 사용자 행동 (accept, reject, ignore)
    score               DECIMAL(3, 2),                                   -- 추천 점수
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             -- 생성일자

    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
);

-- ===========================================
-- 8. 분석 뷰 (Analytical Views from init.sql)
-- ===========================================

-- Question statistics view
CREATE VIEW question_stats_view AS
SELECT 
    q.question_id,
    q.question_type,
    q.major_category as category,
    q.difficulty_level,
    
    -- 기본 통계
    COUNT(qa.id) as total_solve_count,
    SUM(CASE WHEN qa.is_correct = 1 THEN 1 ELSE 0 END) as correct_solve_count,
    
    -- 정답률 (소수점 2자리)
    ROUND(
        (SUM(CASE WHEN qa.is_correct = 1 THEN 1 ELSE 0 END) * 100.0 / 
         NULLIF(COUNT(qa.id), 0)), 2
    ) as correct_rate,
    
    -- 평균 풀이 시간 (초)
    ROUND(AVG(qa.time_spent), 2) as avg_solve_time,
    
    -- 사용자당 평균 시도 횟수
    ROUND(COUNT(qa.id) * 1.0 / NULLIF(COUNT(DISTINCT ls.user_id), 0), 2) as avg_solve_attempts_per_user,
    
    -- 고유 사용자 수
    COUNT(DISTINCT ls.user_id) as distinct_user_count
    
FROM question q
LEFT JOIN question_answer qa ON q.question_id = qa.question_id
LEFT JOIN learning_sessions ls ON qa.session_id = ls.session_id
GROUP BY q.question_id, q.question_type, q.major_category, q.difficulty_level;

-- User learning analytics view
CREATE VIEW user_learning_analytics AS
SELECT 
    ls.user_id,
    
    -- 기본 학습 통계
    COUNT(DISTINCT ls.session_id) as total_sessions,
    COUNT(qa.id) as total_questions_solved,
    SUM(CASE WHEN qa.is_correct = 1 THEN 1 ELSE 0 END) as total_correct_answers,
    
    -- 정답률 (%)
    ROUND(
        (SUM(CASE WHEN qa.is_correct = 1 THEN 1 ELSE 0 END) * 100.0 / 
         NULLIF(COUNT(qa.id), 0)), 2
    ) as accuracy_rate,
    
    -- 오답률 (%)
    ROUND(
        (SUM(CASE WHEN qa.is_correct = 0 THEN 1 ELSE 0 END) * 100.0 / 
         NULLIF(COUNT(qa.id), 0)), 2
    ) as error_rate,
    
    -- 평균 풀이 시간 (초)
    ROUND(AVG(qa.time_spent), 2) as avg_solve_time,
    
    -- 문제 재시도율 (%)
    ROUND(
        (SUM(qa.solve_count - 1) * 100.0 / 
         NULLIF(COUNT(qa.id), 0)), 2
    ) as retry_rate,
    
    -- 학습 진도율 (완료된 세션 비율, %)
    ROUND(
        (COUNT(CASE WHEN ls.status = 'COMPLETED' THEN 1 END) * 100.0 / 
         NULLIF(COUNT(DISTINCT ls.session_id), 0)), 2
    ) as learning_progress_rate,
    
    -- 최근 학습일
    MAX(qa.answered_at) as last_learning_date,
    
    -- 총 학습 시간 (분)
    ROUND(SUM(qa.time_spent) / 60.0, 2) as total_learning_time_minutes
    
FROM learning_sessions ls
LEFT JOIN question_answer qa ON ls.session_id = qa.session_id
GROUP BY ls.user_id;

-- Category performance view
CREATE VIEW category_performance_view AS
SELECT 
    ls.user_id,
    q.major_category,
    q.minor_category,
    
    -- 카테고리별 통계
    COUNT(qa.id) as questions_solved,
    SUM(CASE WHEN qa.is_correct = 1 THEN 1 ELSE 0 END) as correct_answers,
    
    -- 카테고리별 숙련도 (정답률, %)
    ROUND(
        (SUM(CASE WHEN qa.is_correct = 1 THEN 1 ELSE 0 END) * 100.0 / 
         NULLIF(COUNT(qa.id), 0)), 2
    ) as category_proficiency,
    
    -- 카테고리별 평균 풀이 시간
    ROUND(AVG(qa.time_spent), 2) as avg_category_solve_time,
    
    -- 카테고리별 최고 성과일
    MAX(qa.answered_at) as last_category_practice_date
    
FROM learning_sessions ls
JOIN question_answer qa ON ls.session_id = qa.session_id
JOIN question q ON qa.question_id = q.question_id
GROUP BY ls.user_id, q.major_category, q.minor_category;

-- Difficulty achievement view
CREATE VIEW difficulty_achievement_view AS
SELECT 
    ls.user_id,
    q.difficulty_level,
    
    -- 난이도별 통계
    COUNT(qa.id) as questions_solved,
    SUM(CASE WHEN qa.is_correct = 1 THEN 1 ELSE 0 END) as correct_answers,
    
    -- 난이도별 성취도 (정답률, %)
    ROUND(
        (SUM(CASE WHEN qa.is_correct = 1 THEN 1 ELSE 0 END) * 100.0 / 
         NULLIF(COUNT(qa.id), 0)), 2
    ) as difficulty_achievement_rate,
    
    -- 난이도별 평균 풀이 시간
    ROUND(AVG(qa.time_spent), 2) as avg_difficulty_solve_time,
    
    -- 난이도별 도전 횟수
    ROUND(AVG(qa.solve_count), 2) as avg_attempts_per_question
    
FROM learning_sessions ls
JOIN question_answer qa ON ls.session_id = qa.session_id
JOIN question q ON qa.question_id = q.question_id
GROUP BY ls.user_id, q.difficulty_level;

-- ===========================================
-- 9. API 키 관리
-- ===========================================

CREATE TABLE key_table
(                                                        -- API 키 테이블
    id          INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- 식별자
    key_name    VARCHAR(255)                   NOT NULL, -- 키 이름
    usage_limit INT DEFAULT 0                            -- 사용량 제한
);

CREATE TABLE key_usage_log
(                                                          -- API 키 별 사용 내역
    id         BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- 로그 식별자
    key_id     INT                               NOT NULL, -- API 키 참조
    model      VARCHAR(50),                                -- 사용 모델명
    usage      INT       DEFAULT 0,                        -- 토큰 사용량
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,        -- 사용 시각

    FOREIGN KEY (key_id) REFERENCES key_table (id)
);

-- ===========================================
-- 10. 인덱스 및 성능 최적화 (Updated for new schema)
-- ===========================================

-- 사용자 관련 인덱스
CREATE INDEX idx_user_level ON user(level);
CREATE INDEX idx_user_category ON user(prefer_category);

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

-- 음성 평가 인덱스
CREATE INDEX idx_speech_user ON speech_session(user_id);
CREATE INDEX idx_speech_type ON speech_session(session_type);

-- 미디어 콘텐츠 인덱스
-- CONSIDER: May benefit from composite index (content_type, category, difficulty_level)
CREATE INDEX idx_media_type ON media_content(content_type);
CREATE INDEX idx_media_category ON media_content(category);
CREATE INDEX idx_media_difficulty ON media_content(difficulty_level);

-- 사용자 행동 로그 인덱스
CREATE INDEX idx_behavior_user ON user_behavior_log(user_id);
-- LOW USAGE: behavior_type alone rarely queried without user_id
-- CREATE INDEX idx_behavior_type ON user_behavior_log(behavior_type);
CREATE INDEX idx_behavior_target ON user_behavior_log(target_type, target_id);
CREATE INDEX idx_behavior_timestamp ON user_behavior_log(created_at);

-- 학습 분석 인덱스
CREATE INDEX idx_analytics_user ON learning_analytics(user_id);
CREATE INDEX idx_analytics_date ON learning_analytics(date);
-- CONSIDER: Composite index (user_id, date) for user-specific date range queries

-- 추천 로그 인덱스
CREATE INDEX idx_recommendation_user ON recommendation_log(user_id);
-- LOW USAGE: recommendation_type alone rarely queried without user_id
-- CREATE INDEX idx_recommendation_type ON recommendation_log(recommendation_type);