-- Insert test category
INSERT INTO quiz_category (name, difficulty_level, description, created_at) 
VALUES ('English Grammar', 'A1', 'Basic English Grammar', CURRENT_TIMESTAMP);

-- Insert test quiz
INSERT INTO quiz (category_id, question, answer, difficulty_level, question_type, keyword, created_at, updated_at)
VALUES (1, 'What is the past tense of "go"?', 'went', 'A1', 'definition', 'verb, past tense', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);