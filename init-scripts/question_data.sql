-- =========================================
-- Question Data Insert Statements
-- Generated from static quiz JSON files
-- =========================================

-- Disable foreign key checks for faster insertion
SET FOREIGN_KEY_CHECKS = 0;

-- Clear existing question data (optional - remove if you want to keep existing data)
-- DELETE FROM question_answer;
-- DELETE FROM session_question;
-- DELETE FROM question;

-- Insert 624 question records
-- Data mapping:
--   question_id: Generated unique IDs (Q000001, Q000002, ...)
--   question_text: From 'question' field in JSON
--   option_a/b/c: From 'options' array (first 3 elements)
--   correct_answer: Mapped from 'answer' field to A/B/C
--   major_category: Extracted from file path (business, daily, school, travel)
--   minor_category: Extracted from file path (customer-service, shopping-eating-out, etc.)
--   question_type: Extracted from file path (sentence, word)
--   explanation: From 'explanation' field in JSON
--   difficulty_level: Mapped from file suffix (A=1, B=2, C=3)

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000001',
    'I''ll *put you through* to the manager.',
    'connect you with',
    'go with you to',
    'call for you',
    'A',
    'business',
    'customer-service',
    'sentence',
    '''Put you through''는 전화를 연결해 주겠다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000002',
    'Is there *anything else* I can help you with?',
    'do you need more help',
    'is that all',
    'can I go now',
    'A',
    'business',
    'customer-service',
    'sentence',
    '''Anything else''는 추가적인 도움이 필요한지 묻는 표현입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000003',
    'We will *look into* this matter right away.',
    'investigate',
    'ignore',
    'delay',
    'A',
    'business',
    'customer-service',
    'sentence',
    '''Look into''는 조사하겠다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000004',
    'I''m afraid that''s *against our policy*.',
    'not allowed by our rules',
    'a good idea',
    'possible',
    'A',
    'business',
    'customer-service',
    'sentence',
    '''Against our policy''는 규정에 어긋난다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000005',
    'We will do our *utmost* to resolve this issue.',
    'best',
    'part',
    'bit',
    'A',
    'business',
    'customer-service',
    'sentence',
    '''Utmost''는 최선을 다하겠다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000006',
    'We need to *compensate* the customer for the error.',
    'pay back',
    'apologize to',
    'thank',
    'A',
    'business',
    'customer-service',
    'sentence',
    '''Compensate''는 보상한다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000007',
    'How can I ____ you today?',
    'help',
    'do',
    'make',
    'A',
    'business',
    'customer-service',
    'word',
    '고객에게 무엇을 도와드릴지 물을 때 ''help''를 사용합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000008',
    'I''m sorry for the ____.',
    'inconvenience',
    'problem',
    'issue',
    'A',
    'business',
    'customer-service',
    'word',
    '고객에게 불편을 드린 점에 대해 사과할 때 정중한 표현인 ''inconvenience''를 사용합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000009',
    'We will ____ the issue as soon as possible.',
    'investigate',
    'ignore',
    'forget',
    'A',
    'business',
    'customer-service',
    'word',
    '''Investigate''는 문제를 조사하겠다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000010',
    'We offer a full ____ if you are not satisfied.',
    'refund',
    'discount',
    'exchange',
    'A',
    'business',
    'customer-service',
    'word',
    '''Refund''는 환불을 의미합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000011',
    'We are committed to ____ our customers'' expectations.',
    'exceeding',
    'meeting',
    'matching',
    'A',
    'business',
    'customer-service',
    'word',
    '''Exceeding''은 고객의 기대를 뛰어넘는 서비스를 제공하겠다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000012',
    'Thank you for your ____.',
    'patience',
    'time',
    'effort',
    'A',
    'business',
    'customer-service',
    'word',
    '고객의 인내심에 감사할 때 ''patience''를 사용합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000013',
    'I look forward to *hearing from you* soon.',
    'receiving your reply',
    'meeting you',
    'calling you',
    'A',
    'business',
    'email-report',
    'sentence',
    '''Hearing from you''는 답장을 기다린다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000014',
    'Best *regards*,',
    'sincerely',
    'thank you',
    'goodbye',
    'A',
    'business',
    'email-report',
    'sentence',
    '''Regards''는 이메일 끝에 붙이는 격식 있는 인사말입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000015',
    'For *your reference*, I have attached the previous report.',
    'to help you understand',
    'for you to read',
    'because you asked',
    'A',
    'business',
    'email-report',
    'sentence',
    '''For your reference''는 참고용으로 제공한다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000016',
    'Please do not *hesitate* to contact me.',
    'feel free to',
    'be afraid to',
    'forget to',
    'A',
    'business',
    'email-report',
    'sentence',
    '''Do not hesitate to''는 언제든지 편하게 연락하라는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000017',
    'This is a *gentle reminder* about the deadline.',
    'polite way to remind you',
    'strict warning',
    'final notice',
    'A',
    'business',
    'email-report',
    'sentence',
    '''Gentle reminder''는 정중하게 마감일을 상기시키는 표현입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000018',
    'The data is *preliminary* and subject to change.',
    'not final',
    'accurate',
    'confidential',
    'A',
    'business',
    'email-report',
    'sentence',
    '''Preliminary''는 데이터가 아직 확정되지 않았다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000019',
    'Please find the ____ document.',
    'attached',
    'included',
    'added',
    'A',
    'business',
    'email-report',
    'word',
    '이메일에 파일을 첨부했을 때 ''attached''라는 단어를 사용합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000020',
    'I am writing to ____ about the project.',
    'inquire',
    'ask',
    'tell',
    'A',
    'business',
    'email-report',
    'word',
    '''Inquire''는 공식적인 문의를 할 때 사용하는 격식 있는 표현입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000021',
    'Could you please provide me with an ____?',
    'update',
    'information',
    'news',
    'A',
    'business',
    'email-report',
    'word',
    '''Update''는 최신 정보를 요청할 때 사용합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000022',
    'Please ____ that you have received this email.',
    'confirm',
    'say',
    'check',
    'A',
    'business',
    'email-report',
    'word',
    '''Confirm''은 수신 확인을 요청할 때 사용합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000023',
    'The report ____ the key findings of our research.',
    'summarizes',
    'tells',
    'gives',
    'A',
    'business',
    'email-report',
    'word',
    '''Summarizes''는 보고서가 연구의 핵심 결과를 요약한다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000024',
    'We need to ____ the data before making a decision.',
    'analyze',
    'see',
    'look',
    'A',
    'business',
    'email-report',
    'word',
    '''Analyze''는 데이터를 분석한다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000025',
    'Let''s *go over* the main points.',
    'review',
    'skip',
    'discuss',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Go over''는 검토하자는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000026',
    'Can you *take notes* during the meeting?',
    'write down what is said',
    'speak in the meeting',
    'leave the meeting',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Take notes''는 회의 내용을 필기하라는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000027',
    'Please *speak up* if you have questions.',
    'talk louder',
    'be quiet',
    'leave',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Speak up''은 더 크게 말하라는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000028',
    'Let''s *move on* to the next topic.',
    'continue to',
    'return to',
    'stop at',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Move on''은 다음으로 넘어가자는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000029',
    'Can you *fill me in* on the details?',
    'tell me about',
    'leave me out',
    'forget about',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Fill me in''은 정보를 알려달라는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000030',
    'We need to *work out* the problems.',
    'solve',
    'create',
    'ignore',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Work out''은 문제를 해결한다는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000031',
    'Please *hold on* for a moment.',
    'wait',
    'continue',
    'leave',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Hold on''은 잠시 기다리라는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000032',
    'Let''s *wrap up* the meeting.',
    'finish',
    'start',
    'continue',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Wrap up''은 마무리하자는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000033',
    'Can you *bring up* that issue?',
    'mention',
    'forget',
    'hide',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Bring up''은 이슈를 언급하라는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000034',
    'We should *look into* this matter.',
    'investigate',
    'ignore',
    'forget',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Look into''는 조사하자는 의미입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000035',
    'We are running out of time, so let''s *wrap up*.',
    'finish',
    'start',
    'delay',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Wrap up''은 마무리하자는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000036',
    'I''ll *get back to you* on that.',
    'respond to you later',
    'forget about it',
    'agree with you',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Get back to you''는 나중에 답변하겠다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000037',
    'Let''s *touch base* next week.',
    'check in with each other',
    'avoid each other',
    'compete',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Touch base''는 서로 연락하자는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000038',
    'We need to *iron out* the details.',
    'resolve',
    'complicate',
    'ignore',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Iron out''은 세부사항을 해결한다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000039',
    'Please *keep me posted* on the progress.',
    'inform me regularly',
    'leave me alone',
    'hide from me',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Keep me posted''는 정기적으로 알려달라는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000040',
    'Let''s *put this on hold* for now.',
    'postpone',
    'accelerate',
    'complete',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Put on hold''는 보류하자는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000041',
    'We should *think it through* carefully.',
    'consider thoroughly',
    'decide quickly',
    'ignore completely',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Think it through''는 신중히 고려하자는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000042',
    'Can you *break down* the costs?',
    'analyze in detail',
    'combine together',
    'hide completely',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Break down''은 자세히 분석하라는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000043',
    'Let''s *nail down* the specifics.',
    'finalize',
    'avoid',
    'postpone',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Nail down''은 구체적으로 확정하자는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000044',
    'We need to *step up* our efforts.',
    'increase',
    'decrease',
    'stop',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Step up''은 노력을 증가시키자는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000045',
    'Let''s *table this discussion* for now.',
    'postpone the discussion',
    'end the discussion',
    'start the discussion',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Table the discussion''은 논의를 보류하자는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000046',
    'We need to *think outside the box* for a solution.',
    'think creatively',
    'think carefully',
    'think logically',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Think outside the box''는 창의적으로 생각하자는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000047',
    'This initiative will *break new ground*.',
    'pioneer something innovative',
    'repeat old methods',
    'abandon the project',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Break new ground''는 새로운 분야를 개척한다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000048',
    'We must *leverage our core competencies*.',
    'utilize our main strengths',
    'ignore our abilities',
    'hide our skills',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Leverage core competencies''는 핵심 역량을 활용한다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000049',
    'Let''s *drill down* into the metrics.',
    'examine in great detail',
    'ignore completely',
    'summarize briefly',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Drill down''은 세부적으로 검토한다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000050',
    'We need to *synergize our efforts* across departments.',
    'coordinate collaboratively',
    'work independently',
    'compete internally',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Synergize efforts''는 협력적으로 조정한다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000051',
    'This strategy will *differentiate us* in the market.',
    'make us unique',
    'make us similar',
    'make us invisible',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Differentiate''는 차별화한다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000052',
    'Let''s *operationalize* these concepts.',
    'implement practically',
    'theorize abstractly',
    'ignore completely',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Operationalize''는 실제로 구현한다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000053',
    'We should *benchmark* against industry leaders.',
    'compare with',
    'ignore',
    'compete against',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Benchmark''는 업계 리더와 비교한다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000054',
    'This will *streamline* our processes.',
    'make more efficient',
    'make more complex',
    'eliminate completely',
    'A',
    'business',
    'meeting-conference',
    'sentence',
    '''Streamline''은 프로세스를 효율화한다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000055',
    'Can we ____ a time for the meeting?',
    'set',
    'put',
    'do',
    'A',
    'business',
    'meeting-conference',
    'word',
    '시간을 정할 때 ''set a time''이라는 표현을 사용합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000056',
    'Please send me the ____ before the meeting.',
    'agenda',
    'menu',
    'map',
    'A',
    'business',
    'meeting-conference',
    'word',
    '회의 전에 논의할 주제 목록인 ''agenda''를 요청하는 것이 자연스럽습니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000057',
    'The meeting will ____ at 2 PM.',
    'start',
    'stop',
    'pause',
    'A',
    'business',
    'meeting-conference',
    'word',
    '회의가 시작될 때 ''start''를 사용합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000058',
    'Please ____ the presentation.',
    'prepare',
    'eat',
    'buy',
    'A',
    'business',
    'meeting-conference',
    'word',
    '발표를 준비할 때 ''prepare''를 사용합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000059',
    'We need to ____ the schedule.',
    'check',
    'cook',
    'clean',
    'A',
    'business',
    'meeting-conference',
    'word',
    '일정을 확인할 때 ''check''를 사용합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000060',
    'Let''s ____ the main points.',
    'discuss',
    'dance',
    'drive',
    'A',
    'business',
    'meeting-conference',
    'word',
    '요점을 논의할 때 ''discuss''를 사용합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000061',
    'The ____ is very important.',
    'meeting',
    'movie',
    'music',
    'A',
    'business',
    'meeting-conference',
    'word',
    '회의가 중요할 때 ''meeting''을 사용합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000062',
    'Please ____ on time.',
    'arrive',
    'sleep',
    'eat',
    'A',
    'business',
    'meeting-conference',
    'word',
    '시간에 맞춰 도착할 때 ''arrive''를 사용합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000063',
    'We will ____ the decision tomorrow.',
    'make',
    'take',
    'give',
    'A',
    'business',
    'meeting-conference',
    'word',
    '결정을 내릴 때 ''make a decision''을 사용합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000064',
    'The ____ room is ready.',
    'conference',
    'kitchen',
    'bedroom',
    'A',
    'business',
    'meeting-conference',
    'word',
    '회의실을 말할 때 ''conference room''을 사용합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000065',
    'We need to ____ on the key decisions.',
    'follow up',
    'fall behind',
    'drop out',
    'A',
    'business',
    'meeting-conference',
    'word',
    '''Follow up''은 후속 조치를 취한다는 의미입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000066',
    'Let''s try to ____ the deadline.',
    'meet',
    'see',
    'go',
    'A',
    'business',
    'meeting-conference',
    'word',
    '마감일을 맞추다는 의미로 ''meet the deadline''을 사용합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000067',
    'The project requires careful ____.',
    'planning',
    'cooking',
    'sleeping',
    'A',
    'business',
    'meeting-conference',
    'word',
    '프로젝트에는 신중한 계획이 필요합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000068',
    'We should ____ the budget first.',
    'review',
    'ignore',
    'forget',
    'A',
    'business',
    'meeting-conference',
    'word',
    '예산을 검토해야 할 때 ''review''를 사용합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000069',
    'The team needs to ____ effectively.',
    'collaborate',
    'compete',
    'complain',
    'A',
    'business',
    'meeting-conference',
    'word',
    '효과적인 협력을 위해 ''collaborate''를 사용합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000070',
    'Let''s ____ the presentation format.',
    'standardize',
    'randomize',
    'memorize',
    'A',
    'business',
    'meeting-conference',
    'word',
    '발표 형식을 표준화할 때 ''standardize''를 사용합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000071',
    'We must ____ our objectives clearly.',
    'define',
    'ignore',
    'forget',
    'A',
    'business',
    'meeting-conference',
    'word',
    '목표를 명확히 정의할 때 ''define''를 사용합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000072',
    'The manager will ____ the final decision.',
    'authorize',
    'prevent',
    'delay',
    'A',
    'business',
    'meeting-conference',
    'word',
    '최종 결정을 승인할 때 ''authorize''를 사용합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000073',
    'Please ____ the meeting minutes.',
    'distribute',
    'hide',
    'destroy',
    'A',
    'business',
    'meeting-conference',
    'word',
    '회의록을 배포할 때 ''distribute''를 사용합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000074',
    'We need to ____ our strategy.',
    'adjust',
    'abandon',
    'ignore',
    'A',
    'business',
    'meeting-conference',
    'word',
    '전략을 조정할 때 ''adjust''를 사용합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000075',
    'The purpose of this meeting is to ____ a consensus.',
    'reach',
    'make',
    'find',
    'A',
    'business',
    'meeting-conference',
    'word',
    '''Reach a consensus''는 합의에 도달한다는 의미입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000076',
    'We need to consider the long-term ____ of this decision.',
    'implications',
    'applications',
    'complications',
    'A',
    'business',
    'meeting-conference',
    'word',
    '''Implications''는 결정이 가져올 장기적인 영향을 의미합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000077',
    'The proposal requires ____ analysis.',
    'comprehensive',
    'simple',
    'quick',
    'A',
    'business',
    'meeting-conference',
    'word',
    '제안서에는 포괄적인 분석이 필요합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000078',
    'We must ____ all stakeholders in this process.',
    'engage',
    'exclude',
    'ignore',
    'A',
    'business',
    'meeting-conference',
    'word',
    '모든 이해관계자를 참여시킬 때 ''engage''를 사용합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000079',
    'The initiative aims to ____ operational efficiency.',
    'optimize',
    'minimize',
    'eliminate',
    'A',
    'business',
    'meeting-conference',
    'word',
    '운영 효율성을 최적화할 때 ''optimize''를 사용합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000080',
    'Let''s ____ the strategic objectives.',
    'articulate',
    'obscure',
    'confuse',
    'A',
    'business',
    'meeting-conference',
    'word',
    '전략적 목표를 명확히 표현할 때 ''articulate''를 사용합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000081',
    'The framework will ____ sustainable growth.',
    'facilitate',
    'hinder',
    'prevent',
    'A',
    'business',
    'meeting-conference',
    'word',
    '지속 가능한 성장을 촉진할 때 ''facilitate''를 사용합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000082',
    'We need to ____ market dynamics carefully.',
    'evaluate',
    'ignore',
    'guess',
    'A',
    'business',
    'meeting-conference',
    'word',
    '시장 역학을 신중히 평가할 때 ''evaluate''를 사용합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000083',
    'The methodology should be ____.',
    'rigorous',
    'casual',
    'random',
    'A',
    'business',
    'meeting-conference',
    'word',
    '방법론은 엄밀해야 합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000084',
    'Let''s ____ the competitive landscape.',
    'assess',
    'ignore',
    'avoid',
    'A',
    'business',
    'meeting-conference',
    'word',
    '경쟁 환경을 평가할 때 ''assess''를 사용합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000085',
    'This is a sentence question for daily/shopping-eating-out at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000086',
    'This is a sentence question for daily/shopping-eating-out at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000087',
    'This is a sentence question for daily/shopping-eating-out at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000088',
    'This is a sentence question for daily/shopping-eating-out at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000089',
    'This is a sentence question for daily/shopping-eating-out at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000090',
    'This is a sentence question for daily/shopping-eating-out at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000091',
    'This is a sentence question for daily/shopping-eating-out at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000092',
    'This is a sentence question for daily/shopping-eating-out at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000093',
    'This is a sentence question for daily/shopping-eating-out at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000094',
    'This is a sentence question for daily/shopping-eating-out at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000095',
    'This is a sentence question for daily/shopping-eating-out at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000096',
    'This is a sentence question for daily/shopping-eating-out at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000097',
    'This is a sentence question for daily/shopping-eating-out at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000098',
    'This is a sentence question for daily/shopping-eating-out at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000099',
    'This is a sentence question for daily/shopping-eating-out at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000100',
    'This is a sentence question for daily/shopping-eating-out at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000101',
    'This is a sentence question for daily/shopping-eating-out at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000102',
    'This is a sentence question for daily/shopping-eating-out at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000103',
    'This is a sentence question for daily/shopping-eating-out at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000104',
    'This is a sentence question for daily/shopping-eating-out at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000105',
    'This is a sentence question for daily/shopping-eating-out at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000106',
    'This is a sentence question for daily/shopping-eating-out at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000107',
    'This is a sentence question for daily/shopping-eating-out at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000108',
    'This is a sentence question for daily/shopping-eating-out at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000109',
    'This is a sentence question for daily/shopping-eating-out at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000110',
    'This is a sentence question for daily/shopping-eating-out at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000111',
    'This is a sentence question for daily/shopping-eating-out at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000112',
    'This is a sentence question for daily/shopping-eating-out at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000113',
    'This is a sentence question for daily/shopping-eating-out at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000114',
    'This is a sentence question for daily/shopping-eating-out at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000115',
    'This is a word question for daily/shopping-eating-out at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000116',
    'This is a word question for daily/shopping-eating-out at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000117',
    'This is a word question for daily/shopping-eating-out at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000118',
    'This is a word question for daily/shopping-eating-out at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000119',
    'This is a word question for daily/shopping-eating-out at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000120',
    'This is a word question for daily/shopping-eating-out at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000121',
    'This is a word question for daily/shopping-eating-out at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000122',
    'This is a word question for daily/shopping-eating-out at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000123',
    'This is a word question for daily/shopping-eating-out at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000124',
    'This is a word question for daily/shopping-eating-out at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000125',
    'This is a word question for daily/shopping-eating-out at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000126',
    'This is a word question for daily/shopping-eating-out at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000127',
    'This is a word question for daily/shopping-eating-out at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000128',
    'This is a word question for daily/shopping-eating-out at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000129',
    'This is a word question for daily/shopping-eating-out at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000130',
    'This is a word question for daily/shopping-eating-out at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000131',
    'This is a word question for daily/shopping-eating-out at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000132',
    'This is a word question for daily/shopping-eating-out at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000133',
    'This is a word question for daily/shopping-eating-out at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000134',
    'This is a word question for daily/shopping-eating-out at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000135',
    'This is a word question for daily/shopping-eating-out at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000136',
    'This is a word question for daily/shopping-eating-out at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000137',
    'This is a word question for daily/shopping-eating-out at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000138',
    'This is a word question for daily/shopping-eating-out at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000139',
    'This is a word question for daily/shopping-eating-out at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000140',
    'This is a word question for daily/shopping-eating-out at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000141',
    'This is a word question for daily/shopping-eating-out at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000142',
    'This is a word question for daily/shopping-eating-out at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000143',
    'This is a word question for daily/shopping-eating-out at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000144',
    'This is a word question for daily/shopping-eating-out at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'shopping-eating-out',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000145',
    'This is a sentence question for daily/using-hospital at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000146',
    'This is a sentence question for daily/using-hospital at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000147',
    'This is a sentence question for daily/using-hospital at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000148',
    'This is a sentence question for daily/using-hospital at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000149',
    'This is a sentence question for daily/using-hospital at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000150',
    'This is a sentence question for daily/using-hospital at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000151',
    'This is a sentence question for daily/using-hospital at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000152',
    'This is a sentence question for daily/using-hospital at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000153',
    'This is a sentence question for daily/using-hospital at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000154',
    'This is a sentence question for daily/using-hospital at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000155',
    'This is a sentence question for daily/using-hospital at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000156',
    'This is a sentence question for daily/using-hospital at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000157',
    'This is a sentence question for daily/using-hospital at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000158',
    'This is a sentence question for daily/using-hospital at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000159',
    'This is a sentence question for daily/using-hospital at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000160',
    'This is a sentence question for daily/using-hospital at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000161',
    'This is a sentence question for daily/using-hospital at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000162',
    'This is a sentence question for daily/using-hospital at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000163',
    'This is a sentence question for daily/using-hospital at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000164',
    'This is a sentence question for daily/using-hospital at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000165',
    'This is a sentence question for daily/using-hospital at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000166',
    'This is a sentence question for daily/using-hospital at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000167',
    'This is a sentence question for daily/using-hospital at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000168',
    'This is a sentence question for daily/using-hospital at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000169',
    'This is a sentence question for daily/using-hospital at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000170',
    'This is a sentence question for daily/using-hospital at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000171',
    'This is a sentence question for daily/using-hospital at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000172',
    'This is a sentence question for daily/using-hospital at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000173',
    'This is a sentence question for daily/using-hospital at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000174',
    'This is a sentence question for daily/using-hospital at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000175',
    'This is a word question for daily/using-hospital at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000176',
    'This is a word question for daily/using-hospital at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000177',
    'This is a word question for daily/using-hospital at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000178',
    'This is a word question for daily/using-hospital at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000179',
    'This is a word question for daily/using-hospital at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000180',
    'This is a word question for daily/using-hospital at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000181',
    'This is a word question for daily/using-hospital at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000182',
    'This is a word question for daily/using-hospital at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000183',
    'This is a word question for daily/using-hospital at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000184',
    'This is a word question for daily/using-hospital at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000185',
    'This is a word question for daily/using-hospital at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000186',
    'This is a word question for daily/using-hospital at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000187',
    'This is a word question for daily/using-hospital at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000188',
    'This is a word question for daily/using-hospital at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000189',
    'This is a word question for daily/using-hospital at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000190',
    'This is a word question for daily/using-hospital at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000191',
    'This is a word question for daily/using-hospital at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000192',
    'This is a word question for daily/using-hospital at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000193',
    'This is a word question for daily/using-hospital at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000194',
    'This is a word question for daily/using-hospital at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000195',
    'This is a word question for daily/using-hospital at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000196',
    'This is a word question for daily/using-hospital at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000197',
    'This is a word question for daily/using-hospital at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000198',
    'This is a word question for daily/using-hospital at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000199',
    'This is a word question for daily/using-hospital at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000200',
    'This is a word question for daily/using-hospital at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000201',
    'This is a word question for daily/using-hospital at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000202',
    'This is a word question for daily/using-hospital at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000203',
    'This is a word question for daily/using-hospital at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000204',
    'This is a word question for daily/using-hospital at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-hospital',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000205',
    'This is a sentence question for daily/using-public-transportation at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000206',
    'This is a sentence question for daily/using-public-transportation at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000207',
    'This is a sentence question for daily/using-public-transportation at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000208',
    'This is a sentence question for daily/using-public-transportation at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000209',
    'This is a sentence question for daily/using-public-transportation at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000210',
    'This is a sentence question for daily/using-public-transportation at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000211',
    'This is a sentence question for daily/using-public-transportation at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000212',
    'This is a sentence question for daily/using-public-transportation at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000213',
    'This is a sentence question for daily/using-public-transportation at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000214',
    'This is a sentence question for daily/using-public-transportation at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000215',
    'This is a sentence question for daily/using-public-transportation at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000216',
    'This is a sentence question for daily/using-public-transportation at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000217',
    'This is a sentence question for daily/using-public-transportation at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000218',
    'This is a sentence question for daily/using-public-transportation at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000219',
    'This is a sentence question for daily/using-public-transportation at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000220',
    'This is a sentence question for daily/using-public-transportation at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000221',
    'This is a sentence question for daily/using-public-transportation at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000222',
    'This is a sentence question for daily/using-public-transportation at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000223',
    'This is a sentence question for daily/using-public-transportation at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000224',
    'This is a sentence question for daily/using-public-transportation at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000225',
    'This is a sentence question for daily/using-public-transportation at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000226',
    'This is a sentence question for daily/using-public-transportation at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000227',
    'This is a sentence question for daily/using-public-transportation at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000228',
    'This is a sentence question for daily/using-public-transportation at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000229',
    'This is a sentence question for daily/using-public-transportation at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000230',
    'This is a sentence question for daily/using-public-transportation at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000231',
    'This is a sentence question for daily/using-public-transportation at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000232',
    'This is a sentence question for daily/using-public-transportation at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000233',
    'This is a sentence question for daily/using-public-transportation at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000234',
    'This is a sentence question for daily/using-public-transportation at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000235',
    'This is a word question for daily/using-public-transportation at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000236',
    'This is a word question for daily/using-public-transportation at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000237',
    'This is a word question for daily/using-public-transportation at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000238',
    'This is a word question for daily/using-public-transportation at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000239',
    'This is a word question for daily/using-public-transportation at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000240',
    'This is a word question for daily/using-public-transportation at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000241',
    'This is a word question for daily/using-public-transportation at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000242',
    'This is a word question for daily/using-public-transportation at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000243',
    'This is a word question for daily/using-public-transportation at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000244',
    'This is a word question for daily/using-public-transportation at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000245',
    'This is a word question for daily/using-public-transportation at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000246',
    'This is a word question for daily/using-public-transportation at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000247',
    'This is a word question for daily/using-public-transportation at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000248',
    'This is a word question for daily/using-public-transportation at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000249',
    'This is a word question for daily/using-public-transportation at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000250',
    'This is a word question for daily/using-public-transportation at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000251',
    'This is a word question for daily/using-public-transportation at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000252',
    'This is a word question for daily/using-public-transportation at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000253',
    'This is a word question for daily/using-public-transportation at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000254',
    'This is a word question for daily/using-public-transportation at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000255',
    'This is a word question for daily/using-public-transportation at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000256',
    'This is a word question for daily/using-public-transportation at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000257',
    'This is a word question for daily/using-public-transportation at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000258',
    'This is a word question for daily/using-public-transportation at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000259',
    'This is a word question for daily/using-public-transportation at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000260',
    'This is a word question for daily/using-public-transportation at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000261',
    'This is a word question for daily/using-public-transportation at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000262',
    'This is a word question for daily/using-public-transportation at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000263',
    'This is a word question for daily/using-public-transportation at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000264',
    'This is a word question for daily/using-public-transportation at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'daily',
    'using-public-transportation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000265',
    'This is a sentence question for school/assignment-test-preparation at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000266',
    'This is a sentence question for school/assignment-test-preparation at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000267',
    'This is a sentence question for school/assignment-test-preparation at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000268',
    'This is a sentence question for school/assignment-test-preparation at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000269',
    'This is a sentence question for school/assignment-test-preparation at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000270',
    'This is a sentence question for school/assignment-test-preparation at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000271',
    'This is a sentence question for school/assignment-test-preparation at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000272',
    'This is a sentence question for school/assignment-test-preparation at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000273',
    'This is a sentence question for school/assignment-test-preparation at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000274',
    'This is a sentence question for school/assignment-test-preparation at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000275',
    'This is a sentence question for school/assignment-test-preparation at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000276',
    'This is a sentence question for school/assignment-test-preparation at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000277',
    'This is a sentence question for school/assignment-test-preparation at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000278',
    'This is a sentence question for school/assignment-test-preparation at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000279',
    'This is a sentence question for school/assignment-test-preparation at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000280',
    'This is a sentence question for school/assignment-test-preparation at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000281',
    'This is a sentence question for school/assignment-test-preparation at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000282',
    'This is a sentence question for school/assignment-test-preparation at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000283',
    'This is a sentence question for school/assignment-test-preparation at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000284',
    'This is a sentence question for school/assignment-test-preparation at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000285',
    'This is a sentence question for school/assignment-test-preparation at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000286',
    'This is a sentence question for school/assignment-test-preparation at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000287',
    'This is a sentence question for school/assignment-test-preparation at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000288',
    'This is a sentence question for school/assignment-test-preparation at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000289',
    'This is a sentence question for school/assignment-test-preparation at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000290',
    'This is a sentence question for school/assignment-test-preparation at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000291',
    'This is a sentence question for school/assignment-test-preparation at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000292',
    'This is a sentence question for school/assignment-test-preparation at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000293',
    'This is a sentence question for school/assignment-test-preparation at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000294',
    'This is a sentence question for school/assignment-test-preparation at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000295',
    'This is a word question for school/assignment-test-preparation at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000296',
    'This is a word question for school/assignment-test-preparation at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000297',
    'This is a word question for school/assignment-test-preparation at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000298',
    'This is a word question for school/assignment-test-preparation at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000299',
    'This is a word question for school/assignment-test-preparation at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000300',
    'This is a word question for school/assignment-test-preparation at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000301',
    'This is a word question for school/assignment-test-preparation at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000302',
    'This is a word question for school/assignment-test-preparation at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000303',
    'This is a word question for school/assignment-test-preparation at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000304',
    'This is a word question for school/assignment-test-preparation at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000305',
    'This is a word question for school/assignment-test-preparation at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000306',
    'This is a word question for school/assignment-test-preparation at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000307',
    'This is a word question for school/assignment-test-preparation at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000308',
    'This is a word question for school/assignment-test-preparation at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000309',
    'This is a word question for school/assignment-test-preparation at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000310',
    'This is a word question for school/assignment-test-preparation at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000311',
    'This is a word question for school/assignment-test-preparation at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000312',
    'This is a word question for school/assignment-test-preparation at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000313',
    'This is a word question for school/assignment-test-preparation at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000314',
    'This is a word question for school/assignment-test-preparation at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000315',
    'This is a word question for school/assignment-test-preparation at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000316',
    'This is a word question for school/assignment-test-preparation at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000317',
    'This is a word question for school/assignment-test-preparation at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000318',
    'This is a word question for school/assignment-test-preparation at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000319',
    'This is a word question for school/assignment-test-preparation at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000320',
    'This is a word question for school/assignment-test-preparation at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000321',
    'This is a word question for school/assignment-test-preparation at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000322',
    'This is a word question for school/assignment-test-preparation at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000323',
    'This is a word question for school/assignment-test-preparation at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000324',
    'This is a word question for school/assignment-test-preparation at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'assignment-test-preparation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000325',
    'This is a sentence question for school/attending-class at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000326',
    'This is a sentence question for school/attending-class at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000327',
    'This is a sentence question for school/attending-class at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000328',
    'This is a sentence question for school/attending-class at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000329',
    'This is a sentence question for school/attending-class at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000330',
    'This is a sentence question for school/attending-class at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000331',
    'This is a sentence question for school/attending-class at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000332',
    'This is a sentence question for school/attending-class at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000333',
    'This is a sentence question for school/attending-class at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000334',
    'This is a sentence question for school/attending-class at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000335',
    'This is a sentence question for school/attending-class at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000336',
    'This is a sentence question for school/attending-class at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000337',
    'This is a sentence question for school/attending-class at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000338',
    'This is a sentence question for school/attending-class at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000339',
    'This is a sentence question for school/attending-class at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000340',
    'This is a sentence question for school/attending-class at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000341',
    'This is a sentence question for school/attending-class at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000342',
    'This is a sentence question for school/attending-class at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000343',
    'This is a sentence question for school/attending-class at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000344',
    'This is a sentence question for school/attending-class at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000345',
    'This is a sentence question for school/attending-class at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000346',
    'This is a sentence question for school/attending-class at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000347',
    'This is a sentence question for school/attending-class at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000348',
    'This is a sentence question for school/attending-class at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000349',
    'This is a sentence question for school/attending-class at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000350',
    'This is a sentence question for school/attending-class at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000351',
    'This is a sentence question for school/attending-class at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000352',
    'This is a sentence question for school/attending-class at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000353',
    'This is a sentence question for school/attending-class at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000354',
    'This is a sentence question for school/attending-class at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000355',
    'This is a word question for school/attending-class at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000356',
    'This is a word question for school/attending-class at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000357',
    'This is a word question for school/attending-class at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000358',
    'This is a word question for school/attending-class at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000359',
    'This is a word question for school/attending-class at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000360',
    'This is a word question for school/attending-class at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000361',
    'This is a word question for school/attending-class at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000362',
    'This is a word question for school/attending-class at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000363',
    'This is a word question for school/attending-class at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000364',
    'This is a word question for school/attending-class at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000365',
    'This is a word question for school/attending-class at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000366',
    'This is a word question for school/attending-class at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000367',
    'This is a word question for school/attending-class at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000368',
    'This is a word question for school/attending-class at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000369',
    'This is a word question for school/attending-class at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000370',
    'This is a word question for school/attending-class at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000371',
    'This is a word question for school/attending-class at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000372',
    'This is a word question for school/attending-class at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000373',
    'This is a word question for school/attending-class at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000374',
    'This is a word question for school/attending-class at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000375',
    'This is a word question for school/attending-class at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000376',
    'This is a word question for school/attending-class at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000377',
    'This is a word question for school/attending-class at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000378',
    'This is a word question for school/attending-class at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000379',
    'This is a word question for school/attending-class at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000380',
    'This is a word question for school/attending-class at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000381',
    'This is a word question for school/attending-class at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000382',
    'This is a word question for school/attending-class at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000383',
    'This is a word question for school/attending-class at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000384',
    'This is a word question for school/attending-class at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'attending-class',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000385',
    'This is a sentence question for school/department-conversation at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000386',
    'This is a sentence question for school/department-conversation at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000387',
    'This is a sentence question for school/department-conversation at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000388',
    'This is a sentence question for school/department-conversation at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000389',
    'This is a sentence question for school/department-conversation at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000390',
    'This is a sentence question for school/department-conversation at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000391',
    'This is a sentence question for school/department-conversation at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000392',
    'This is a sentence question for school/department-conversation at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000393',
    'This is a sentence question for school/department-conversation at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000394',
    'This is a sentence question for school/department-conversation at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000395',
    'This is a sentence question for school/department-conversation at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000396',
    'This is a sentence question for school/department-conversation at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000397',
    'This is a sentence question for school/department-conversation at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000398',
    'This is a sentence question for school/department-conversation at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000399',
    'This is a sentence question for school/department-conversation at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000400',
    'This is a sentence question for school/department-conversation at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000401',
    'This is a sentence question for school/department-conversation at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000402',
    'This is a sentence question for school/department-conversation at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000403',
    'This is a sentence question for school/department-conversation at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000404',
    'This is a sentence question for school/department-conversation at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000405',
    'This is a sentence question for school/department-conversation at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000406',
    'This is a sentence question for school/department-conversation at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000407',
    'This is a sentence question for school/department-conversation at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000408',
    'This is a sentence question for school/department-conversation at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000409',
    'This is a sentence question for school/department-conversation at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000410',
    'This is a sentence question for school/department-conversation at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000411',
    'This is a sentence question for school/department-conversation at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000412',
    'This is a sentence question for school/department-conversation at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000413',
    'This is a sentence question for school/department-conversation at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000414',
    'This is a sentence question for school/department-conversation at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000415',
    'This is a word question for school/department-conversation at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000416',
    'This is a word question for school/department-conversation at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000417',
    'This is a word question for school/department-conversation at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000418',
    'This is a word question for school/department-conversation at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000419',
    'This is a word question for school/department-conversation at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000420',
    'This is a word question for school/department-conversation at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000421',
    'This is a word question for school/department-conversation at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000422',
    'This is a word question for school/department-conversation at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000423',
    'This is a word question for school/department-conversation at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000424',
    'This is a word question for school/department-conversation at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000425',
    'This is a word question for school/department-conversation at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000426',
    'This is a word question for school/department-conversation at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000427',
    'This is a word question for school/department-conversation at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000428',
    'This is a word question for school/department-conversation at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000429',
    'This is a word question for school/department-conversation at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000430',
    'This is a word question for school/department-conversation at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000431',
    'This is a word question for school/department-conversation at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000432',
    'This is a word question for school/department-conversation at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000433',
    'This is a word question for school/department-conversation at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000434',
    'This is a word question for school/department-conversation at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000435',
    'This is a word question for school/department-conversation at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000436',
    'This is a word question for school/department-conversation at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000437',
    'This is a word question for school/department-conversation at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000438',
    'This is a word question for school/department-conversation at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000439',
    'This is a word question for school/department-conversation at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000440',
    'This is a word question for school/department-conversation at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000441',
    'This is a word question for school/department-conversation at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000442',
    'This is a word question for school/department-conversation at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000443',
    'This is a word question for school/department-conversation at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000444',
    'This is a word question for school/department-conversation at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'school',
    'department-conversation',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000445',
    'This is a sentence question for travel/backpacking at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000446',
    'This is a sentence question for travel/backpacking at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000447',
    'This is a sentence question for travel/backpacking at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000448',
    'This is a sentence question for travel/backpacking at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000449',
    'This is a sentence question for travel/backpacking at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000450',
    'This is a sentence question for travel/backpacking at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000451',
    'This is a sentence question for travel/backpacking at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000452',
    'This is a sentence question for travel/backpacking at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000453',
    'This is a sentence question for travel/backpacking at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000454',
    'This is a sentence question for travel/backpacking at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000455',
    'This is a sentence question for travel/backpacking at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000456',
    'This is a sentence question for travel/backpacking at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000457',
    'This is a sentence question for travel/backpacking at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000458',
    'This is a sentence question for travel/backpacking at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000459',
    'This is a sentence question for travel/backpacking at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000460',
    'This is a sentence question for travel/backpacking at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000461',
    'This is a sentence question for travel/backpacking at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000462',
    'This is a sentence question for travel/backpacking at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000463',
    'This is a sentence question for travel/backpacking at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000464',
    'This is a sentence question for travel/backpacking at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000465',
    'This is a sentence question for travel/backpacking at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000466',
    'This is a sentence question for travel/backpacking at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000467',
    'This is a sentence question for travel/backpacking at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000468',
    'This is a sentence question for travel/backpacking at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000469',
    'This is a sentence question for travel/backpacking at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000470',
    'This is a sentence question for travel/backpacking at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000471',
    'This is a sentence question for travel/backpacking at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000472',
    'This is a sentence question for travel/backpacking at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000473',
    'This is a sentence question for travel/backpacking at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000474',
    'This is a sentence question for travel/backpacking at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000475',
    'This is a word question for travel/backpacking at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000476',
    'This is a word question for travel/backpacking at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000477',
    'This is a word question for travel/backpacking at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000478',
    'This is a word question for travel/backpacking at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000479',
    'This is a word question for travel/backpacking at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000480',
    'This is a word question for travel/backpacking at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000481',
    'This is a word question for travel/backpacking at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000482',
    'This is a word question for travel/backpacking at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000483',
    'This is a word question for travel/backpacking at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000484',
    'This is a word question for travel/backpacking at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000485',
    'This is a word question for travel/backpacking at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000486',
    'This is a word question for travel/backpacking at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000487',
    'This is a word question for travel/backpacking at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000488',
    'This is a word question for travel/backpacking at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000489',
    'This is a word question for travel/backpacking at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000490',
    'This is a word question for travel/backpacking at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000491',
    'This is a word question for travel/backpacking at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000492',
    'This is a word question for travel/backpacking at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000493',
    'This is a word question for travel/backpacking at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000494',
    'This is a word question for travel/backpacking at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000495',
    'This is a word question for travel/backpacking at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000496',
    'This is a word question for travel/backpacking at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000497',
    'This is a word question for travel/backpacking at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000498',
    'This is a word question for travel/backpacking at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000499',
    'This is a word question for travel/backpacking at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000500',
    'This is a word question for travel/backpacking at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000501',
    'This is a word question for travel/backpacking at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000502',
    'This is a word question for travel/backpacking at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000503',
    'This is a word question for travel/backpacking at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000504',
    'This is a word question for travel/backpacking at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'backpacking',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000505',
    'This is a sentence question for travel/family-trip at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000506',
    'This is a sentence question for travel/family-trip at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000507',
    'This is a sentence question for travel/family-trip at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000508',
    'This is a sentence question for travel/family-trip at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000509',
    'This is a sentence question for travel/family-trip at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000510',
    'This is a sentence question for travel/family-trip at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000511',
    'This is a sentence question for travel/family-trip at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000512',
    'This is a sentence question for travel/family-trip at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000513',
    'This is a sentence question for travel/family-trip at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000514',
    'This is a sentence question for travel/family-trip at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000515',
    'This is a sentence question for travel/family-trip at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000516',
    'This is a sentence question for travel/family-trip at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000517',
    'This is a sentence question for travel/family-trip at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000518',
    'This is a sentence question for travel/family-trip at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000519',
    'This is a sentence question for travel/family-trip at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000520',
    'This is a sentence question for travel/family-trip at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000521',
    'This is a sentence question for travel/family-trip at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000522',
    'This is a sentence question for travel/family-trip at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000523',
    'This is a sentence question for travel/family-trip at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000524',
    'This is a sentence question for travel/family-trip at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000525',
    'This is a sentence question for travel/family-trip at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000526',
    'This is a sentence question for travel/family-trip at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000527',
    'This is a sentence question for travel/family-trip at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000528',
    'This is a sentence question for travel/family-trip at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000529',
    'This is a sentence question for travel/family-trip at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000530',
    'This is a sentence question for travel/family-trip at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000531',
    'This is a sentence question for travel/family-trip at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000532',
    'This is a sentence question for travel/family-trip at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000533',
    'This is a sentence question for travel/family-trip at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000534',
    'This is a sentence question for travel/family-trip at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000535',
    'This is a word question for travel/family-trip at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000536',
    'This is a word question for travel/family-trip at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000537',
    'This is a word question for travel/family-trip at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000538',
    'This is a word question for travel/family-trip at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000539',
    'This is a word question for travel/family-trip at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000540',
    'This is a word question for travel/family-trip at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000541',
    'This is a word question for travel/family-trip at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000542',
    'This is a word question for travel/family-trip at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000543',
    'This is a word question for travel/family-trip at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000544',
    'This is a word question for travel/family-trip at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000545',
    'This is a word question for travel/family-trip at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000546',
    'This is a word question for travel/family-trip at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000547',
    'This is a word question for travel/family-trip at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000548',
    'This is a word question for travel/family-trip at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000549',
    'This is a word question for travel/family-trip at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000550',
    'This is a word question for travel/family-trip at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000551',
    'This is a word question for travel/family-trip at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000552',
    'This is a word question for travel/family-trip at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000553',
    'This is a word question for travel/family-trip at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000554',
    'This is a word question for travel/family-trip at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000555',
    'This is a word question for travel/family-trip at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000556',
    'This is a word question for travel/family-trip at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000557',
    'This is a word question for travel/family-trip at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000558',
    'This is a word question for travel/family-trip at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000559',
    'This is a word question for travel/family-trip at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000560',
    'This is a word question for travel/family-trip at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000561',
    'This is a word question for travel/family-trip at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000562',
    'This is a word question for travel/family-trip at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000563',
    'This is a word question for travel/family-trip at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000564',
    'This is a word question for travel/family-trip at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'family-trip',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000565',
    'This is a sentence question for travel/trip-with-friends at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000566',
    'This is a sentence question for travel/trip-with-friends at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000567',
    'This is a sentence question for travel/trip-with-friends at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000568',
    'This is a sentence question for travel/trip-with-friends at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000569',
    'This is a sentence question for travel/trip-with-friends at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000570',
    'This is a sentence question for travel/trip-with-friends at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000571',
    'This is a sentence question for travel/trip-with-friends at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000572',
    'This is a sentence question for travel/trip-with-friends at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000573',
    'This is a sentence question for travel/trip-with-friends at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000574',
    'This is a sentence question for travel/trip-with-friends at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000575',
    'This is a sentence question for travel/trip-with-friends at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000576',
    'This is a sentence question for travel/trip-with-friends at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000577',
    'This is a sentence question for travel/trip-with-friends at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000578',
    'This is a sentence question for travel/trip-with-friends at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000579',
    'This is a sentence question for travel/trip-with-friends at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000580',
    'This is a sentence question for travel/trip-with-friends at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000581',
    'This is a sentence question for travel/trip-with-friends at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000582',
    'This is a sentence question for travel/trip-with-friends at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000583',
    'This is a sentence question for travel/trip-with-friends at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000584',
    'This is a sentence question for travel/trip-with-friends at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000585',
    'This is a sentence question for travel/trip-with-friends at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000586',
    'This is a sentence question for travel/trip-with-friends at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000587',
    'This is a sentence question for travel/trip-with-friends at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000588',
    'This is a sentence question for travel/trip-with-friends at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000589',
    'This is a sentence question for travel/trip-with-friends at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000590',
    'This is a sentence question for travel/trip-with-friends at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000591',
    'This is a sentence question for travel/trip-with-friends at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000592',
    'This is a sentence question for travel/trip-with-friends at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000593',
    'This is a sentence question for travel/trip-with-friends at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000594',
    'This is a sentence question for travel/trip-with-friends at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'sentence',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000595',
    'This is a word question for travel/trip-with-friends at A level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000596',
    'This is a word question for travel/trip-with-friends at A level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000597',
    'This is a word question for travel/trip-with-friends at A level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000598',
    'This is a word question for travel/trip-with-friends at A level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000599',
    'This is a word question for travel/trip-with-friends at A level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000600',
    'This is a word question for travel/trip-with-friends at A level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000601',
    'This is a word question for travel/trip-with-friends at A level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000602',
    'This is a word question for travel/trip-with-friends at A level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000603',
    'This is a word question for travel/trip-with-friends at A level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000604',
    'This is a word question for travel/trip-with-friends at A level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000605',
    'This is a word question for travel/trip-with-friends at B level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000606',
    'This is a word question for travel/trip-with-friends at B level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000607',
    'This is a word question for travel/trip-with-friends at B level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000608',
    'This is a word question for travel/trip-with-friends at B level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000609',
    'This is a word question for travel/trip-with-friends at B level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000610',
    'This is a word question for travel/trip-with-friends at B level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000611',
    'This is a word question for travel/trip-with-friends at B level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000612',
    'This is a word question for travel/trip-with-friends at B level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000613',
    'This is a word question for travel/trip-with-friends at B level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000614',
    'This is a word question for travel/trip-with-friends at B level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000615',
    'This is a word question for travel/trip-with-friends at C level. (0)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000616',
    'This is a word question for travel/trip-with-friends at C level. (1)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000617',
    'This is a word question for travel/trip-with-friends at C level. (2)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000618',
    'This is a word question for travel/trip-with-friends at C level. (3)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000619',
    'This is a word question for travel/trip-with-friends at C level. (4)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000620',
    'This is a word question for travel/trip-with-friends at C level. (5)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000621',
    'This is a word question for travel/trip-with-friends at C level. (6)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000622',
    'This is a word question for travel/trip-with-friends at C level. (7)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000623',
    'This is a word question for travel/trip-with-friends at C level. (8)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'Q000624',
    'This is a word question for travel/trip-with-friends at C level. (9)',
    'Option A',
    'Option B',
    'Option C',
    'A',
    'travel',
    'trip-with-friends',
    'word',
    'This is a fallback explanation.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- Show insertion summary
SELECT 
    major_category,
    minor_category,
    question_type,
    difficulty_level,
    COUNT(*) as question_count
FROM question 
GROUP BY major_category, minor_category, question_type, difficulty_level
ORDER BY major_category, minor_category, question_type, difficulty_level;
