1) 문제 생성 & 풀이 & 할당 서비스
 - 생성 : 미리 여러 종류, 난이도 문제 생성 (주기적, 배치), 풀이 횟수가 일정 횟수를 넘은 문제 expire 및 새 문제 생성
 - 첫 풀이 문제 할당 : 학습자가 선택한 난이도에 대해 3개 유형별 문제를 골고루 할당
 - 할당 및 풀이 : 사용자 학습 수행 시 문제 데이터 응답 및 풀이 결과 수신
 - 복습 문제 할당 : 오답문제 수 결정, 취약 영역 문제 편성

[question]
- id
- question_type (빈칸 추론, 동의어 찾기, 주관식 문제)
- category (여행, 비즈니스, 일상, 학습)
- difficulty_level (A-B-C)
- question_sentence (빈칸 표시, 밑줄 표시, 표시 없음)
   "I am very __________!"
   "I am very _powerful_!"
   "I have 3 legs and 4 arms, who am I?"
- answer_options (빈칸 정답, 동의어 정답, 정답 없음)
- answer_written (주관식 정답)
- explanation

[question_answer]
- id
- user_id
- timestamp
- session_type (main, repeat, incorrect)
- solve_count
- answer_submitted
- is_correct

[learing_session]
- id
- user_id
- session_status (created, learning, completed)
- created_at
- updated_at
- completed_at
- session_question_id
- correct_answers

[session_question]
- id
- session_id
- question_id
- question_order

2) Learning Analysis 서비스
 - 전체 사용자 결과 통계 : 문제 풀이 결과에 대해서 전체 통계 수행
 - 사용자별 결과 통계
    1) SQL 집계 쿼리 (group by) 개발
    2) 집계 결과에 대한 View 작성 (매번 연산이 절약됨)
 - 사용자가 학습 완료한 문제를 분석 : 사용자 단위로만 SQL 쿼리 수행
 - 통계 분석 수행 결과 데이터 제공 : 전체 사용자의 문제 풀이 통계가 사용자 인사이트에 비교 제시 필요

DB 스키마 및 더미데이터 협의 및 공유해서 개발!