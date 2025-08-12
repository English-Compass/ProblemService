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

CREATE TABLE quiz
(                                                                                     -- 퀴즈
    id               BIGINT      NOT NULL AUTO_INCREMENT PRIMARY KEY,                 -- 식별자
    category_id      BIGINT      NOT NULL,                                            -- 카테고리 ID
    question         TEXT        NOT NULL,                                            -- 문제
    answer           TEXT        NOT NULL,                                            -- 정답
    difficulty_level VARCHAR(10) NOT NULL,                                            -- 난이도 레벨
    keyword          VARCHAR(500),                                                    -- 키워드 (쉼표 구분)
    question_type    VARCHAR(50) NOT NULL,                                            -- 문제 유형 (definition, fill_blanks, synonym)
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                             -- 생성일자
    updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 수정일자

    FOREIGN KEY (category_id) REFERENCES quiz_category (id)
);

CREATE TABLE quiz_options
(                                                            -- 퀴즈 보기
    id           BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 보기 식별자
    quiz_id      BIGINT NOT NULL,                            -- 퀴즈 ID
    option_text  TEXT   NOT NULL,                            -- 보기 내용
    option_order BIGINT NOT NULL,                            -- 보기 순서
    is_correct   BOOLEAN   DEFAULT FALSE,                    -- 정답 여부
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,        -- 생성일자

    FOREIGN KEY (quiz_id) REFERENCES quiz (id) ON DELETE CASCADE
);

-- ===========================================
-- 3. 학습 진행 및 이력 테이블
-- ===========================================

CREATE TABLE learning_session
(                                                                  -- 학습 세션
    id              BIGINT    NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 세션 식별자
    user_id         BIGINT    NOT NULL,                            -- 사용자 ID
    session_name    VARCHAR(255),                                  -- 세션명
    start_time      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,           -- 시작 시간
    end_time        TIMESTAMP NULL,                                -- 종료 시간
    total_quizzes   BIGINT    DEFAULT 0,                           -- 총 퀴즈 수
    correct_answers BIGINT    DEFAULT 0,                           -- 정답 수
    session_score   DECIMAL(5, 2),                                 -- 세션 점수
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,           -- 생성일자

    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
);

CREATE TABLE quiz_log
(                                                                                     -- 사용자 퀴즈 기록
    id               BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,                      -- 로그 식별자
    user_id          BIGINT NOT NULL,                                                 -- 사용자 ID
    quiz_id          BIGINT NOT NULL,                                                 -- 퀴즈 ID
    session_id       BIGINT,                                                          -- 학습 세션 ID
    is_correct       BOOLEAN   DEFAULT FALSE,                                         -- 정답 여부
    user_answer      TEXT,                                                            -- 사용자가 제출한 답변
    time_spent       BIGINT,                                                          -- 소요 시간 (초)
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                             -- 생성일자
    updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 수정일자

    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE,
    FOREIGN KEY (quiz_id) REFERENCES quiz (id) ON DELETE CASCADE,
    FOREIGN KEY (session_id) REFERENCES learning_session (id) ON DELETE SET NULL
);

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
-- 8. API 키 관리
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
-- 9. 인덱스 및 성능 최적화
-- ===========================================

-- 사용자 관련 인덱스
CREATE INDEX idx_user_level ON user(level);
CREATE INDEX idx_user_category ON user(prefer_category);

-- 퀴즈 관련 인덱스
CREATE INDEX idx_quiz_category ON quiz(category_id);
CREATE INDEX idx_quiz_difficulty ON quiz(difficulty_level);
CREATE INDEX idx_quiz_type ON quiz(question_type);
CREATE INDEX idx_quiz_created ON quiz(created_at);

-- 학습 세션 인덱스
CREATE INDEX idx_session_user ON learning_session(user_id);
CREATE INDEX idx_session_time ON learning_session(start_time, end_time);

-- 퀴즈 로그 인덱스 (consolidated for better performance)
CREATE INDEX idx_quizlog_user_session ON quiz_log(user_id, session_id);
CREATE INDEX idx_quizlog_quiz ON quiz_log(quiz_id);

-- 음성 평가 인덱스
CREATE INDEX idx_speech_user ON speech_session(user_id);
CREATE INDEX idx_speech_type ON speech_session(session_type);

-- 미디어 콘텐츠 인덱스
CREATE INDEX idx_media_type ON media_content(content_type);
CREATE INDEX idx_media_category ON media_content(category);
CREATE INDEX idx_media_difficulty ON media_content(difficulty_level);

-- 사용자 행동 로그 인덱스
CREATE INDEX idx_behavior_user ON user_behavior_log(user_id);
CREATE INDEX idx_behavior_type ON user_behavior_log(behavior_type);
CREATE INDEX idx_behavior_target ON user_behavior_log(target_type, target_id);
CREATE INDEX idx_behavior_timestamp ON user_behavior_log(created_at);

-- 학습 분석 인덱스
CREATE INDEX idx_analytics_user ON learning_analytics(user_id);
CREATE INDEX idx_analytics_date ON learning_analytics(date);

-- 추천 로그 인덱스
CREATE INDEX idx_recommendation_user ON recommendation_log(user_id);
CREATE INDEX idx_recommendation_type ON recommendation_log(recommendation_type);