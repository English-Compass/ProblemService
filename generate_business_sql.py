#!/usr/bin/env python3
"""
Script to generate SQL INSERT statements for business quiz data from JSON files.
This script processes all business quiz JSON files in resources/static/quiz/business/
and creates SQL INSERT statements to add them to the quiz_data_inserts.sql file.
"""

import json
import os
import re
from pathlib import Path

def map_difficulty_to_level(difficulty):
    """Map difficulty letters A/B/C to numeric levels 1/2/3"""
    mapping = {'A': 1, 'B': 2, 'C': 3}
    return mapping.get(difficulty, 1)

def map_question_type(question_type):
    """Map question type to uppercase"""
    return question_type.upper()

def map_minor_category(minor_category):
    """Map minor category from directory name to database format"""
    # Convert from kebab-case to snake_case and Korean names
    mapping = {
        'email-report': 'email_report',
        'customer-service': 'customer_service', 
        'meeting-conference': 'meeting_conference'
    }
    return mapping.get(minor_category, minor_category.replace('-', '_'))

def escape_sql_string(text):
    """Escape single quotes in SQL strings"""
    if text is None:
        return 'NULL'
    return text.replace("'", "''")

def process_json_file(file_path):
    """Process a single JSON file and return SQL INSERT statements"""
    
    # Parse filename to extract metadata
    # Format: business-{minor_category}-{question_type}-{difficulty}.json
    filename = os.path.basename(file_path)
    parts = filename.replace('.json', '').split('-')
    
    if len(parts) < 5:
        print(f"Warning: Unexpected filename format: {filename}")
        return []
    
    major_category = parts[0]  # business
    minor_category = '-'.join(parts[1:-2])  # email-report, customer-service, meeting-conference
    question_type = parts[-2]  # word, sentence, conversation
    difficulty = parts[-1]     # A, B, C
    
    # Map values
    db_minor_category = map_minor_category(minor_category)
    db_question_type = map_question_type(question_type)
    difficulty_level = map_difficulty_to_level(difficulty)
    
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            questions = json.load(f)
    except Exception as e:
        print(f"Error reading {file_path}: {e}")
        return []
    
    sql_statements = []
    
    for i, q in enumerate(questions, 1):
        question_id = f"{major_category}_{db_minor_category}_{question_type}_{difficulty}_{i:03d}"
        
        # Extract question text and options
        question_text = escape_sql_string(q.get('question', ''))
        options = q.get('options', [])
        
        option_a = escape_sql_string(options[0] if len(options) > 0 else '')
        option_b = escape_sql_string(options[1] if len(options) > 1 else '')  
        option_c = escape_sql_string(options[2] if len(options) > 2 else '')
        
        # Determine correct answer (A, B, or C based on answer text)
        answer_text = q.get('answer', '')
        correct_answer = 'A'  # default
        if answer_text == option_b:
            correct_answer = 'B'
        elif answer_text == option_c:
            correct_answer = 'C'
        
        explanation = escape_sql_string(q.get('explanation', ''))
        
        sql = f"""INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    '{question_id}',
    '{question_text}',
    '{option_a}',
    '{option_b}',
    '{option_c}',
    '{correct_answer}',
    '{major_category}',
    '{db_minor_category}',
    '{db_question_type}',
    '{explanation}',
    {difficulty_level},
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);"""
        
        sql_statements.append(sql)
    
    return sql_statements

def main():
    """Main function to process all business JSON files"""
    
    # Find the resources directory
    script_dir = Path(__file__).parent
    resources_dir = script_dir / "src/main/resources/static/quiz/business"
    
    if not resources_dir.exists():
        print(f"Error: Resources directory not found: {resources_dir}")
        return
    
    # Collect all business JSON files
    json_files = list(resources_dir.glob("**/*.json"))
    
    if not json_files:
        print(f"No JSON files found in {resources_dir}")
        return
    
    print(f"Found {len(json_files)} business quiz JSON files")
    
    all_sql_statements = []
    
    # Process each JSON file
    for json_file in sorted(json_files):
        print(f"Processing: {json_file}")
        sql_statements = process_json_file(json_file)
        all_sql_statements.extend(sql_statements)
    
    if not all_sql_statements:
        print("No SQL statements generated")
        return
    
    # Write to business_quiz_inserts.sql
    output_file = script_dir / "business_quiz_inserts.sql"
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("-- =====================================================\n")
        f.write("-- Business Quiz Data Insert Statements\n")
        f.write(f"-- Generated from {len(json_files)} JSON files\n")
        f.write(f"-- Total Questions: {len(all_sql_statements)}\n")
        f.write("-- =====================================================\n\n")
        
        for sql in all_sql_statements:
            f.write(sql)
            f.write("\n\n")
    
    print(f"Generated {len(all_sql_statements)} SQL INSERT statements")
    print(f"Output written to: {output_file}")
    
    # Also append to the main quiz_data_inserts.sql file
    main_sql_file = script_dir / "init-scripts/quiz_data_inserts.sql"
    if main_sql_file.exists():
        with open(main_sql_file, 'a', encoding='utf-8') as f:
            f.write(f"\n\n-- =====================================================\n")
            f.write("-- Business Quiz Data (Auto-generated)\n")
            f.write(f"-- Added on: {__import__('datetime').datetime.now()}\n")
            f.write("-- =====================================================\n\n")
            
            for sql in all_sql_statements:
                f.write(sql)
                f.write("\n\n")
        
        print(f"Also appended to: {main_sql_file}")

if __name__ == "__main__":
    main()