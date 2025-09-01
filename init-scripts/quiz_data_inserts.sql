-- =====================================================
-- Quiz Questions Data Insert Script
-- Generated on: 2025-09-01 17:01:03
-- Total Questions: 540
-- Files Processed: 54
-- =====================================================

-- Clear existing question data (optional - uncomment if needed)
-- DELETE FROM question_answer;
-- DELETE FROM session_question;
-- DELETE FROM question;

-- Reset auto-increment if using MySQL (optional)
-- ALTER TABLE question AUTO_INCREMENT = 1;

-- =====================================================
-- Question Data Inserts
-- =====================================================

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_A_001',
    'I''d like to *order* a coffee.',
    'ask for',
    'buy',
    'request',
    'C',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Order''는 주문하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_A_002',
    'Can I have the *bill*, please?',
    'check',
    'receipt',
    'money',
    'A',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Bill''은 계산서를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_A_003',
    'This meal is *delicious*.',
    'expensive',
    'tasty',
    'bad',
    'B',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Delicious''는 맛있다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_A_004',
    'I''m *allergic* to nuts.',
    'sensitive to',
    'hate',
    'love',
    'A',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Allergic''은 알레르기가 있다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_A_005',
    'What do you *recommend*?',
    'sell',
    'suggest',
    'cook',
    'B',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Recommend''는 추천하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_A_006',
    'I''d like to *order* a coffee.',
    'ask for',
    'buy',
    'request',
    'C',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Order''는 주문하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_A_007',
    'Can I have the *bill*, please?',
    'receipt',
    'check',
    'money',
    'B',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Bill''은 계산서를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_A_008',
    'This meal is *delicious*.',
    'expensive',
    'bad',
    'tasty',
    'C',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Delicious''는 맛있다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_A_009',
    'I''m *allergic* to nuts.',
    'sensitive to',
    'love',
    'hate',
    'A',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Allergic''은 알레르기가 있다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_A_010',
    'What do you *recommend*?',
    'sell',
    'cook',
    'suggest',
    'C',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Recommend''는 추천하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_B_001',
    'I''d like to make a *reservation* for two.',
    'table',
    'booking',
    'order',
    'B',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Reservation''은 예약을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_B_002',
    'Could you *wrap* this to go?',
    'package',
    'cook',
    'heat',
    'A',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Wrap''은 포장하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_B_003',
    'Is this dish *spicy*?',
    'hot',
    'sweet',
    'cold',
    'A',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Spicy''는 매운맛을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_B_004',
    'I''m on a *diet*.',
    'weight loss plan',
    'budget',
    'vacation',
    'A',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Diet''은 다이어트를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_B_005',
    'The service here is *excellent*.',
    'expensive',
    'outstanding',
    'slow',
    'B',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Excellent''는 훌륭한을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_B_006',
    'I''d like to make a *reservation* for two.',
    'table',
    'booking',
    'order',
    'B',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Reservation''은 예약을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_B_007',
    'Could you *wrap* this to go?',
    'cook',
    'heat',
    'package',
    'C',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Wrap''은 포장하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_B_008',
    'Is this dish *spicy*?',
    'sweet',
    'cold',
    'hot',
    'C',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Spicy''는 매운맛을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_B_009',
    'I''m on a *diet*.',
    'weight loss plan',
    'vacation',
    'budget',
    'A',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Diet''은 다이어트를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_B_010',
    'The service here is *excellent*.',
    'expensive',
    'outstanding',
    'slow',
    'B',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Excellent''는 훌륭한을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_C_001',
    'This restaurant has a great *ambiance*.',
    'menu',
    'atmosphere',
    'location',
    'B',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Ambiance''는 분위기를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_C_002',
    'I''d like to *complain* about the service.',
    'pay',
    'praise',
    'express dissatisfaction',
    'C',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Complain''은 불만을 표현하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_C_003',
    'The ingredients are *organic*.',
    'expensive',
    'naturally grown',
    'imported',
    'B',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Organic''은 유기농의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_C_004',
    'Could we have separate *checks*?',
    'bills',
    'menus',
    'tables',
    'A',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Checks''는 각각의 계산서를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_C_005',
    'This wine *complements* the meal perfectly.',
    'costs more than',
    'replaces',
    'goes well with',
    'C',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Complements''는 잘 어울린다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_C_006',
    'This restaurant has a great *ambiance*.',
    'menu',
    'location',
    'atmosphere',
    'C',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Ambiance''는 분위기를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_C_007',
    'I''d like to *complain* about the service.',
    'praise',
    'express dissatisfaction',
    'pay',
    'B',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Complain''은 불만을 표현하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_C_008',
    'The ingredients are *organic*.',
    'expensive',
    'naturally grown',
    'imported',
    'B',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Organic''은 유기농의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_C_009',
    'Could we have separate *checks*?',
    'menus',
    'bills',
    'tables',
    'B',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Checks''는 각각의 계산서를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_sentence_C_010',
    'This wine *complements* the meal perfectly.',
    'goes well with',
    'replaces',
    'costs more than',
    'A',
    'daily',
    'shopping_eating_out',
    'SENTENCE',
    '''Complements''는 잘 어울린다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_A_001',
    'I need to buy some _____ for dinner.',
    'groceries',
    'books',
    'clothes',
    'A',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Groceries''는 식료품을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_A_002',
    'The _____ is too long.',
    'price',
    'food',
    'queue',
    'C',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Queue''는 줄을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_A_003',
    'Can I pay by _____?',
    'time',
    'card',
    'song',
    'B',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Card''는 카드를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_A_004',
    'This apple is very _____.',
    'expensive',
    'old',
    'fresh',
    'C',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Fresh''는 신선한을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_A_005',
    'Where is the _____ section?',
    'quick',
    'dairy',
    'happy',
    'B',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Dairy''는 유제품을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_A_006',
    'I need to buy some _____ for dinner.',
    'groceries',
    'clothes',
    'books',
    'A',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Groceries''는 식료품을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_A_007',
    'The _____ is too long.',
    'queue',
    'price',
    'food',
    'A',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Queue''는 줄을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_A_008',
    'Can I pay by _____?',
    'time',
    'card',
    'song',
    'B',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Card''는 카드를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_A_009',
    'This apple is very _____.',
    'old',
    'expensive',
    'fresh',
    'C',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Fresh''는 신선한을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_A_010',
    'Where is the _____ section?',
    'happy',
    'quick',
    'dairy',
    'C',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Dairy''는 유제품을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_B_001',
    'I prefer _____ vegetables.',
    'organic',
    'digital',
    'plastic',
    'A',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Organic''은 유기농의를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_B_002',
    'This offer is valid until the _____ date.',
    'expiry',
    'birth',
    'wedding',
    'A',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Expiry''는 만료를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_B_003',
    'Do you have a _____ program?',
    'music',
    'sports',
    'loyalty',
    'C',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Loyalty''는 충성도/적립 프로그램을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_B_004',
    'I''d like to _____ this item.',
    'hide',
    'destroy',
    'exchange',
    'C',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Exchange''는 교환하다를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_B_005',
    'The _____ is included in the price.',
    'music',
    'weather',
    'tax',
    'C',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Tax''는 세금을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_B_006',
    'I prefer _____ vegetables.',
    'organic',
    'digital',
    'plastic',
    'A',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Organic''은 유기농의를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_B_007',
    'This offer is valid until the _____ date.',
    'birth',
    'wedding',
    'expiry',
    'C',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Expiry''는 만료를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_B_008',
    'Do you have a _____ program?',
    'loyalty',
    'music',
    'sports',
    'A',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Loyalty''는 충성도/적립 프로그램을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_B_009',
    'I''d like to _____ this item.',
    'hide',
    'exchange',
    'destroy',
    'B',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Exchange''는 교환하다를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_B_010',
    'The _____ is included in the price.',
    'music',
    'weather',
    'tax',
    'C',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Tax''는 세금을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_C_001',
    'This product contains _____ ingredients.',
    'expensive',
    'artificial',
    'natural',
    'B',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Artificial''은 인공의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_C_002',
    'I have a _____ for this medication.',
    'suggestion',
    'complaint',
    'prescription',
    'C',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Prescription''은 처방전을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_C_003',
    'The store offers _____ delivery.',
    'expensive',
    'slow',
    'complimentary',
    'C',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Complimentary''는 무료의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_C_004',
    'Please keep the _____ for your records.',
    'receipt',
    'food',
    'change',
    'A',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Receipt''는 영수증을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_C_005',
    'This item is currently _____.',
    'discontinued',
    'cheap',
    'popular',
    'A',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Discontinued''는 단종된을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_C_006',
    'This product contains _____ ingredients.',
    'natural',
    'expensive',
    'artificial',
    'C',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Artificial''은 인공의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_C_007',
    'I have a _____ for this medication.',
    'complaint',
    'suggestion',
    'prescription',
    'C',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Prescription''은 처방전을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_C_008',
    'The store offers _____ delivery.',
    'expensive',
    'complimentary',
    'slow',
    'B',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Complimentary''는 무료의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_C_009',
    'Please keep the _____ for your records.',
    'change',
    'receipt',
    'food',
    'B',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Receipt''는 영수증을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_shopping-eating-out_word_C_010',
    'This item is currently _____.',
    'popular',
    'discontinued',
    'cheap',
    'B',
    'daily',
    'shopping_eating_out',
    'WORD',
    '''Discontinued''는 단종된을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_A_001',
    'I need to *see* a doctor.',
    'avoid',
    'visit',
    'call',
    'B',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''See''는 의사를 만나다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_A_002',
    'I have a *headache*.',
    'broken arm',
    'pain in head',
    'cold',
    'B',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Headache''는 두통을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_A_003',
    'Where is the *emergency* room?',
    'parking',
    'urgent care',
    'gift shop',
    'B',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Emergency''는 응급상황을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_A_004',
    'I need to make an *appointment*.',
    'scheduled visit',
    'complaint',
    'payment',
    'A',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Appointment''는 예약을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_A_005',
    'The doctor will *examine* you.',
    'ignore',
    'check',
    'charge',
    'B',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Examine''은 진찰하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_A_006',
    'I need to *see* a doctor.',
    'call',
    'avoid',
    'visit',
    'C',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''See''는 의사를 만나다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_A_007',
    'I have a *headache*.',
    'cold',
    'pain in head',
    'broken arm',
    'B',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Headache''는 두통을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_A_008',
    'Where is the *emergency* room?',
    'urgent care',
    'gift shop',
    'parking',
    'A',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Emergency''는 응급상황을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_A_009',
    'I need to make an *appointment*.',
    'scheduled visit',
    'payment',
    'complaint',
    'A',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Appointment''는 예약을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_A_010',
    'The doctor will *examine* you.',
    'check',
    'charge',
    'ignore',
    'A',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Examine''은 진찰하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_B_001',
    'I''m experiencing *symptoms* of flu.',
    'costs',
    'treatments',
    'signs',
    'C',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Symptoms''는 증상을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_B_002',
    'The nurse will take your *vital signs*.',
    'insurance',
    'health measurements',
    'money',
    'B',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Vital signs''는 활력징후를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_B_003',
    'I need a *prescription* for this medication.',
    'appointment',
    'doctor''s order',
    'receipt',
    'B',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Prescription''은 처방전을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_B_004',
    'The test results are *normal*.',
    'expensive',
    'delayed',
    'typical',
    'C',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Normal''은 정상적인을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_B_005',
    'I have *insurance* coverage.',
    'medical protection',
    'car protection',
    'no money',
    'A',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Insurance''는 보험을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_B_006',
    'I''m experiencing *symptoms* of flu.',
    'signs',
    'treatments',
    'costs',
    'A',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Symptoms''는 증상을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_B_007',
    'The nurse will take your *vital signs*.',
    'money',
    'insurance',
    'health measurements',
    'C',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Vital signs''는 활력징후를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_B_008',
    'I need a *prescription* for this medication.',
    'doctor''s order',
    'appointment',
    'receipt',
    'A',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Prescription''은 처방전을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_B_009',
    'The test results are *normal*.',
    'typical',
    'delayed',
    'expensive',
    'A',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Normal''은 정상적인을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_B_010',
    'I have *insurance* coverage.',
    'car protection',
    'no money',
    'medical protection',
    'C',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Insurance''는 보험을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_C_001',
    'The diagnosis was *comprehensive*.',
    'quick',
    'thorough',
    'expensive',
    'B',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Comprehensive''는 포괄적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_C_002',
    'I need to *consult* with a specialist.',
    'avoid',
    'seek advice from',
    'pay',
    'B',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Consult''는 상담하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_C_003',
    'The medication has *side effects*.',
    'benefits',
    'no cost',
    'adverse reactions',
    'C',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Side effects''는 부작용을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_C_004',
    'I require *immediate* attention.',
    'urgent',
    'optional',
    'expensive',
    'A',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Immediate''는 즉각적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_C_005',
    'The treatment is *effective*.',
    'free',
    'successful',
    'painful',
    'B',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Effective''는 효과적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_C_006',
    'The diagnosis was *comprehensive*.',
    'quick',
    'thorough',
    'expensive',
    'B',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Comprehensive''는 포괄적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_C_007',
    'I need to *consult* with a specialist.',
    'avoid',
    'seek advice from',
    'pay',
    'B',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Consult''는 상담하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_C_008',
    'The medication has *side effects*.',
    'no cost',
    'adverse reactions',
    'benefits',
    'B',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Side effects''는 부작용을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_C_009',
    'I require *immediate* attention.',
    'optional',
    'expensive',
    'urgent',
    'C',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Immediate''는 즉각적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_sentence_C_010',
    'The treatment is *effective*.',
    'free',
    'painful',
    'successful',
    'C',
    'daily',
    'using_hospital',
    'SENTENCE',
    '''Effective''는 효과적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_A_001',
    'I feel _____.',
    'happy',
    'sick',
    'rich',
    'B',
    'daily',
    'using_hospital',
    'WORD',
    '''Sick''은 아픈을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_A_002',
    'Where is the _____?',
    'pharmacy',
    'bank',
    'restaurant',
    'A',
    'daily',
    'using_hospital',
    'WORD',
    '''Pharmacy''는 약국을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_A_003',
    'I need some _____.',
    'medicine',
    'money',
    'food',
    'A',
    'daily',
    'using_hospital',
    'WORD',
    '''Medicine''은 약을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_A_004',
    'The _____ is very kind.',
    'nurse',
    'student',
    'thief',
    'A',
    'daily',
    'using_hospital',
    'WORD',
    '''Nurse''는 간호사를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_A_005',
    'I broke my _____.',
    'car',
    'phone',
    'arm',
    'C',
    'daily',
    'using_hospital',
    'WORD',
    '''Arm''은 팔을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_A_006',
    'I feel _____.',
    'rich',
    'sick',
    'happy',
    'B',
    'daily',
    'using_hospital',
    'WORD',
    '''Sick''은 아픈을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_A_007',
    'Where is the _____?',
    'bank',
    'restaurant',
    'pharmacy',
    'C',
    'daily',
    'using_hospital',
    'WORD',
    '''Pharmacy''는 약국을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_A_008',
    'I need some _____.',
    'medicine',
    'money',
    'food',
    'A',
    'daily',
    'using_hospital',
    'WORD',
    '''Medicine''은 약을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_A_009',
    'The _____ is very kind.',
    'student',
    'nurse',
    'thief',
    'B',
    'daily',
    'using_hospital',
    'WORD',
    '''Nurse''는 간호사를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_A_010',
    'I broke my _____.',
    'arm',
    'car',
    'phone',
    'A',
    'daily',
    'using_hospital',
    'WORD',
    '''Arm''은 팔을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_B_001',
    'I have an _____ infection.',
    'internet',
    'electric',
    'ear',
    'C',
    'daily',
    'using_hospital',
    'WORD',
    '''Ear''는 귀를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_B_002',
    'The doctor ordered blood _____.',
    'food',
    'music',
    'tests',
    'C',
    'daily',
    'using_hospital',
    'WORD',
    '''Tests''는 검사를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_B_003',
    'I need to take this _____ twice daily.',
    'elevator',
    'bus',
    'medication',
    'C',
    'daily',
    'using_hospital',
    'WORD',
    '''Medication''은 약물을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_B_004',
    'The _____ will call you tomorrow.',
    'clinic',
    'restaurant',
    'bank',
    'A',
    'daily',
    'using_hospital',
    'WORD',
    '''Clinic''은 병원을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_B_005',
    'I''m allergic to _____.',
    'penicillin',
    'money',
    'happiness',
    'A',
    'daily',
    'using_hospital',
    'WORD',
    '''Penicillin''은 페니실린을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_B_006',
    'I have an _____ infection.',
    'ear',
    'internet',
    'electric',
    'A',
    'daily',
    'using_hospital',
    'WORD',
    '''Ear''는 귀를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_B_007',
    'The doctor ordered blood _____.',
    'tests',
    'food',
    'music',
    'A',
    'daily',
    'using_hospital',
    'WORD',
    '''Tests''는 검사를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_B_008',
    'I need to take this _____ twice daily.',
    'medication',
    'elevator',
    'bus',
    'A',
    'daily',
    'using_hospital',
    'WORD',
    '''Medication''은 약물을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_B_009',
    'The _____ will call you tomorrow.',
    'clinic',
    'restaurant',
    'bank',
    'A',
    'daily',
    'using_hospital',
    'WORD',
    '''Clinic''은 병원을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_B_010',
    'I''m allergic to _____.',
    'happiness',
    'money',
    'penicillin',
    'C',
    'daily',
    'using_hospital',
    'WORD',
    '''Penicillin''은 페니실린을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_C_001',
    'The _____ recommended surgery.',
    'specialist',
    'waiter',
    'driver',
    'A',
    'daily',
    'using_hospital',
    'WORD',
    '''Specialist''는 전문의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_C_002',
    'I need a _____ opinion.',
    'third',
    'first',
    'second',
    'C',
    'daily',
    'using_hospital',
    'WORD',
    '''Second opinion''은 다른 의사의 의견을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_C_003',
    'The _____ showed a fracture.',
    'movie',
    'restaurant',
    'X-ray',
    'C',
    'daily',
    'using_hospital',
    'WORD',
    '''X-ray''는 엑스레이를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_C_004',
    'I''m scheduled for _____.',
    'shopping',
    'vacation',
    'surgery',
    'C',
    'daily',
    'using_hospital',
    'WORD',
    '''Surgery''는 수술을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_C_005',
    'The treatment requires _____.',
    'decoration',
    'rehabilitation',
    'celebration',
    'B',
    'daily',
    'using_hospital',
    'WORD',
    '''Rehabilitation''은 재활을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_C_006',
    'The _____ recommended surgery.',
    'waiter',
    'driver',
    'specialist',
    'C',
    'daily',
    'using_hospital',
    'WORD',
    '''Specialist''는 전문의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_C_007',
    'I need a _____ opinion.',
    'second',
    'third',
    'first',
    'A',
    'daily',
    'using_hospital',
    'WORD',
    '''Second opinion''은 다른 의사의 의견을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_C_008',
    'The _____ showed a fracture.',
    'restaurant',
    'X-ray',
    'movie',
    'B',
    'daily',
    'using_hospital',
    'WORD',
    '''X-ray''는 엑스레이를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_C_009',
    'I''m scheduled for _____.',
    'surgery',
    'shopping',
    'vacation',
    'A',
    'daily',
    'using_hospital',
    'WORD',
    '''Surgery''는 수술을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-hospital_word_C_010',
    'The treatment requires _____.',
    'rehabilitation',
    'celebration',
    'decoration',
    'A',
    'daily',
    'using_hospital',
    'WORD',
    '''Rehabilitation''은 재활을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_A_001',
    'Where is the *bus stop*?',
    'bus station',
    'restaurant',
    'car park',
    'A',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Bus stop''은 버스 정류장을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_A_002',
    'How much is the *fare*?',
    'hotel rate',
    'ticket price',
    'food cost',
    'B',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Fare''는 요금을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_A_003',
    'What time does the train *arrive*?',
    'stop',
    'leave',
    'come',
    'C',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Arrive''는 도착하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_A_004',
    'I need to *transfer* trains.',
    'cancel',
    'buy',
    'change',
    'C',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Transfer''는 갈아타다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_A_005',
    'The bus is *crowded*.',
    'empty',
    'full of people',
    'broken',
    'B',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Crowded''는 붐비는을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_A_006',
    'Where is the *bus stop*?',
    'bus station',
    'restaurant',
    'car park',
    'A',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Bus stop''은 버스 정류장을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_A_007',
    'How much is the *fare*?',
    'ticket price',
    'hotel rate',
    'food cost',
    'A',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Fare''는 요금을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_A_008',
    'What time does the train *arrive*?',
    'stop',
    'come',
    'leave',
    'B',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Arrive''는 도착하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_A_009',
    'I need to *transfer* trains.',
    'change',
    'buy',
    'cancel',
    'A',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Transfer''는 갈아타다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_A_010',
    'The bus is *crowded*.',
    'empty',
    'full of people',
    'broken',
    'B',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Crowded''는 붐비는을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_B_001',
    'I missed my *connection*.',
    'destination',
    'wallet',
    'transfer',
    'C',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Connection''은 연결편을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_B_002',
    'The train is *delayed*.',
    'canceled',
    'early',
    'late',
    'C',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Delayed''는 지연된을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_B_003',
    'Do you have exact *change*?',
    'time',
    'tickets',
    'coins',
    'C',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Change''는 잔돈을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_B_004',
    'This is an *express* train.',
    'fast',
    'old',
    'slow',
    'A',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Express''는 급행의를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_B_005',
    'Please *validate* your ticket.',
    'buy',
    'throw away',
    'confirm',
    'C',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Validate''는 유효화하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_B_006',
    'I missed my *connection*.',
    'transfer',
    'wallet',
    'destination',
    'A',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Connection''은 연결편을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_B_007',
    'The train is *delayed*.',
    'late',
    'canceled',
    'early',
    'A',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Delayed''는 지연된을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_B_008',
    'Do you have exact *change*?',
    'coins',
    'tickets',
    'time',
    'A',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Change''는 잔돈을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_B_009',
    'This is an *express* train.',
    'fast',
    'slow',
    'old',
    'A',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Express''는 급행의를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_B_010',
    'Please *validate* your ticket.',
    'confirm',
    'buy',
    'throw away',
    'A',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Validate''는 유효화하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_C_001',
    'The service is temporarily *suspended*.',
    'extended',
    'improved',
    'stopped',
    'C',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Suspended''는 중단된을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_C_002',
    'I need to check the *timetable*.',
    'price',
    'route',
    'schedule',
    'C',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Timetable''은 시간표를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_C_003',
    'This route is *accessible* for wheelchairs.',
    'suitable',
    'expensive',
    'unsuitable',
    'A',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Accessible''는 접근 가능한을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_C_004',
    'The conductor will *inspect* tickets.',
    'sell',
    'collect',
    'check',
    'C',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Inspect''는 검사하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_C_005',
    'There''s a *disruption* on the line.',
    'celebration',
    'discount',
    'interruption',
    'C',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Disruption''은 운행 중단을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_C_006',
    'The service is temporarily *suspended*.',
    'extended',
    'improved',
    'stopped',
    'C',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Suspended''는 중단된을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_C_007',
    'I need to check the *timetable*.',
    'route',
    'price',
    'schedule',
    'C',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Timetable''은 시간표를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_C_008',
    'This route is *accessible* for wheelchairs.',
    'expensive',
    'unsuitable',
    'suitable',
    'C',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Accessible''는 접근 가능한을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_C_009',
    'The conductor will *inspect* tickets.',
    'sell',
    'check',
    'collect',
    'B',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Inspect''는 검사하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_sentence_C_010',
    'There''s a *disruption* on the line.',
    'discount',
    'interruption',
    'celebration',
    'B',
    'daily',
    'using_public_transportation',
    'SENTENCE',
    '''Disruption''은 운행 중단을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_A_001',
    'The _____ is late.',
    'book',
    'bus',
    'food',
    'B',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Bus''는 버스를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_A_002',
    'Where can I buy a _____?',
    'sandwich',
    'shirt',
    'ticket',
    'C',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Ticket''은 표를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_A_003',
    'Which _____ goes downtown?',
    'hotel',
    'restaurant',
    'route',
    'C',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Route''는 노선을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_A_004',
    'The _____ is on platform 3.',
    'train',
    'restaurant',
    'store',
    'A',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Train''은 기차를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_A_005',
    'I need to get off at the next _____.',
    'restaurant',
    'mall',
    'stop',
    'C',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Stop''은 정류장을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_A_006',
    'The _____ is late.',
    'bus',
    'food',
    'book',
    'A',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Bus''는 버스를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_A_007',
    'Where can I buy a _____?',
    'sandwich',
    'ticket',
    'shirt',
    'B',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Ticket''은 표를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_A_008',
    'Which _____ goes downtown?',
    'hotel',
    'route',
    'restaurant',
    'B',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Route''는 노선을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_A_009',
    'The _____ is on platform 3.',
    'store',
    'restaurant',
    'train',
    'C',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Train''은 기차를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_A_010',
    'I need to get off at the next _____.',
    'mall',
    'stop',
    'restaurant',
    'B',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Stop''은 정류장을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_B_001',
    'Do you accept _____ cards?',
    'playing',
    'transit',
    'birthday',
    'B',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Transit cards''는 교통카드를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_B_002',
    'The _____ is under construction.',
    'library',
    'restaurant',
    'station',
    'C',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Station''은 역을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_B_003',
    'I need to check the train _____.',
    'menu',
    'schedule',
    'price',
    'B',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Schedule''은 시간표를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_B_004',
    'This is a _____ zone.',
    'restaurant',
    'no-parking',
    'shopping',
    'B',
    'daily',
    'using_public_transportation',
    'WORD',
    '''No-parking zone''은 주차금지구역을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_B_005',
    'The _____ announced a delay.',
    'conductor',
    'teacher',
    'chef',
    'A',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Conductor''는 차장을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_B_006',
    'Do you accept _____ cards?',
    'transit',
    'birthday',
    'playing',
    'A',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Transit cards''는 교통카드를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_B_007',
    'The _____ is under construction.',
    'station',
    'library',
    'restaurant',
    'A',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Station''은 역을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_B_008',
    'I need to check the train _____.',
    'menu',
    'price',
    'schedule',
    'C',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Schedule''은 시간표를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_B_009',
    'This is a _____ zone.',
    'shopping',
    'restaurant',
    'no-parking',
    'C',
    'daily',
    'using_public_transportation',
    'WORD',
    '''No-parking zone''은 주차금지구역을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_B_010',
    'The _____ announced a delay.',
    'teacher',
    'conductor',
    'chef',
    'B',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Conductor''는 차장을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_C_001',
    'Please have your _____ ready for inspection.',
    'homework',
    'lunch',
    'tickets',
    'C',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Tickets''는 표를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_C_002',
    'This service operates with reduced _____.',
    'noise',
    'cost',
    'frequency',
    'C',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Frequency''는 운행 빈도를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_C_003',
    'The _____ provides real-time updates.',
    'library',
    'app',
    'restaurant',
    'B',
    'daily',
    'using_public_transportation',
    'WORD',
    '''App''은 애플리케이션을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_C_004',
    'Senior citizens receive a _____.',
    'gift',
    'discount',
    'penalty',
    'B',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Discount''는 할인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_C_005',
    'The terminal has excellent _____.',
    'food',
    'connectivity',
    'weather',
    'B',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Connectivity''는 연결성을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_C_006',
    'Please have your _____ ready for inspection.',
    'lunch',
    'homework',
    'tickets',
    'C',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Tickets''는 표를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_C_007',
    'This service operates with reduced _____.',
    'noise',
    'frequency',
    'cost',
    'B',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Frequency''는 운행 빈도를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_C_008',
    'The _____ provides real-time updates.',
    'app',
    'library',
    'restaurant',
    'A',
    'daily',
    'using_public_transportation',
    'WORD',
    '''App''은 애플리케이션을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_C_009',
    'Senior citizens receive a _____.',
    'penalty',
    'gift',
    'discount',
    'C',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Discount''는 할인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'daily_using-public-transportation_word_C_010',
    'The terminal has excellent _____.',
    'connectivity',
    'food',
    'weather',
    'A',
    'daily',
    'using_public_transportation',
    'WORD',
    '''Connectivity''는 연결성을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_A_001',
    'I need to *study* for the exam.',
    'prepare',
    'sleep',
    'play',
    'A',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Study''는 공부하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_A_002',
    'When is the *deadline* for the assignment?',
    'start date',
    'holiday',
    'due date',
    'C',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Deadline''은 마감일을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_A_003',
    'I need to *research* this topic.',
    'delete',
    'ignore',
    'investigate',
    'C',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Research''는 조사하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_A_004',
    'Can I *submit* my paper online?',
    'read',
    'copy',
    'hand in',
    'C',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Submit''은 제출하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_A_005',
    'I need help with my *homework*.',
    'assignment',
    'hobby',
    'lunch',
    'A',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Homework''는 숙제를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_A_006',
    'I need to *study* for the exam.',
    'sleep',
    'play',
    'prepare',
    'C',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Study''는 공부하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_A_007',
    'When is the *deadline* for the assignment?',
    'holiday',
    'due date',
    'start date',
    'B',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Deadline''은 마감일을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_A_008',
    'I need to *research* this topic.',
    'ignore',
    'investigate',
    'delete',
    'B',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Research''는 조사하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_A_009',
    'Can I *submit* my paper online?',
    'copy',
    'read',
    'hand in',
    'C',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Submit''은 제출하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_A_010',
    'I need help with my *homework*.',
    'hobby',
    'assignment',
    'lunch',
    'B',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Homework''는 숙제를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_B_001',
    'The professor *assigned* a difficult project.',
    'canceled',
    'gave',
    'praised',
    'B',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Assigned''는 부여하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_B_002',
    'I need to *cite* my sources properly.',
    'destroy',
    'hide',
    'reference',
    'C',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Cite''는 인용하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_B_003',
    'The test will *cover* three chapters.',
    'include',
    'skip',
    'repeat',
    'A',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Cover''는 다루다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_B_004',
    'I need to *revise* my essay.',
    'submit',
    'delete',
    'edit',
    'C',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Revise''는 수정하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_B_005',
    'The exam *format* includes multiple choice.',
    'location',
    'date',
    'structure',
    'C',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Format''은 형식을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_B_006',
    'The professor *assigned* a difficult project.',
    'praised',
    'canceled',
    'gave',
    'C',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Assigned''는 부여하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_B_007',
    'I need to *cite* my sources properly.',
    'reference',
    'destroy',
    'hide',
    'A',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Cite''는 인용하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_B_008',
    'The test will *cover* three chapters.',
    'skip',
    'include',
    'repeat',
    'B',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Cover''는 다루다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_B_009',
    'I need to *revise* my essay.',
    'edit',
    'submit',
    'delete',
    'A',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Revise''는 수정하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_B_010',
    'The exam *format* includes multiple choice.',
    'location',
    'date',
    'structure',
    'C',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Format''은 형식을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_C_001',
    'I need to *analyze* the data thoroughly.',
    'delete',
    'examine closely',
    'ignore',
    'B',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Analyze''는 분석하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_C_002',
    'The thesis requires *substantial* research.',
    'significant',
    'minimal',
    'no',
    'A',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Substantial''은 상당한을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_C_003',
    'I must *synthesize* information from multiple sources.',
    'ignore',
    'separate',
    'combine',
    'C',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Synthesize''는 종합하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_C_004',
    'The professor provided *constructive* feedback.',
    'no',
    'negative',
    'helpful',
    'C',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Constructive''는 건설적인을 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_C_005',
    'I need to *substantiate* my arguments.',
    'shorten',
    'support with evidence',
    'remove',
    'B',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Substantiate''는 입증하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_C_006',
    'I need to *analyze* the data thoroughly.',
    'delete',
    'ignore',
    'examine closely',
    'C',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Analyze''는 분석하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_C_007',
    'The thesis requires *substantial* research.',
    'minimal',
    'significant',
    'no',
    'B',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Substantial''은 상당한을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_C_008',
    'I must *synthesize* information from multiple sources.',
    'combine',
    'ignore',
    'separate',
    'A',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Synthesize''는 종합하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_C_009',
    'The professor provided *constructive* feedback.',
    'helpful',
    'negative',
    'no',
    'A',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Constructive''는 건설적인을 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_sentence_C_010',
    'I need to *substantiate* my arguments.',
    'shorten',
    'remove',
    'support with evidence',
    'C',
    'school',
    'assignment_test_preparation',
    'SENTENCE',
    '''Substantiate''는 입증하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_A_001',
    'I need to write an _____.',
    'song',
    'email',
    'essay',
    'C',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Essay''는 에세이를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_A_002',
    'The _____ is tomorrow.',
    'movie',
    'party',
    'test',
    'C',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Test''는 시험을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_A_003',
    'Where can I find _____?',
    'games',
    'food',
    'books',
    'C',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Books''는 책을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_A_004',
    'I need to use the _____.',
    'library',
    'kitchen',
    'gym',
    'A',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Library''는 도서관을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_A_005',
    'My _____ is due next week.',
    'vacation',
    'birthday',
    'project',
    'C',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Project''는 프로젝트를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_A_006',
    'I need to write an _____.',
    'email',
    'essay',
    'song',
    'B',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Essay''는 에세이를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_A_007',
    'The _____ is tomorrow.',
    'movie',
    'test',
    'party',
    'B',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Test''는 시험을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_A_008',
    'Where can I find _____?',
    'games',
    'books',
    'food',
    'B',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Books''는 책을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_A_009',
    'I need to use the _____.',
    'library',
    'gym',
    'kitchen',
    'A',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Library''는 도서관을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_A_010',
    'My _____ is due next week.',
    'birthday',
    'project',
    'vacation',
    'B',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Project''는 프로젝트를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_B_001',
    'I need to check my _____.',
    'lunch',
    'references',
    'phone',
    'B',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''References''는 참고문헌을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_B_002',
    'The _____ requires 2000 words.',
    'movie',
    'song',
    'paper',
    'C',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Paper''는 논문을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_B_003',
    'I''m working on my _____.',
    'thesis',
    'lunch',
    'vacation',
    'A',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Thesis''는 논문을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_B_004',
    'The _____ was very challenging.',
    'movie',
    'lunch',
    'exam',
    'C',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Exam''은 시험을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_B_005',
    'I need more _____ for my research.',
    'sleep',
    'food',
    'data',
    'C',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Data''는 데이터를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_B_006',
    'I need to check my _____.',
    'phone',
    'references',
    'lunch',
    'B',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''References''는 참고문헌을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_B_007',
    'The _____ requires 2000 words.',
    'song',
    'paper',
    'movie',
    'B',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Paper''는 논문을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_B_008',
    'I''m working on my _____.',
    'vacation',
    'lunch',
    'thesis',
    'C',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Thesis''는 논문을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_B_009',
    'The _____ was very challenging.',
    'lunch',
    'movie',
    'exam',
    'C',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Exam''은 시험을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_B_010',
    'I need more _____ for my research.',
    'data',
    'sleep',
    'food',
    'A',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Data''는 데이터를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_C_001',
    'The study requires _____ analysis.',
    'culinary',
    'statistical',
    'musical',
    'B',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Statistical''은 통계적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_C_002',
    'I must follow the _____ guidelines.',
    'driving',
    'academic',
    'cooking',
    'B',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Academic''은 학술의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_C_003',
    'The research shows significant _____.',
    'celebration',
    'correlation',
    'decoration',
    'B',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Correlation''은 상관관계를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_C_004',
    'I need to conduct a _____ review.',
    'quick',
    'musical',
    'comprehensive',
    'C',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Comprehensive''는 종합적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_C_005',
    'The _____ validates my hypothesis.',
    'evidence',
    'party',
    'game',
    'A',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Evidence''는 증거를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_C_006',
    'The study requires _____ analysis.',
    'statistical',
    'musical',
    'culinary',
    'A',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Statistical''은 통계적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_C_007',
    'I must follow the _____ guidelines.',
    'cooking',
    'driving',
    'academic',
    'C',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Academic''은 학술의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_C_008',
    'The research shows significant _____.',
    'correlation',
    'celebration',
    'decoration',
    'A',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Correlation''은 상관관계를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_C_009',
    'I need to conduct a _____ review.',
    'musical',
    'quick',
    'comprehensive',
    'C',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Comprehensive''는 종합적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_assignment-test-preparation_word_C_010',
    'The _____ validates my hypothesis.',
    'party',
    'game',
    'evidence',
    'C',
    'school',
    'assignment_test_preparation',
    'WORD',
    '''Evidence''는 증거를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_A_001',
    'Please *take notes* during the lecture.',
    'sleep',
    'write down',
    'talk',
    'B',
    'school',
    'attending_class',
    'SENTENCE',
    '''Take notes''는 노트를 작성하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_A_002',
    'Can you *repeat* the question?',
    'ignore',
    'answer',
    'say again',
    'C',
    'school',
    'attending_class',
    'SENTENCE',
    '''Repeat''는 반복하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_A_003',
    'I need to *attend* all classes.',
    'teach',
    'go to',
    'skip',
    'B',
    'school',
    'attending_class',
    'SENTENCE',
    '''Attend''는 참석하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_A_004',
    'The professor will *explain* the concept.',
    'clarify',
    'forget',
    'hide',
    'A',
    'school',
    'attending_class',
    'SENTENCE',
    '''Explain''은 설명하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_A_005',
    'Please *raise your hand* if you have a question.',
    'lift your hand up',
    'stand up',
    'sit down',
    'A',
    'school',
    'attending_class',
    'SENTENCE',
    '''Raise your hand''는 손을 들다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_A_006',
    'Please *take notes* during the lecture.',
    'talk',
    'sleep',
    'write down',
    'C',
    'school',
    'attending_class',
    'SENTENCE',
    '''Take notes''는 노트를 작성하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_A_007',
    'Can you *repeat* the question?',
    'ignore',
    'say again',
    'answer',
    'B',
    'school',
    'attending_class',
    'SENTENCE',
    '''Repeat''는 반복하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_A_008',
    'I need to *attend* all classes.',
    'skip',
    'go to',
    'teach',
    'B',
    'school',
    'attending_class',
    'SENTENCE',
    '''Attend''는 참석하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_A_009',
    'The professor will *explain* the concept.',
    'clarify',
    'hide',
    'forget',
    'A',
    'school',
    'attending_class',
    'SENTENCE',
    '''Explain''은 설명하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_A_010',
    'Please *raise your hand* if you have a question.',
    'sit down',
    'lift your hand up',
    'stand up',
    'B',
    'school',
    'attending_class',
    'SENTENCE',
    '''Raise your hand''는 손을 들다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_B_001',
    'The lecture *covers* important topics.',
    'ignores',
    'includes',
    'repeats',
    'B',
    'school',
    'attending_class',
    'SENTENCE',
    '''Covers''는 다루다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_B_002',
    'I need to *participate* in discussions.',
    'sleep during',
    'avoid',
    'take part',
    'C',
    'school',
    'attending_class',
    'SENTENCE',
    '''Participate''는 참여하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_B_003',
    'The professor *emphasizes* key points.',
    'ignores',
    'stresses',
    'whispers',
    'B',
    'school',
    'attending_class',
    'SENTENCE',
    '''Emphasizes''는 강조하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_B_004',
    'Students must *contribute* to group work.',
    'avoid',
    'complain about',
    'add to',
    'C',
    'school',
    'attending_class',
    'SENTENCE',
    '''Contribute''는 기여하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_B_005',
    'I need to *clarify* my understanding.',
    'confuse',
    'ignore',
    'make clear',
    'C',
    'school',
    'attending_class',
    'SENTENCE',
    '''Clarify''는 명확히 하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_B_006',
    'The lecture *covers* important topics.',
    'includes',
    'ignores',
    'repeats',
    'A',
    'school',
    'attending_class',
    'SENTENCE',
    '''Covers''는 다루다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_B_007',
    'I need to *participate* in discussions.',
    'sleep during',
    'take part',
    'avoid',
    'B',
    'school',
    'attending_class',
    'SENTENCE',
    '''Participate''는 참여하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_B_008',
    'The professor *emphasizes* key points.',
    'whispers',
    'ignores',
    'stresses',
    'C',
    'school',
    'attending_class',
    'SENTENCE',
    '''Emphasizes''는 강조하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_B_009',
    'Students must *contribute* to group work.',
    'avoid',
    'add to',
    'complain about',
    'B',
    'school',
    'attending_class',
    'SENTENCE',
    '''Contribute''는 기여하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_B_010',
    'I need to *clarify* my understanding.',
    'ignore',
    'confuse',
    'make clear',
    'C',
    'school',
    'attending_class',
    'SENTENCE',
    '''Clarify''는 명확히 하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_C_001',
    'The discussion *elicited* diverse perspectives.',
    'brought out',
    'ignored',
    'prevented',
    'A',
    'school',
    'attending_class',
    'SENTENCE',
    '''Elicited''는 이끌어내다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_C_002',
    'Students should *synthesize* course materials.',
    'combine',
    'ignore',
    'separate',
    'A',
    'school',
    'attending_class',
    'SENTENCE',
    '''Synthesize''는 종합하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_C_003',
    'The seminar *facilitates* critical thinking.',
    'prevents',
    'promotes',
    'ignores',
    'B',
    'school',
    'attending_class',
    'SENTENCE',
    '''Facilitates''는 촉진하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_C_004',
    'I need to *articulate* my thoughts clearly.',
    'hide',
    'confuse',
    'express',
    'C',
    'school',
    'attending_class',
    'SENTENCE',
    '''Articulate''는 명확히 표현하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_C_005',
    'The course *integrates* theory and practice.',
    'separates',
    'ignores',
    'combines',
    'C',
    'school',
    'attending_class',
    'SENTENCE',
    '''Integrates''는 통합하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_C_006',
    'The discussion *elicited* diverse perspectives.',
    'ignored',
    'prevented',
    'brought out',
    'C',
    'school',
    'attending_class',
    'SENTENCE',
    '''Elicited''는 이끌어내다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_C_007',
    'Students should *synthesize* course materials.',
    'combine',
    'ignore',
    'separate',
    'A',
    'school',
    'attending_class',
    'SENTENCE',
    '''Synthesize''는 종합하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_C_008',
    'The seminar *facilitates* critical thinking.',
    'prevents',
    'promotes',
    'ignores',
    'B',
    'school',
    'attending_class',
    'SENTENCE',
    '''Facilitates''는 촉진하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_C_009',
    'I need to *articulate* my thoughts clearly.',
    'express',
    'hide',
    'confuse',
    'A',
    'school',
    'attending_class',
    'SENTENCE',
    '''Articulate''는 명확히 표현하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_sentence_C_010',
    'The course *integrates* theory and practice.',
    'separates',
    'ignores',
    'combines',
    'C',
    'school',
    'attending_class',
    'SENTENCE',
    '''Integrates''는 통합하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_A_001',
    'The _____ starts at 9 AM.',
    'party',
    'movie',
    'class',
    'C',
    'school',
    'attending_class',
    'WORD',
    '''Class''는 수업을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_A_002',
    'I forgot my _____.',
    'lunch',
    'notebook',
    'keys',
    'B',
    'school',
    'attending_class',
    'WORD',
    '''Notebook''은 노트를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_A_003',
    'The _____ is very interesting.',
    'movie',
    'lecture',
    'song',
    'B',
    'school',
    'attending_class',
    'WORD',
    '''Lecture''는 강의를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_A_004',
    'I need to ask a _____.',
    'question',
    'favor',
    'song',
    'A',
    'school',
    'attending_class',
    'WORD',
    '''Question''은 질문을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_A_005',
    'Please sit in your _____.',
    'seat',
    'house',
    'car',
    'A',
    'school',
    'attending_class',
    'WORD',
    '''Seat''는 자리를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_A_006',
    'The _____ starts at 9 AM.',
    'class',
    'party',
    'movie',
    'A',
    'school',
    'attending_class',
    'WORD',
    '''Class''는 수업을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_A_007',
    'I forgot my _____.',
    'keys',
    'notebook',
    'lunch',
    'B',
    'school',
    'attending_class',
    'WORD',
    '''Notebook''은 노트를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_A_008',
    'The _____ is very interesting.',
    'song',
    'movie',
    'lecture',
    'C',
    'school',
    'attending_class',
    'WORD',
    '''Lecture''는 강의를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_A_009',
    'I need to ask a _____.',
    'song',
    'favor',
    'question',
    'C',
    'school',
    'attending_class',
    'WORD',
    '''Question''은 질문을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_A_010',
    'Please sit in your _____.',
    'seat',
    'car',
    'house',
    'A',
    'school',
    'attending_class',
    'WORD',
    '''Seat''는 자리를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_B_001',
    'The _____ gave us homework.',
    'waiter',
    'professor',
    'driver',
    'B',
    'school',
    'attending_class',
    'WORD',
    '''Professor''는 교수를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_B_002',
    'I need to study the _____.',
    'textbook',
    'comic',
    'cookbook',
    'A',
    'school',
    'attending_class',
    'WORD',
    '''Textbook''은 교과서를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_B_003',
    'The _____ discussion was helpful.',
    'cooking',
    'sports',
    'group',
    'C',
    'school',
    'attending_class',
    'WORD',
    '''Group''은 그룹을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_B_004',
    'I took detailed _____.',
    'notes',
    'naps',
    'photos',
    'A',
    'school',
    'attending_class',
    'WORD',
    '''Notes''는 노트를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_B_005',
    'The _____ explained the theory.',
    'instructor',
    'chef',
    'mechanic',
    'A',
    'school',
    'attending_class',
    'WORD',
    '''Instructor''는 강사를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_B_006',
    'The _____ gave us homework.',
    'driver',
    'professor',
    'waiter',
    'B',
    'school',
    'attending_class',
    'WORD',
    '''Professor''는 교수를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_B_007',
    'I need to study the _____.',
    'comic',
    'textbook',
    'cookbook',
    'B',
    'school',
    'attending_class',
    'WORD',
    '''Textbook''은 교과서를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_B_008',
    'The _____ discussion was helpful.',
    'cooking',
    'sports',
    'group',
    'C',
    'school',
    'attending_class',
    'WORD',
    '''Group''은 그룹을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_B_009',
    'I took detailed _____.',
    'notes',
    'naps',
    'photos',
    'A',
    'school',
    'attending_class',
    'WORD',
    '''Notes''는 노트를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_B_010',
    'The _____ explained the theory.',
    'chef',
    'instructor',
    'mechanic',
    'B',
    'school',
    'attending_class',
    'WORD',
    '''Instructor''는 강사를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_C_001',
    'The _____ requires active participation.',
    'seminar',
    'gym',
    'restaurant',
    'A',
    'school',
    'attending_class',
    'WORD',
    '''Seminar''는 세미나를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_C_002',
    'I need to prepare for the _____.',
    'presentation',
    'vacation',
    'party',
    'A',
    'school',
    'attending_class',
    'WORD',
    '''Presentation''은 발표를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_C_003',
    'The course includes _____ activities.',
    'cooking',
    'interactive',
    'sleeping',
    'B',
    'school',
    'attending_class',
    'WORD',
    '''Interactive''는 상호작용의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_C_004',
    'Students engage in _____ analysis.',
    'musical',
    'critical',
    'culinary',
    'B',
    'school',
    'attending_class',
    'WORD',
    '''Critical''은 비판적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_C_005',
    'The _____ integrates multiple disciplines.',
    'curriculum',
    'restaurant',
    'gym',
    'A',
    'school',
    'attending_class',
    'WORD',
    '''Curriculum''은 교육과정을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_C_006',
    'The _____ requires active participation.',
    'gym',
    'restaurant',
    'seminar',
    'C',
    'school',
    'attending_class',
    'WORD',
    '''Seminar''는 세미나를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_C_007',
    'I need to prepare for the _____.',
    'vacation',
    'party',
    'presentation',
    'C',
    'school',
    'attending_class',
    'WORD',
    '''Presentation''은 발표를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_C_008',
    'The course includes _____ activities.',
    'sleeping',
    'cooking',
    'interactive',
    'C',
    'school',
    'attending_class',
    'WORD',
    '''Interactive''는 상호작용의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_C_009',
    'Students engage in _____ analysis.',
    'critical',
    'culinary',
    'musical',
    'A',
    'school',
    'attending_class',
    'WORD',
    '''Critical''은 비판적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_attending-class_word_C_010',
    'The _____ integrates multiple disciplines.',
    'curriculum',
    'gym',
    'restaurant',
    'A',
    'school',
    'attending_class',
    'WORD',
    '''Curriculum''은 교육과정을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_A_001',
    'I need to *meet* with my advisor.',
    'avoid',
    'see',
    'call',
    'B',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Meet''는 만나다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_A_002',
    'What courses should I *take*?',
    'enroll in',
    'avoid',
    'teach',
    'A',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Take''는 수강하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_A_003',
    'I want to *major* in psychology.',
    'teach',
    'avoid',
    'specialize in',
    'C',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Major''는 전공하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_A_004',
    'Can I *change* my schedule?',
    'keep',
    'modify',
    'ignore',
    'B',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Change''는 변경하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_A_005',
    'I need help with *registration*.',
    'enrollment',
    'graduation',
    'vacation',
    'A',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Registration''은 등록을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_A_006',
    'I need to *meet* with my advisor.',
    'see',
    'avoid',
    'call',
    'A',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Meet''는 만나다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_A_007',
    'What courses should I *take*?',
    'enroll in',
    'avoid',
    'teach',
    'A',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Take''는 수강하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_A_008',
    'I want to *major* in psychology.',
    'avoid',
    'specialize in',
    'teach',
    'B',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Major''는 전공하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_A_009',
    'Can I *change* my schedule?',
    'ignore',
    'modify',
    'keep',
    'B',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Change''는 변경하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_A_010',
    'I need help with *registration*.',
    'graduation',
    'enrollment',
    'vacation',
    'B',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Registration''은 등록을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_B_001',
    'I need to *declare* my major.',
    'hide',
    'change',
    'officially choose',
    'C',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Declare''는 선언하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_B_002',
    'The professor has *office hours* on Tuesdays.',
    'vacation',
    'available time',
    'lunch break',
    'B',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Office hours''는 상담 시간을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_B_003',
    'I want to *drop* this course.',
    'teach',
    'withdraw from',
    'add',
    'B',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Drop''은 수강 취소하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_B_004',
    'I need to fulfill the *prerequisites*.',
    'required courses',
    'final exams',
    'graduation',
    'A',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Prerequisites''는 선수과목을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_B_005',
    'Can I get *credit* for this internship?',
    'free time',
    'academic recognition',
    'money',
    'B',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Credit''은 학점을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_B_006',
    'I need to *declare* my major.',
    'change',
    'officially choose',
    'hide',
    'B',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Declare''는 선언하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_B_007',
    'The professor has *office hours* on Tuesdays.',
    'vacation',
    'lunch break',
    'available time',
    'C',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Office hours''는 상담 시간을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_B_008',
    'I want to *drop* this course.',
    'teach',
    'add',
    'withdraw from',
    'C',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Drop''은 수강 취소하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_B_009',
    'I need to fulfill the *prerequisites*.',
    'required courses',
    'final exams',
    'graduation',
    'A',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Prerequisites''는 선수과목을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_B_010',
    'Can I get *credit* for this internship?',
    'free time',
    'academic recognition',
    'money',
    'B',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Credit''은 학점을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_C_001',
    'I need to *petition* for course substitution.',
    'refuse',
    'ignore',
    'formally request',
    'C',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Petition''은 청원하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_C_002',
    'The department offers *interdisciplinary* studies.',
    'single-field',
    'cross-field',
    'no',
    'B',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Interdisciplinary''는 학제간의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_C_003',
    'I want to pursue *graduate studies*.',
    'no education',
    'undergraduate',
    'advanced education',
    'C',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Graduate studies''는 대학원 과정을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_C_004',
    'The curriculum requires *comprehensive* exams.',
    'thorough',
    'easy',
    'no',
    'A',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Comprehensive''는 종합적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_C_005',
    'I need to *consult* with the department head.',
    'avoid',
    'seek advice from',
    'argue with',
    'B',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Consult''는 상담하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_C_006',
    'I need to *petition* for course substitution.',
    'ignore',
    'formally request',
    'refuse',
    'B',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Petition''은 청원하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_C_007',
    'The department offers *interdisciplinary* studies.',
    'cross-field',
    'single-field',
    'no',
    'A',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Interdisciplinary''는 학제간의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_C_008',
    'I want to pursue *graduate studies*.',
    'advanced education',
    'undergraduate',
    'no education',
    'A',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Graduate studies''는 대학원 과정을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_C_009',
    'The curriculum requires *comprehensive* exams.',
    'easy',
    'no',
    'thorough',
    'C',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Comprehensive''는 종합적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_sentence_C_010',
    'I need to *consult* with the department head.',
    'avoid',
    'seek advice from',
    'argue with',
    'B',
    'school',
    'department_conversation',
    'SENTENCE',
    '''Consult''는 상담하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_A_001',
    'I study _____.',
    'English',
    'sleeping',
    'cooking',
    'A',
    'school',
    'department_conversation',
    'WORD',
    '''English''는 영어를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_A_002',
    'My _____ is very helpful.',
    'pet',
    'enemy',
    'advisor',
    'C',
    'school',
    'department_conversation',
    'WORD',
    '''Advisor''는 지도교수를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_A_003',
    'I''m in my second _____.',
    'car',
    'house',
    'year',
    'C',
    'school',
    'department_conversation',
    'WORD',
    '''Year''는 학년을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_A_004',
    'The _____ is on the third floor.',
    'office',
    'gym',
    'restaurant',
    'A',
    'school',
    'department_conversation',
    'WORD',
    '''Office''는 사무실을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_A_005',
    'I need to choose my _____.',
    'clothes',
    'lunch',
    'major',
    'C',
    'school',
    'department_conversation',
    'WORD',
    '''Major''는 전공을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_A_006',
    'I study _____.',
    'English',
    'sleeping',
    'cooking',
    'A',
    'school',
    'department_conversation',
    'WORD',
    '''English''는 영어를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_A_007',
    'My _____ is very helpful.',
    'advisor',
    'pet',
    'enemy',
    'A',
    'school',
    'department_conversation',
    'WORD',
    '''Advisor''는 지도교수를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_A_008',
    'I''m in my second _____.',
    'year',
    'car',
    'house',
    'A',
    'school',
    'department_conversation',
    'WORD',
    '''Year''는 학년을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_A_009',
    'The _____ is on the third floor.',
    'office',
    'restaurant',
    'gym',
    'A',
    'school',
    'department_conversation',
    'WORD',
    '''Office''는 사무실을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_A_010',
    'I need to choose my _____.',
    'major',
    'clothes',
    'lunch',
    'A',
    'school',
    'department_conversation',
    'WORD',
    '''Major''는 전공을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_B_001',
    'I''m meeting with the _____.',
    'driver',
    'waiter',
    'dean',
    'C',
    'school',
    'department_conversation',
    'WORD',
    '''Dean''은 학장을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_B_002',
    'I need more _____ to graduate.',
    'money',
    'time',
    'credits',
    'C',
    'school',
    'department_conversation',
    'WORD',
    '''Credits''는 학점을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_B_003',
    'The _____ helps with course planning.',
    'counselor',
    'chef',
    'mechanic',
    'A',
    'school',
    'department_conversation',
    'WORD',
    '''Counselor''는 상담사를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_B_004',
    'I''m applying for a _____.',
    'car',
    'scholarship',
    'restaurant',
    'B',
    'school',
    'department_conversation',
    'WORD',
    '''Scholarship''은 장학금을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_B_005',
    'The _____ requirements are strict.',
    'cooking',
    'graduation',
    'driving',
    'B',
    'school',
    'department_conversation',
    'WORD',
    '''Graduation''은 졸업을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_B_006',
    'I''m meeting with the _____.',
    'driver',
    'dean',
    'waiter',
    'B',
    'school',
    'department_conversation',
    'WORD',
    '''Dean''은 학장을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_B_007',
    'I need more _____ to graduate.',
    'time',
    'money',
    'credits',
    'C',
    'school',
    'department_conversation',
    'WORD',
    '''Credits''는 학점을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_B_008',
    'The _____ helps with course planning.',
    'mechanic',
    'chef',
    'counselor',
    'C',
    'school',
    'department_conversation',
    'WORD',
    '''Counselor''는 상담사를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_B_009',
    'I''m applying for a _____.',
    'car',
    'restaurant',
    'scholarship',
    'C',
    'school',
    'department_conversation',
    'WORD',
    '''Scholarship''은 장학금을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_B_010',
    'The _____ requirements are strict.',
    'cooking',
    'graduation',
    'driving',
    'B',
    'school',
    'department_conversation',
    'WORD',
    '''Graduation''은 졸업을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_C_001',
    'I''m pursuing _____ research.',
    'cooking',
    'sleeping',
    'academic',
    'C',
    'school',
    'department_conversation',
    'WORD',
    '''Academic''은 학술의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_C_002',
    'The department offers _____ programs.',
    'cooking',
    'driving',
    'specialized',
    'C',
    'school',
    'department_conversation',
    'WORD',
    '''Specialized''는 전문화된을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_C_003',
    'I need to complete my _____.',
    'lunch',
    'vacation',
    'dissertation',
    'C',
    'school',
    'department_conversation',
    'WORD',
    '''Dissertation''은 학위논문을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_C_004',
    'The _____ committee approved my proposal.',
    'faculty',
    'driving',
    'cooking',
    'A',
    'school',
    'department_conversation',
    'WORD',
    '''Faculty''는 교수진을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_C_005',
    'I''m interested in _____ studies.',
    'sleeping',
    'cooking',
    'postgraduate',
    'C',
    'school',
    'department_conversation',
    'WORD',
    '''Postgraduate''는 대학원의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_C_006',
    'I''m pursuing _____ research.',
    'cooking',
    'sleeping',
    'academic',
    'C',
    'school',
    'department_conversation',
    'WORD',
    '''Academic''은 학술의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_C_007',
    'The department offers _____ programs.',
    'cooking',
    'specialized',
    'driving',
    'B',
    'school',
    'department_conversation',
    'WORD',
    '''Specialized''는 전문화된을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_C_008',
    'I need to complete my _____.',
    'lunch',
    'dissertation',
    'vacation',
    'B',
    'school',
    'department_conversation',
    'WORD',
    '''Dissertation''은 학위논문을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_C_009',
    'The _____ committee approved my proposal.',
    'driving',
    'faculty',
    'cooking',
    'B',
    'school',
    'department_conversation',
    'WORD',
    '''Faculty''는 교수진을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'school_department-conversation_word_C_010',
    'I''m interested in _____ studies.',
    'sleeping',
    'postgraduate',
    'cooking',
    'B',
    'school',
    'department_conversation',
    'WORD',
    '''Postgraduate''는 대학원의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_A_001',
    'I need to *pack* my backpack.',
    'buy',
    'empty',
    'fill',
    'C',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Pack''은 짐을 싸다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_A_002',
    'Where can I find a *hostel*?',
    'restaurant',
    'expensive hotel',
    'budget accommodation',
    'C',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Hostel''은 호스텔을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_A_003',
    'I''m traveling on a *budget*.',
    'unlimited money',
    'limited money',
    'no money',
    'B',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Budget''은 예산을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_A_004',
    'Can I *store* my luggage here?',
    'break',
    'lose',
    'keep',
    'C',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Store''는 보관하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_A_005',
    'I need a *map* of the city.',
    'ticket',
    'guide',
    'menu',
    'B',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Map''은 지도를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_A_006',
    'I need to *pack* my backpack.',
    'fill',
    'empty',
    'buy',
    'A',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Pack''은 짐을 싸다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_A_007',
    'Where can I find a *hostel*?',
    'restaurant',
    'budget accommodation',
    'expensive hotel',
    'B',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Hostel''은 호스텔을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_A_008',
    'I''m traveling on a *budget*.',
    'unlimited money',
    'limited money',
    'no money',
    'B',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Budget''은 예산을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_A_009',
    'Can I *store* my luggage here?',
    'lose',
    'keep',
    'break',
    'B',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Store''는 보관하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_A_010',
    'I need a *map* of the city.',
    'ticket',
    'guide',
    'menu',
    'B',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Map''은 지도를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_B_001',
    'I prefer *off-the-beaten-path* destinations.',
    'expensive places',
    'uncommon places',
    'popular places',
    'B',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Off-the-beaten-path''는 잘 알려지지 않은 장소를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_B_002',
    'The hostel offers *dormitory* rooms.',
    'shared rooms',
    'private rooms',
    'expensive rooms',
    'A',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Dormitory''는 기숙사식 방을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_B_003',
    'I need to *conserve* my energy for hiking.',
    'waste',
    'use',
    'save',
    'C',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Conserve''는 아끼다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_B_004',
    'Let''s *split* the cost of accommodation.',
    'double',
    'divide',
    'ignore',
    'B',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Split''은 나누다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_B_005',
    'I want to experience *local culture*.',
    'native customs',
    'expensive restaurants',
    'tourist attractions',
    'A',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Local culture''는 현지 문화를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_B_006',
    'I prefer *off-the-beaten-path* destinations.',
    'popular places',
    'uncommon places',
    'expensive places',
    'B',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Off-the-beaten-path''는 잘 알려지지 않은 장소를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_B_007',
    'The hostel offers *dormitory* rooms.',
    'expensive rooms',
    'private rooms',
    'shared rooms',
    'C',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Dormitory''는 기숙사식 방을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_B_008',
    'I need to *conserve* my energy for hiking.',
    'waste',
    'use',
    'save',
    'C',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Conserve''는 아끼다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_B_009',
    'Let''s *split* the cost of accommodation.',
    'ignore',
    'double',
    'divide',
    'C',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Split''은 나누다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_B_010',
    'I want to experience *local culture*.',
    'native customs',
    'tourist attractions',
    'expensive restaurants',
    'A',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Local culture''는 현지 문화를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_C_001',
    'Backpacking allows for *spontaneous* adventures.',
    'unplanned',
    'scheduled',
    'expensive',
    'A',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Spontaneous''는 즉흥적인을 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_C_002',
    'I need to *optimize* my packing strategy.',
    'complicate',
    'improve',
    'ignore',
    'B',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Optimize''는 최적화하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_C_003',
    'The trail is *challenging* but rewarding.',
    'boring',
    'easy',
    'difficult',
    'C',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Challenging''은 도전적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_C_004',
    'I prefer *sustainable* travel practices.',
    'expensive',
    'harmful',
    'environmentally friendly',
    'C',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Sustainable''은 지속가능한을 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_C_005',
    'The journey *encompasses* multiple countries.',
    'avoids',
    'excludes',
    'includes',
    'C',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Encompasses''는 포함하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_C_006',
    'Backpacking allows for *spontaneous* adventures.',
    'unplanned',
    'scheduled',
    'expensive',
    'A',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Spontaneous''는 즉흥적인을 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_C_007',
    'I need to *optimize* my packing strategy.',
    'ignore',
    'complicate',
    'improve',
    'C',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Optimize''는 최적화하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_C_008',
    'The trail is *challenging* but rewarding.',
    'difficult',
    'boring',
    'easy',
    'A',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Challenging''은 도전적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_C_009',
    'I prefer *sustainable* travel practices.',
    'expensive',
    'harmful',
    'environmentally friendly',
    'C',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Sustainable''은 지속가능한을 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_sentence_C_010',
    'The journey *encompasses* multiple countries.',
    'avoids',
    'includes',
    'excludes',
    'B',
    'travel',
    'backpacking',
    'SENTENCE',
    '''Encompasses''는 포함하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_A_001',
    'I need a new _____.',
    'car',
    'backpack',
    'house',
    'B',
    'travel',
    'backpacking',
    'WORD',
    '''Backpack''은 배낭을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_A_002',
    'The _____ is very cheap.',
    'restaurant',
    'hostel',
    'mansion',
    'B',
    'travel',
    'backpacking',
    'WORD',
    '''Hostel''은 호스텔을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_A_003',
    'I''m going on a _____.',
    'trip',
    'meeting',
    'diet',
    'A',
    'travel',
    'backpacking',
    'WORD',
    '''Trip''은 여행을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_A_004',
    'Where can I catch a _____?',
    'bus',
    'cold',
    'fish',
    'A',
    'travel',
    'backpacking',
    'WORD',
    '''Bus''는 버스를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_A_005',
    'I need comfortable _____.',
    'shoes',
    'houses',
    'cars',
    'A',
    'travel',
    'backpacking',
    'WORD',
    '''Shoes''는 신발을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_A_006',
    'I need a new _____.',
    'house',
    'car',
    'backpack',
    'C',
    'travel',
    'backpacking',
    'WORD',
    '''Backpack''은 배낭을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_A_007',
    'The _____ is very cheap.',
    'hostel',
    'restaurant',
    'mansion',
    'A',
    'travel',
    'backpacking',
    'WORD',
    '''Hostel''은 호스텔을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_A_008',
    'I''m going on a _____.',
    'meeting',
    'trip',
    'diet',
    'B',
    'travel',
    'backpacking',
    'WORD',
    '''Trip''은 여행을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_A_009',
    'Where can I catch a _____?',
    'cold',
    'bus',
    'fish',
    'B',
    'travel',
    'backpacking',
    'WORD',
    '''Bus''는 버스를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_A_010',
    'I need comfortable _____.',
    'houses',
    'cars',
    'shoes',
    'C',
    'travel',
    'backpacking',
    'WORD',
    '''Shoes''는 신발을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_B_001',
    'I''m staying in a _____ room.',
    'expensive',
    'shared',
    'private',
    'B',
    'travel',
    'backpacking',
    'WORD',
    '''Shared''는 공유의를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_B_002',
    'The _____ has great reviews.',
    'movie',
    'accommodation',
    'restaurant',
    'B',
    'travel',
    'backpacking',
    'WORD',
    '''Accommodation''은 숙박시설을 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_B_003',
    'I need to buy travel _____.',
    'clothes',
    'insurance',
    'food',
    'B',
    'travel',
    'backpacking',
    'WORD',
    '''Insurance''는 보험을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_B_004',
    'The _____ is breathtaking.',
    'scenery',
    'music',
    'food',
    'A',
    'travel',
    'backpacking',
    'WORD',
    '''Scenery''는 풍경을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_B_005',
    'I''m following the _____ guide.',
    'driving',
    'travel',
    'cooking',
    'B',
    'travel',
    'backpacking',
    'WORD',
    '''Travel guide''는 여행 가이드를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_B_006',
    'I''m staying in a _____ room.',
    'expensive',
    'private',
    'shared',
    'C',
    'travel',
    'backpacking',
    'WORD',
    '''Shared''는 공유의를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_B_007',
    'The _____ has great reviews.',
    'restaurant',
    'accommodation',
    'movie',
    'B',
    'travel',
    'backpacking',
    'WORD',
    '''Accommodation''은 숙박시설을 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_B_008',
    'I need to buy travel _____.',
    'food',
    'insurance',
    'clothes',
    'B',
    'travel',
    'backpacking',
    'WORD',
    '''Insurance''는 보험을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_B_009',
    'The _____ is breathtaking.',
    'scenery',
    'music',
    'food',
    'A',
    'travel',
    'backpacking',
    'WORD',
    '''Scenery''는 풍경을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_B_010',
    'I''m following the _____ guide.',
    'cooking',
    'driving',
    'travel',
    'C',
    'travel',
    'backpacking',
    'WORD',
    '''Travel guide''는 여행 가이드를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_C_001',
    'I prefer _____ travel.',
    'expensive',
    'independent',
    'guided',
    'B',
    'travel',
    'backpacking',
    'WORD',
    '''Independent''는 독립적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_C_002',
    'The _____ offers unique experiences.',
    'itinerary',
    'office',
    'restaurant',
    'A',
    'travel',
    'backpacking',
    'WORD',
    '''Itinerary''는 여행 일정을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_C_003',
    'I need to respect local _____.',
    'shops',
    'customs',
    'restaurants',
    'B',
    'travel',
    'backpacking',
    'WORD',
    '''Customs''는 관습을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_C_004',
    'The trail requires proper _____.',
    'food',
    'music',
    'equipment',
    'C',
    'travel',
    'backpacking',
    'WORD',
    '''Equipment''는 장비를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_C_005',
    'I''m documenting my _____ through photos.',
    'work',
    'journey',
    'lunch',
    'B',
    'travel',
    'backpacking',
    'WORD',
    '''Journey''는 여정을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_C_006',
    'I prefer _____ travel.',
    'independent',
    'expensive',
    'guided',
    'A',
    'travel',
    'backpacking',
    'WORD',
    '''Independent''는 독립적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_C_007',
    'The _____ offers unique experiences.',
    'office',
    'itinerary',
    'restaurant',
    'B',
    'travel',
    'backpacking',
    'WORD',
    '''Itinerary''는 여행 일정을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_C_008',
    'I need to respect local _____.',
    'restaurants',
    'customs',
    'shops',
    'B',
    'travel',
    'backpacking',
    'WORD',
    '''Customs''는 관습을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_C_009',
    'The trail requires proper _____.',
    'equipment',
    'food',
    'music',
    'A',
    'travel',
    'backpacking',
    'WORD',
    '''Equipment''는 장비를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_backpacking_word_C_010',
    'I''m documenting my _____ through photos.',
    'work',
    'lunch',
    'journey',
    'C',
    'travel',
    'backpacking',
    'WORD',
    '''Journey''는 여정을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_A_001',
    'We need *family-friendly* activities.',
    'adults only',
    'suitable for all ages',
    'boring',
    'B',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Family-friendly''는 가족 친화적인을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_A_002',
    'Can we get a *discount* for children?',
    'higher price',
    'reduced price',
    'no price',
    'B',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Discount''는 할인을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_A_003',
    'I need to *book* a family room.',
    'cancel',
    'reserve',
    'avoid',
    'B',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Book''은 예약하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_A_004',
    'The kids want to go to the *playground*.',
    'restaurant',
    'office',
    'play area',
    'C',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Playground''는 놀이터를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_A_005',
    'We should *plan* our itinerary carefully.',
    'organize',
    'cancel',
    'ignore',
    'A',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Plan''은 계획하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_A_006',
    'We need *family-friendly* activities.',
    'boring',
    'suitable for all ages',
    'adults only',
    'B',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Family-friendly''는 가족 친화적인을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_A_007',
    'Can we get a *discount* for children?',
    'no price',
    'reduced price',
    'higher price',
    'B',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Discount''는 할인을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_A_008',
    'I need to *book* a family room.',
    'reserve',
    'avoid',
    'cancel',
    'A',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Book''은 예약하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_A_009',
    'The kids want to go to the *playground*.',
    'office',
    'restaurant',
    'play area',
    'C',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Playground''는 놀이터를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_A_010',
    'We should *plan* our itinerary carefully.',
    'organize',
    'ignore',
    'cancel',
    'A',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Plan''은 계획하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_B_001',
    'The resort offers *supervised* kids'' activities.',
    'expensive',
    'unsupervised',
    'monitored',
    'C',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Supervised''는 관리되는을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_B_002',
    'We need *adjoining* rooms for the family.',
    'connecting',
    'expensive',
    'separate',
    'A',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Adjoining''은 인접한을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_B_003',
    'The tour *accommodates* families with young children.',
    'excludes',
    'provides for',
    'charges extra for',
    'B',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Accommodates''는 수용하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_B_004',
    'We prefer *all-inclusive* packages.',
    'expensive only',
    'everything included',
    'nothing included',
    'B',
    'travel',
    'family_trip',
    'SENTENCE',
    '''All-inclusive''는 모든 것이 포함된을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_B_005',
    'The attraction has *height restrictions*.',
    'no limits',
    'size limits',
    'age limits',
    'B',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Height restrictions''는 키 제한을 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_B_006',
    'The resort offers *supervised* kids'' activities.',
    'unsupervised',
    'monitored',
    'expensive',
    'B',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Supervised''는 관리되는을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_B_007',
    'We need *adjoining* rooms for the family.',
    'separate',
    'expensive',
    'connecting',
    'C',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Adjoining''은 인접한을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_B_008',
    'The tour *accommodates* families with young children.',
    'provides for',
    'excludes',
    'charges extra for',
    'A',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Accommodates''는 수용하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_B_009',
    'We prefer *all-inclusive* packages.',
    'nothing included',
    'expensive only',
    'everything included',
    'C',
    'travel',
    'family_trip',
    'SENTENCE',
    '''All-inclusive''는 모든 것이 포함된을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_B_010',
    'The attraction has *height restrictions*.',
    'no limits',
    'age limits',
    'size limits',
    'C',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Height restrictions''는 키 제한을 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_C_001',
    'The vacation *encompasses* educational experiences.',
    'avoids',
    'includes',
    'excludes',
    'B',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Encompasses''는 포함하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_C_002',
    'We seek *culturally enriching* activities.',
    'expensive',
    'boring',
    'educational',
    'C',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Culturally enriching''은 문화적으로 풍요로운을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_C_003',
    'The itinerary *balances* fun and learning.',
    'combines equally',
    'separates',
    'ignores',
    'A',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Balances''는 균형을 맞추다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_C_004',
    'We need *accessible* facilities for grandparents.',
    'difficult',
    'suitable for elderly',
    'expensive',
    'B',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Accessible''는 접근 가능한을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_C_005',
    'The resort *specializes* in family vacations.',
    'avoids',
    'charges extra for',
    'focuses on',
    'C',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Specializes''는 전문화하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_C_006',
    'The vacation *encompasses* educational experiences.',
    'excludes',
    'avoids',
    'includes',
    'C',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Encompasses''는 포함하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_C_007',
    'We seek *culturally enriching* activities.',
    'boring',
    'expensive',
    'educational',
    'C',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Culturally enriching''은 문화적으로 풍요로운을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_C_008',
    'The itinerary *balances* fun and learning.',
    'combines equally',
    'separates',
    'ignores',
    'A',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Balances''는 균형을 맞추다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_C_009',
    'We need *accessible* facilities for grandparents.',
    'difficult',
    'expensive',
    'suitable for elderly',
    'C',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Accessible''는 접근 가능한을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_sentence_C_010',
    'The resort *specializes* in family vacations.',
    'avoids',
    'charges extra for',
    'focuses on',
    'C',
    'travel',
    'family_trip',
    'SENTENCE',
    '''Specializes''는 전문화하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_A_001',
    'The _____ love the pool.',
    'pets',
    'adults',
    'children',
    'C',
    'travel',
    'family_trip',
    'WORD',
    '''Children''은 아이들을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_A_002',
    'We need a _____ room.',
    'single',
    'family',
    'office',
    'B',
    'travel',
    'family_trip',
    'WORD',
    '''Family room''은 가족실을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_A_003',
    'The _____ has many rides.',
    'park',
    'library',
    'office',
    'A',
    'travel',
    'family_trip',
    'WORD',
    '''Park''는 공원을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_A_004',
    'Dad is taking _____.',
    'photos',
    'naps',
    'work',
    'A',
    'travel',
    'family_trip',
    'WORD',
    '''Photos''는 사진을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_A_005',
    'Mom packed healthy _____.',
    'books',
    'snacks',
    'clothes',
    'B',
    'travel',
    'family_trip',
    'WORD',
    '''Snacks''는 간식을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_A_006',
    'The _____ love the pool.',
    'pets',
    'adults',
    'children',
    'C',
    'travel',
    'family_trip',
    'WORD',
    '''Children''은 아이들을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_A_007',
    'We need a _____ room.',
    'family',
    'office',
    'single',
    'A',
    'travel',
    'family_trip',
    'WORD',
    '''Family room''은 가족실을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_A_008',
    'The _____ has many rides.',
    'park',
    'library',
    'office',
    'A',
    'travel',
    'family_trip',
    'WORD',
    '''Park''는 공원을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_A_009',
    'Dad is taking _____.',
    'photos',
    'naps',
    'work',
    'A',
    'travel',
    'family_trip',
    'WORD',
    '''Photos''는 사진을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_A_010',
    'Mom packed healthy _____.',
    'snacks',
    'clothes',
    'books',
    'A',
    'travel',
    'family_trip',
    'WORD',
    '''Snacks''는 간식을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_B_001',
    'The hotel provides _____ for kids.',
    'homework',
    'entertainment',
    'work',
    'B',
    'travel',
    'family_trip',
    'WORD',
    '''Entertainment''는 오락을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_B_002',
    'We booked a _____ vacation.',
    'package',
    'work',
    'business',
    'A',
    'travel',
    'family_trip',
    'WORD',
    '''Package''는 패키지를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_B_003',
    'The _____ is very spacious.',
    'suite',
    'closet',
    'car',
    'A',
    'travel',
    'family_trip',
    'WORD',
    '''Suite''는 스위트룸을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_B_004',
    'Kids enjoy the _____ activities.',
    'work',
    'indoor',
    'outdoor',
    'C',
    'travel',
    'family_trip',
    'WORD',
    '''Outdoor''는 야외의를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_B_005',
    'The _____ includes breakfast.',
    'work',
    'rate',
    'homework',
    'B',
    'travel',
    'family_trip',
    'WORD',
    '''Rate''는 요금을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_B_006',
    'The hotel provides _____ for kids.',
    'work',
    'entertainment',
    'homework',
    'B',
    'travel',
    'family_trip',
    'WORD',
    '''Entertainment''는 오락을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_B_007',
    'We booked a _____ vacation.',
    'work',
    'package',
    'business',
    'B',
    'travel',
    'family_trip',
    'WORD',
    '''Package''는 패키지를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_B_008',
    'The _____ is very spacious.',
    'suite',
    'car',
    'closet',
    'A',
    'travel',
    'family_trip',
    'WORD',
    '''Suite''는 스위트룸을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_B_009',
    'Kids enjoy the _____ activities.',
    'work',
    'indoor',
    'outdoor',
    'C',
    'travel',
    'family_trip',
    'WORD',
    '''Outdoor''는 야외의를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_B_010',
    'The _____ includes breakfast.',
    'work',
    'rate',
    'homework',
    'B',
    'travel',
    'family_trip',
    'WORD',
    '''Rate''는 요금을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_C_001',
    'The resort offers _____ programs.',
    'educational',
    'work',
    'business',
    'A',
    'travel',
    'family_trip',
    'WORD',
    '''Educational''은 교육적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_C_002',
    'We prefer _____ accommodations.',
    'luxury',
    'basic',
    'work',
    'A',
    'travel',
    'family_trip',
    'WORD',
    '''Luxury''는 고급의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_C_003',
    'The _____ caters to all ages.',
    'office',
    'destination',
    'school',
    'B',
    'travel',
    'family_trip',
    'WORD',
    '''Destination''은 목적지를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_C_004',
    'The trip includes _____ experiences.',
    'work',
    'business',
    'cultural',
    'C',
    'travel',
    'family_trip',
    'WORD',
    '''Cultural''은 문화적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_C_005',
    'We need _____ transportation.',
    'work',
    'reliable',
    'unreliable',
    'B',
    'travel',
    'family_trip',
    'WORD',
    '''Reliable''은 신뢰할 수 있는을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_C_006',
    'The resort offers _____ programs.',
    'educational',
    'work',
    'business',
    'A',
    'travel',
    'family_trip',
    'WORD',
    '''Educational''은 교육적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_C_007',
    'We prefer _____ accommodations.',
    'work',
    'luxury',
    'basic',
    'B',
    'travel',
    'family_trip',
    'WORD',
    '''Luxury''는 고급의를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_C_008',
    'The _____ caters to all ages.',
    'destination',
    'office',
    'school',
    'A',
    'travel',
    'family_trip',
    'WORD',
    '''Destination''은 목적지를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_C_009',
    'The trip includes _____ experiences.',
    'business',
    'cultural',
    'work',
    'B',
    'travel',
    'family_trip',
    'WORD',
    '''Cultural''은 문화적인을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_family-trip_word_C_010',
    'We need _____ transportation.',
    'unreliable',
    'work',
    'reliable',
    'C',
    'travel',
    'family_trip',
    'WORD',
    '''Reliable''은 신뢰할 수 있는을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_A_001',
    'Let''s *split* the cost.',
    'divide',
    'ignore',
    'double',
    'A',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Split''은 나누다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_A_002',
    'We should *book* tickets in advance.',
    'lose',
    'reserve',
    'cancel',
    'B',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Book''은 예약하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_A_003',
    'Everyone wants to *party* tonight.',
    'sleep',
    'celebrate',
    'work',
    'B',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Party''는 파티하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_A_004',
    'Let''s *explore* the nightlife.',
    'avoid',
    'sleep',
    'discover',
    'C',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Explore''는 탐험하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_A_005',
    'We need to *coordinate* our schedules.',
    'ignore',
    'organize together',
    'separate',
    'B',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Coordinate''는 조정하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_A_006',
    'Let''s *split* the cost.',
    'divide',
    'ignore',
    'double',
    'A',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Split''은 나누다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_A_007',
    'We should *book* tickets in advance.',
    'cancel',
    'lose',
    'reserve',
    'C',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Book''은 예약하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_A_008',
    'Everyone wants to *party* tonight.',
    'sleep',
    'celebrate',
    'work',
    'B',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Party''는 파티하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_A_009',
    'Let''s *explore* the nightlife.',
    'discover',
    'sleep',
    'avoid',
    'A',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Explore''는 탐험하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_A_010',
    'We need to *coordinate* our schedules.',
    'organize together',
    'ignore',
    'separate',
    'A',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Coordinate''는 조정하다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_B_001',
    'The group decided to *venture* into the mountains.',
    'work',
    'go exploring',
    'stay home',
    'B',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Venture''는 모험하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_B_002',
    'We should *compromise* on the destination.',
    'argue',
    'separate',
    'find middle ground',
    'C',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Compromise''는 타협하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_B_003',
    'Let''s *indulge* in local cuisine.',
    'cook',
    'avoid',
    'enjoy freely',
    'C',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Indulge''는 즐기다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_B_004',
    'The trip *strengthened* our friendship.',
    'weakened',
    'made stronger',
    'ended',
    'B',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Strengthened''는 강화하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_B_005',
    'We need to *synchronize* our departure times.',
    'separate',
    'ignore',
    'match up',
    'C',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Synchronize''는 동기화하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_B_006',
    'The group decided to *venture* into the mountains.',
    'go exploring',
    'work',
    'stay home',
    'A',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Venture''는 모험하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_B_007',
    'We should *compromise* on the destination.',
    'separate',
    'find middle ground',
    'argue',
    'B',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Compromise''는 타협하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_B_008',
    'Let''s *indulge* in local cuisine.',
    'enjoy freely',
    'cook',
    'avoid',
    'A',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Indulge''는 즐기다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_B_009',
    'The trip *strengthened* our friendship.',
    'made stronger',
    'weakened',
    'ended',
    'A',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Strengthened''는 강화하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_B_010',
    'We need to *synchronize* our departure times.',
    'separate',
    'ignore',
    'match up',
    'C',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Synchronize''는 동기화하다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_C_001',
    'The excursion *facilitated* group bonding.',
    'prevented',
    'ignored',
    'helped',
    'C',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Facilitated''는 촉진하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_C_002',
    'We *prioritized* adventure over comfort.',
    'put first',
    'avoided',
    'ignored',
    'A',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Prioritized''는 우선순위를 두다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_C_003',
    'The journey *encompassed* diverse experiences.',
    'avoided',
    'excluded',
    'included',
    'C',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Encompassed''는 포함하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_C_004',
    'We *collaborated* on trip planning.',
    'argued',
    'worked together',
    'worked separately',
    'B',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Collaborated''는 협력하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_C_005',
    'The adventure *exceeded* our expectations.',
    'met',
    'fell short of',
    'surpassed',
    'C',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Exceeded''는 초과하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_C_006',
    'The excursion *facilitated* group bonding.',
    'helped',
    'ignored',
    'prevented',
    'A',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Facilitated''는 촉진하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_C_007',
    'We *prioritized* adventure over comfort.',
    'put first',
    'ignored',
    'avoided',
    'A',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Prioritized''는 우선순위를 두다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_C_008',
    'The journey *encompassed* diverse experiences.',
    'avoided',
    'included',
    'excluded',
    'B',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Encompassed''는 포함하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_C_009',
    'We *collaborated* on trip planning.',
    'worked together',
    'worked separately',
    'argued',
    'A',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Collaborated''는 협력하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_sentence_C_010',
    'The adventure *exceeded* our expectations.',
    'met',
    'fell short of',
    'surpassed',
    'C',
    'travel',
    'trip_with_friends',
    'SENTENCE',
    '''Exceeded''는 초과하다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_A_001',
    'My _____ are coming with me.',
    'parents',
    'enemies',
    'friends',
    'C',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Friends''는 친구들을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_A_002',
    'We''re going to a _____.',
    'meeting',
    'work',
    'concert',
    'C',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Concert''는 콘서트를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_A_003',
    'Let''s try the local _____.',
    'food',
    'homework',
    'work',
    'A',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Food''는 음식을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_A_004',
    'The _____ is very lively.',
    'club',
    'office',
    'library',
    'A',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Club''은 클럽을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_A_005',
    'We need to buy _____.',
    'homework',
    'work',
    'souvenirs',
    'C',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Souvenirs''는 기념품을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_A_006',
    'My _____ are coming with me.',
    'friends',
    'parents',
    'enemies',
    'A',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Friends''는 친구들을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_A_007',
    'We''re going to a _____.',
    'work',
    'concert',
    'meeting',
    'B',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Concert''는 콘서트를 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_A_008',
    'Let''s try the local _____.',
    'food',
    'homework',
    'work',
    'A',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Food''는 음식을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_A_009',
    'The _____ is very lively.',
    'office',
    'club',
    'library',
    'B',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Club''은 클럽을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_A_010',
    'We need to buy _____.',
    'work',
    'homework',
    'souvenirs',
    'C',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Souvenirs''는 기념품을 의미합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_B_001',
    'The _____ was amazing.',
    'work',
    'adventure',
    'meeting',
    'B',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Adventure''는 모험을 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_B_002',
    'We''re sharing an _____.',
    'office',
    'apartment',
    'classroom',
    'B',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Apartment''는 아파트를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_B_003',
    'The group enjoys _____ sports.',
    'work',
    'boring',
    'extreme',
    'C',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Extreme''은 익스트림의를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_B_004',
    'We made a _____ together.',
    'memory',
    'mistake',
    'business',
    'A',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Memory''는 추억을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_B_005',
    'The _____ brought us closer.',
    'experience',
    'meeting',
    'work',
    'A',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Experience''는 경험을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_B_006',
    'The _____ was amazing.',
    'work',
    'adventure',
    'meeting',
    'B',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Adventure''는 모험을 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_B_007',
    'We''re sharing an _____.',
    'classroom',
    'office',
    'apartment',
    'C',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Apartment''는 아파트를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_B_008',
    'The group enjoys _____ sports.',
    'boring',
    'work',
    'extreme',
    'C',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Extreme''은 익스트림의를 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_B_009',
    'We made a _____ together.',
    'business',
    'mistake',
    'memory',
    'C',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Memory''는 추억을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_B_010',
    'The _____ brought us closer.',
    'experience',
    'meeting',
    'work',
    'A',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Experience''는 경험을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_C_001',
    'We planned a _____ itinerary.',
    'rigid',
    'work',
    'flexible',
    'C',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Flexible''은 유연한을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_C_002',
    'The trip created lasting _____.',
    'problems',
    'work',
    'bonds',
    'C',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Bonds''는 유대감을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_C_003',
    'We documented our _____ journey.',
    'work',
    'adventurous',
    'boring',
    'B',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Adventurous''는 모험적인을 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_C_004',
    'The group showed great _____.',
    'work',
    'conflict',
    'camaraderie',
    'C',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Camaraderie''는 동료애를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_C_005',
    'We embraced _____ experiences.',
    'spontaneous',
    'planned',
    'work',
    'A',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Spontaneous''는 즉흥적인을 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_C_006',
    'We planned a _____ itinerary.',
    'rigid',
    'flexible',
    'work',
    'B',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Flexible''은 유연한을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_C_007',
    'The trip created lasting _____.',
    'work',
    'bonds',
    'problems',
    'B',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Bonds''는 유대감을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_C_008',
    'We documented our _____ journey.',
    'boring',
    'work',
    'adventurous',
    'C',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Adventurous''는 모험적인을 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_C_009',
    'The group showed great _____.',
    'work',
    'camaraderie',
    'conflict',
    'B',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Camaraderie''는 동료애를 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'travel_trip-with-friends_word_C_010',
    'We embraced _____ experiences.',
    'planned',
    'spontaneous',
    'work',
    'B',
    'travel',
    'trip_with_friends',
    'WORD',
    '''Spontaneous''는 즉흥적인을 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

-- =====================================================
-- Data Load Complete
-- Total questions inserted: 540
-- Categories: daily, school, travel
-- Difficulty levels: 1 (A), 2 (B), 3 (C)  
-- Question types: SENTENCE, WORD
-- =====================================================

-- Verify the data load
SELECT 
    major_category,
    minor_category, 
    question_type,
    difficulty_level,
    COUNT(*) as question_count
FROM question 
GROUP BY major_category, minor_category, question_type, difficulty_level
ORDER BY major_category, minor_category, question_type, difficulty_level;

-- Check total count
SELECT COUNT(*) as total_questions FROM question;
