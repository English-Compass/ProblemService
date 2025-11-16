#!/usr/bin/env python3
"""
Quiz JSON 파일을 읽어서 SQL INSERT 문을 생성하는 스크립트
"""
import json
import os
from pathlib import Path

# 카테고리 매핑 (영어 디렉토리명 → 한글)
MAJOR_CATEGORY_MAP = {
    'business': '비즈니스',
    'daily': '일상생활',
    'school': '학업',
    'travel': '여행'
}

MINOR_CATEGORY_MAP = {
    'customer-service': '고객 서비스',
    'email-report': '이메일 보고서',
    'meeting-conference': '회의',
    'shopping-eating-out': '쇼핑 외식',
    'using-hospital': '병원 이용',
    'using-public-transportation': '대중교통 이용',
    'assignment-test-preparation': '과제 시험',
    'attending-class': '수업 참여',
    'department-conversation': '학과 대화',
    'backpacking': '배낭여행',
    'family-trip': '가족여행',
    'trip-with-friends': '친구와 여행'
}

QUESTION_TYPE_MAP = {
    'conversation': 'conversation',
    'sentence': 'sentence',
    'word': 'word'
}

DIFFICULTY_MAP = {
    'A': 1,
    'B': 2,
    'C': 3
}

def escape_sql_string(s):
    """SQL 문자열 이스케이프"""
    if s is None:
        return 'NULL'
    return "'" + s.replace("'", "''").replace("\\", "\\\\") + "'"

def find_correct_answer_index(options, answer):
    """정답의 인덱스를 찾아서 A, B, C로 반환"""
    try:
        idx = options.index(answer)
        return ['A', 'B', 'C'][idx]
    except (ValueError, IndexError):
        print(f"Warning: Cannot find answer '{answer}' in options: {options}")
        return 'A'  # 기본값

def process_json_file(file_path, major_cat, minor_cat, question_type, difficulty):
    """JSON 파일을 읽어서 INSERT 문 생성"""
    inserts = []
    
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            questions = json.load(f)
        
        for idx, q in enumerate(questions, 1):
            # question_id 생성
            question_id = f"{major_cat}-{minor_cat}-{question_type}-{difficulty}-{idx}"
            
            # 선택지 추출
            options = q.get('options', [])
            if len(options) < 3:
                print(f"Warning: {file_path} question {idx} has less than 3 options")
                continue
            
            option_a = options[0] if len(options) > 0 else ""
            option_b = options[1] if len(options) > 1 else ""
            option_c = options[2] if len(options) > 2 else ""
            
            # 정답 찾기
            answer_text = q.get('answer', '')
            correct_answer = find_correct_answer_index(options, answer_text)
            
            # 카테고리 한글 변환
            major_kor = MAJOR_CATEGORY_MAP.get(major_cat, major_cat)
            minor_kor = MINOR_CATEGORY_MAP.get(minor_cat, minor_cat)
            
            # INSERT 문 생성
            insert = f"""INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    {escape_sql_string(question_id)},
    {escape_sql_string(q.get('question', ''))},
    {escape_sql_string(option_a)},
    {escape_sql_string(option_b)},
    {escape_sql_string(option_c)},
    {escape_sql_string(correct_answer)},
    {escape_sql_string(major_kor)},
    {escape_sql_string(minor_kor)},
    {escape_sql_string(question_type)},
    {escape_sql_string(q.get('explanation', ''))},
    {DIFFICULTY_MAP[difficulty]}
);"""
            inserts.append(insert)
    
    except Exception as e:
        print(f"Error processing {file_path}: {e}")
    
    return inserts

def main():
    """메인 실행 함수"""
    base_path = Path(__file__).parent / 'src' / 'main' / 'resources' / 'static' / 'quiz'
    
    all_inserts = []
    file_count = 0
    
    # 모든 JSON 파일 탐색
    for major_dir in base_path.iterdir():
        if not major_dir.is_dir():
            continue
        
        major_cat = major_dir.name
        
        for minor_dir in major_dir.iterdir():
            if not minor_dir.is_dir():
                continue
            
            minor_cat = minor_dir.name
            
            for type_dir in minor_dir.iterdir():
                if not type_dir.is_dir():
                    continue
                
                question_type = type_dir.name
                
                for json_file in type_dir.glob('*.json'):
                    # 파일명에서 난이도 추출 (예: business-customer-service-conversation-A.json)
                    difficulty = json_file.stem.split('-')[-1]  # A, B, C
                    
                    if difficulty not in DIFFICULTY_MAP:
                        print(f"Warning: Unknown difficulty '{difficulty}' in {json_file}")
                        continue
                    
                    inserts = process_json_file(
                        json_file, major_cat, minor_cat, question_type, difficulty
                    )
                    all_inserts.extend(inserts)
                    file_count += 1
                    print(f"Processed: {json_file.name} ({len(inserts)} questions)")
    
    # SQL 파일 생성
    output_file = Path(__file__).parent / 'quiz_data_inserts.sql'
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("-- =============================================\n")
        f.write("-- Quiz Data Insert Statements\n")
        f.write(f"-- Generated from {file_count} JSON files\n")
        f.write(f"-- Total questions: {len(all_inserts)}\n")
        f.write("-- =============================================\n\n")
        
        f.write("-- IF NOT EXISTS 구문으로 중복 삽입 방지\n")
        f.write("-- MySQL에서는 INSERT IGNORE를 사용\n\n")
        
        for insert in all_inserts:
            # INSERT를 INSERT IGNORE로 변경
            f.write(insert.replace('INSERT INTO', 'INSERT IGNORE INTO') + '\n\n')
    
    print(f"\n✅ Complete!")
    print(f"   - Processed files: {file_count}")
    print(f"   - Generated questions: {len(all_inserts)}")
    print(f"   - Output file: {output_file}")

if __name__ == '__main__':
    main()

