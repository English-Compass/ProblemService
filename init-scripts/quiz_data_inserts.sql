-- =============================================
-- Quiz Data Insert Statements
-- Generated from 108 JSON files
-- Total questions: 696
-- =============================================

-- 문자셋 설정 (한글 데이터 삽입을 위해 필수)
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- IF NOT EXISTS 구문으로 중복 삽입 방지
-- MySQL에서는 INSERT IGNORE를 사용

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-sentence-C-1',
    'We will do our *utmost* to resolve this issue.',
    'best',
    'part',
    'bit',
    'A',
    '비즈니스',
    '고객 서비스',
    'sentence',
    '''Utmost''는 최선을 다하겠다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-sentence-C-2',
    'We need to *compensate* the customer for the error.',
    'pay back',
    'apologize to',
    'thank',
    'A',
    '비즈니스',
    '고객 서비스',
    'sentence',
    '''Compensate''는 보상한다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-sentence-B-1',
    'We will *look into* this matter right away.',
    'investigate',
    'ignore',
    'delay',
    'A',
    '비즈니스',
    '고객 서비스',
    'sentence',
    '''Look into''는 조사하겠다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-sentence-B-2',
    'I''m afraid that''s *against our policy*.',
    'not allowed by our rules',
    'a good idea',
    'possible',
    'A',
    '비즈니스',
    '고객 서비스',
    'sentence',
    '''Against our policy''는 규정에 어긋난다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-sentence-A-1',
    'I''ll *put you through* to the manager.',
    'connect you with',
    'go with you to',
    'call for you',
    'A',
    '비즈니스',
    '고객 서비스',
    'sentence',
    '''Put you through''는 전화를 연결해 주겠다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-sentence-A-2',
    'Is there *anything else* I can help you with?',
    'do you need more help',
    'is that all',
    'can I go now',
    'A',
    '비즈니스',
    '고객 서비스',
    'sentence',
    '''Anything else''는 추가적인 도움이 필요한지 묻는 표현입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-word-C-1',
    'We are committed to ____ our customers'' expectations.',
    'exceeding',
    'meeting',
    'matching',
    'A',
    '비즈니스',
    '고객 서비스',
    'word',
    '''Exceeding''은 고객의 기대를 뛰어넘는 서비스를 제공하겠다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-word-C-2',
    'Thank you for your ____.',
    'patience',
    'time',
    'effort',
    'A',
    '비즈니스',
    '고객 서비스',
    'word',
    '고객의 인내심에 감사할 때 ''patience''를 사용합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-word-B-1',
    'We will ____ the issue as soon as possible.',
    'investigate',
    'ignore',
    'forget',
    'A',
    '비즈니스',
    '고객 서비스',
    'word',
    '''Investigate''는 문제를 조사하겠다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-word-B-2',
    'We offer a full ____ if you are not satisfied.',
    'refund',
    'discount',
    'exchange',
    'A',
    '비즈니스',
    '고객 서비스',
    'word',
    '''Refund''는 환불을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-word-A-1',
    'How can I ____ you today?',
    'help',
    'do',
    'make',
    'A',
    '비즈니스',
    '고객 서비스',
    'word',
    '고객에게 무엇을 도와드릴지 물을 때 ''help''를 사용합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-word-A-2',
    'I''m sorry for the ____.',
    'inconvenience',
    'problem',
    'issue',
    'A',
    '비즈니스',
    '고객 서비스',
    'word',
    '고객에게 불편을 드린 점에 대해 사과할 때 정중한 표현인 ''inconvenience''를 사용합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-conversation-A-1',
    'Customer: ''I have a problem with my order.''',
    'I''m sorry to hear that. Let me help you with your order right away.',
    'That''s not my problem to solve.',
    'All orders are final and cannot be changed.',
    'A',
    '비즈니스',
    '고객 서비스',
    'conversation',
    '고객의 문제에 공감하고 즉시 도움을 제공하는 것이 좋은 고객 서비스입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-conversation-A-2',
    'Customer: ''Can you give me a discount on this item?''',
    'Let me check what discounts are available for you.',
    'We don''t offer any discounts here.',
    'Why do you think you deserve a discount?',
    'A',
    '비즈니스',
    '고객 서비스',
    'conversation',
    '고객의 할인 요청에 대해 적극적으로 확인해보겠다는 자세가 중요합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-conversation-C-1',
    'Corporate client: ''We''re considering terminating our partnership due to recent service disruptions.''',
    'I completely understand your concerns. Let me schedule an urgent meeting with our senior team to address these issues comprehensively.',
    'Contract termination requires 30 days written notice as per our agreement.',
    'Service disruptions are temporary and will resolve themselves soon.',
    'A',
    '비즈니스',
    '고객 서비스',
    'conversation',
    '기업 고객의 계약 해지 고려에 대해 우려를 완전히 이해한다는 표현과 함께 고위 팀과의 긴급 미팅을 제안하는 것이 적절합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-conversation-C-2',
    'Executive: ''I want to discuss implementing a strategic partnership program with your organization.''',
    'Absolutely. Let me connect you with our partnership development director who specializes in strategic alliances.',
    'The manager is currently unavailable for such discussions.',
    'I can handle all partnership discussions myself without involving others.',
    'A',
    '비즈니스',
    '고객 서비스',
    'conversation',
    '전략적 파트너십과 같은 고급 비즈니스 문의는 해당 전문가에게 연결해주는 것이 가장 적절합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-conversation-B-1',
    'Customer: ''I''ve been waiting for 30 minutes and nobody has helped me yet.''',
    'I sincerely apologize for the wait. Let me personally assist you right now.',
    'Everyone is really busy today, so please be patient.',
    'You should have made an appointment if you wanted faster service.',
    'A',
    '비즈니스',
    '고객 서비스',
    'conversation',
    '장시간 대기에 대해 진심으로 사과하고 즉시 개인적인 도움을 제공하는 것이 적절한 대응입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-customer-service-conversation-B-2',
    'Customer: ''Your competitor offers the same service for half the price.''',
    'I understand price is important. Let me explain the additional value we provide.',
    'Then you should go to our competitor instead.',
    'Our prices are set and cannot be negotiated.',
    'A',
    '비즈니스',
    '고객 서비스',
    'conversation',
    '가격에 대한 고객의 우려를 이해하고 회사가 제공하는 부가가치를 설명하는 것이 좋습니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-A-1',
    'Let''s *go over* the main points.',
    'review',
    'skip',
    'discuss',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Go over''는 검토하자는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-A-2',
    'Can you *take notes* during the meeting?',
    'write down what is said',
    'speak in the meeting',
    'leave the meeting',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Take notes''는 회의 내용을 필기하라는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-A-3',
    'Please *speak up* if you have questions.',
    'talk louder',
    'be quiet',
    'leave',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Speak up''은 더 크게 말하라는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-A-4',
    'Let''s *move on* to the next topic.',
    'continue to',
    'return to',
    'stop at',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Move on''은 다음으로 넘어가자는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-A-5',
    'Can you *fill me in* on the details?',
    'tell me about',
    'leave me out',
    'forget about',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Fill me in''은 정보를 알려달라는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-A-6',
    'We need to *work out* the problems.',
    'solve',
    'create',
    'ignore',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Work out''은 문제를 해결한다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-A-7',
    'Please *hold on* for a moment.',
    'wait',
    'continue',
    'leave',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Hold on''은 잠시 기다리라는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-A-8',
    'Let''s *wrap up* the meeting.',
    'finish',
    'start',
    'continue',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Wrap up''은 마무리하자는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-A-9',
    'Can you *bring up* that issue?',
    'mention',
    'forget',
    'hide',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Bring up''은 이슈를 언급하라는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-A-10',
    'We should *look into* this matter.',
    'investigate',
    'ignore',
    'forget',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Look into''는 조사하자는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-C-1',
    'Let''s *table this discussion* for now.',
    'postpone the discussion',
    'end the discussion',
    'start the discussion',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Table the discussion''은 논의를 보류하자는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-C-2',
    'We need to *think outside the box* for a solution.',
    'think creatively',
    'think carefully',
    'think logically',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Think outside the box''는 창의적으로 생각하자는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-C-3',
    'This initiative will *break new ground*.',
    'pioneer something innovative',
    'repeat old methods',
    'abandon the project',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Break new ground''는 새로운 분야를 개척한다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-C-4',
    'We must *leverage our core competencies*.',
    'utilize our main strengths',
    'ignore our abilities',
    'hide our skills',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Leverage core competencies''는 핵심 역량을 활용한다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-C-5',
    'Let''s *drill down* into the metrics.',
    'examine in great detail',
    'ignore completely',
    'summarize briefly',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Drill down''은 세부적으로 검토한다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-C-6',
    'We need to *synergize our efforts* across departments.',
    'coordinate collaboratively',
    'work independently',
    'compete internally',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Synergize efforts''는 협력적으로 조정한다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-C-7',
    'This strategy will *differentiate us* in the market.',
    'make us unique',
    'make us similar',
    'make us invisible',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Differentiate''는 차별화한다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-C-8',
    'Let''s *operationalize* these concepts.',
    'implement practically',
    'theorize abstractly',
    'ignore completely',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Operationalize''는 실제로 구현한다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-C-9',
    'We should *benchmark* against industry leaders.',
    'compare with',
    'ignore',
    'compete against',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Benchmark''는 업계 리더와 비교한다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-C-10',
    'This will *streamline* our processes.',
    'make more efficient',
    'make more complex',
    'eliminate completely',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Streamline''은 프로세스를 효율화한다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-B-1',
    'We are running out of time, so let''s *wrap up*.',
    'finish',
    'start',
    'delay',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Wrap up''은 마무리하자는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-B-2',
    'I''ll *get back to you* on that.',
    'respond to you later',
    'forget about it',
    'agree with you',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Get back to you''는 나중에 답변하겠다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-B-3',
    'Let''s *touch base* next week.',
    'check in with each other',
    'avoid each other',
    'compete',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Touch base''는 서로 연락하자는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-B-4',
    'We need to *iron out* the details.',
    'resolve',
    'complicate',
    'ignore',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Iron out''은 세부사항을 해결한다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-B-5',
    'Please *keep me posted* on the progress.',
    'inform me regularly',
    'leave me alone',
    'hide from me',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Keep me posted''는 정기적으로 알려달라는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-B-6',
    'Let''s *put this on hold* for now.',
    'postpone',
    'accelerate',
    'complete',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Put on hold''는 보류하자는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-B-7',
    'We should *think it through* carefully.',
    'consider thoroughly',
    'decide quickly',
    'ignore completely',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Think it through''는 신중히 고려하자는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-B-8',
    'Can you *break down* the costs?',
    'analyze in detail',
    'combine together',
    'hide completely',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Break down''은 자세히 분석하라는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-B-9',
    'Let''s *nail down* the specifics.',
    'finalize',
    'avoid',
    'postpone',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Nail down''은 구체적으로 확정하자는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-sentence-B-10',
    'We need to *step up* our efforts.',
    'increase',
    'decrease',
    'stop',
    'A',
    '비즈니스',
    '회의',
    'sentence',
    '''Step up''은 노력을 증가시키자는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-B-1',
    'We need to ____ on the key decisions.',
    'follow up',
    'fall behind',
    'drop out',
    'A',
    '비즈니스',
    '회의',
    'word',
    '''Follow up''은 후속 조치를 취한다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-B-2',
    'Let''s try to ____ the deadline.',
    'meet',
    'see',
    'go',
    'A',
    '비즈니스',
    '회의',
    'word',
    '마감일을 맞추다는 의미로 ''meet the deadline''을 사용합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-B-3',
    'The project requires careful ____.',
    'planning',
    'cooking',
    'sleeping',
    'A',
    '비즈니스',
    '회의',
    'word',
    '프로젝트에는 신중한 계획이 필요합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-B-4',
    'We should ____ the budget first.',
    'review',
    'ignore',
    'forget',
    'A',
    '비즈니스',
    '회의',
    'word',
    '예산을 검토해야 할 때 ''review''를 사용합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-B-5',
    'The team needs to ____ effectively.',
    'collaborate',
    'compete',
    'complain',
    'A',
    '비즈니스',
    '회의',
    'word',
    '효과적인 협력을 위해 ''collaborate''를 사용합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-B-6',
    'Let''s ____ the presentation format.',
    'standardize',
    'randomize',
    'memorize',
    'A',
    '비즈니스',
    '회의',
    'word',
    '발표 형식을 표준화할 때 ''standardize''를 사용합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-B-7',
    'We must ____ our objectives clearly.',
    'define',
    'ignore',
    'forget',
    'A',
    '비즈니스',
    '회의',
    'word',
    '목표를 명확히 정의할 때 ''define''를 사용합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-B-8',
    'The manager will ____ the final decision.',
    'authorize',
    'prevent',
    'delay',
    'A',
    '비즈니스',
    '회의',
    'word',
    '최종 결정을 승인할 때 ''authorize''를 사용합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-B-9',
    'Please ____ the meeting minutes.',
    'distribute',
    'hide',
    'destroy',
    'A',
    '비즈니스',
    '회의',
    'word',
    '회의록을 배포할 때 ''distribute''를 사용합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-B-10',
    'We need to ____ our strategy.',
    'adjust',
    'abandon',
    'ignore',
    'A',
    '비즈니스',
    '회의',
    'word',
    '전략을 조정할 때 ''adjust''를 사용합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-C-1',
    'The purpose of this meeting is to ____ a consensus.',
    'reach',
    'make',
    'find',
    'A',
    '비즈니스',
    '회의',
    'word',
    '''Reach a consensus''는 합의에 도달한다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-C-2',
    'We need to consider the long-term ____ of this decision.',
    'implications',
    'applications',
    'complications',
    'A',
    '비즈니스',
    '회의',
    'word',
    '''Implications''는 결정이 가져올 장기적인 영향을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-C-3',
    'The proposal requires ____ analysis.',
    'comprehensive',
    'simple',
    'quick',
    'A',
    '비즈니스',
    '회의',
    'word',
    '제안서에는 포괄적인 분석이 필요합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-C-4',
    'We must ____ all stakeholders in this process.',
    'engage',
    'exclude',
    'ignore',
    'A',
    '비즈니스',
    '회의',
    'word',
    '모든 이해관계자를 참여시킬 때 ''engage''를 사용합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-C-5',
    'The initiative aims to ____ operational efficiency.',
    'optimize',
    'minimize',
    'eliminate',
    'A',
    '비즈니스',
    '회의',
    'word',
    '운영 효율성을 최적화할 때 ''optimize''를 사용합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-C-6',
    'Let''s ____ the strategic objectives.',
    'articulate',
    'obscure',
    'confuse',
    'A',
    '비즈니스',
    '회의',
    'word',
    '전략적 목표를 명확히 표현할 때 ''articulate''를 사용합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-C-7',
    'The framework will ____ sustainable growth.',
    'facilitate',
    'hinder',
    'prevent',
    'A',
    '비즈니스',
    '회의',
    'word',
    '지속 가능한 성장을 촉진할 때 ''facilitate''를 사용합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-C-8',
    'We need to ____ market dynamics carefully.',
    'evaluate',
    'ignore',
    'guess',
    'A',
    '비즈니스',
    '회의',
    'word',
    '시장 역학을 신중히 평가할 때 ''evaluate''를 사용합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-C-9',
    'The methodology should be ____.',
    'rigorous',
    'casual',
    'random',
    'A',
    '비즈니스',
    '회의',
    'word',
    '방법론은 엄밀해야 합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-C-10',
    'Let''s ____ the competitive landscape.',
    'assess',
    'ignore',
    'avoid',
    'A',
    '비즈니스',
    '회의',
    'word',
    '경쟁 환경을 평가할 때 ''assess''를 사용합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-A-1',
    'Can we ____ a time for the meeting?',
    'set',
    'put',
    'do',
    'A',
    '비즈니스',
    '회의',
    'word',
    '시간을 정할 때 ''set a time''이라는 표현을 사용합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-A-2',
    'Please send me the ____ before the meeting.',
    'agenda',
    'menu',
    'map',
    'A',
    '비즈니스',
    '회의',
    'word',
    '회의 전에 논의할 주제 목록인 ''agenda''를 요청하는 것이 자연스럽습니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-A-3',
    'The meeting will ____ at 2 PM.',
    'start',
    'stop',
    'pause',
    'A',
    '비즈니스',
    '회의',
    'word',
    '회의가 시작될 때 ''start''를 사용합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-A-4',
    'Please ____ the presentation.',
    'prepare',
    'eat',
    'buy',
    'A',
    '비즈니스',
    '회의',
    'word',
    '발표를 준비할 때 ''prepare''를 사용합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-A-5',
    'We need to ____ the schedule.',
    'check',
    'cook',
    'clean',
    'A',
    '비즈니스',
    '회의',
    'word',
    '일정을 확인할 때 ''check''를 사용합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-A-6',
    'Let''s ____ the main points.',
    'discuss',
    'dance',
    'drive',
    'A',
    '비즈니스',
    '회의',
    'word',
    '요점을 논의할 때 ''discuss''를 사용합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-A-7',
    'The ____ is very important.',
    'meeting',
    'movie',
    'music',
    'A',
    '비즈니스',
    '회의',
    'word',
    '회의가 중요할 때 ''meeting''을 사용합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-A-8',
    'Please ____ on time.',
    'arrive',
    'sleep',
    'eat',
    'A',
    '비즈니스',
    '회의',
    'word',
    '시간에 맞춰 도착할 때 ''arrive''를 사용합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-A-9',
    'We will ____ the decision tomorrow.',
    'make',
    'take',
    'give',
    'A',
    '비즈니스',
    '회의',
    'word',
    '결정을 내릴 때 ''make a decision''을 사용합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-word-A-10',
    'The ____ room is ready.',
    'conference',
    'kitchen',
    'bedroom',
    'A',
    '비즈니스',
    '회의',
    'word',
    '회의실을 말할 때 ''conference room''을 사용합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-conversation-B-1',
    'Team member: ''I disagree with the proposed timeline. It seems too aggressive for our resources.''',
    'That''s a valid concern. Let''s break down the timeline and discuss which phases might need more realistic timeframes.',
    'We need to stick to the timeline regardless of concerns.',
    'Disagreements like this just slow down our progress.',
    'A',
    '비즈니스',
    '회의',
    'conversation',
    '다른 의견을 타당한 우려로 인정하고 구체적인 해결 방안을 제시하여 건설적인 토론을 이끄는 것이 좋습니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-conversation-B-2',
    'Client: ''We need to reschedule next week''s conference call due to an unexpected emergency.''',
    'I understand completely. Let me coordinate with all participants to find an alternative time that works for everyone.',
    'This kind of last-minute change is really inconvenient for us.',
    'Emergency rescheduling seems to happen too frequently.',
    'A',
    '비즈니스',
    '회의',
    'conversation',
    '긴급상황으로 인한 일정 변경에 이해를 표하고 모든 참가자를 위한 대안을 찾겠다는 적극적인 자세가 전문적입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-conversation-C-1',
    'Board member: ''How do we address the strategic misalignment between our European and Asian operations discussed in today''s session?''',
    'I recommend establishing a cross-regional task force with senior representatives from both operations to identify synergies and develop a unified strategic framework within the next quarter.',
    'That''s a very complex issue that will take time to resolve.',
    'The regional offices should work together to figure it out themselves.',
    'A',
    '비즈니스',
    '회의',
    'conversation',
    '전략적 불일치 문제에 대해 구체적이고 실행 가능한 해결책을 제시하고 명확한 타임라인을 포함하는 것이 임원급 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-conversation-C-2',
    'Stakeholder: ''Given current market volatility, shouldn''t we postpone the digital transformation initiative we discussed?''',
    'While market volatility presents challenges, digital transformation will actually strengthen our resilience. I suggest we proceed with a phased approach to manage risks while capturing competitive advantages.',
    'Market volatility definitely affects all our business initiatives.',
    'We should probably wait for more stable economic conditions.',
    'A',
    '비즈니스',
    '회의',
    'conversation',
    '시장 불안정성을 인정하면서도 디지털 전환의 전략적 가치를 강조하고 위험 관리와 경쟁 우위 확보를 동시에 고려한 단계적 접근법을 제시하는 것이 전략적 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-conversation-A-1',
    'Colleague: ''What time does today''s team meeting start?''',
    'The meeting starts at 2 PM in conference room B.',
    'You should check the calendar yourself.',
    'I''m not sure about the exact time.',
    'A',
    '비즈니스',
    '회의',
    'conversation',
    '회의 시간과 장소를 명확하게 알려주는 것이 도움이 됩니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-meeting-conference-conversation-A-2',
    'Manager: ''Could you take notes during today''s client presentation?''',
    'Of course. I''ll take detailed notes and share them with the team afterwards.',
    'I don''t really like taking notes during meetings.',
    'Someone else should be responsible for that.',
    'A',
    '비즈니스',
    '회의',
    'conversation',
    '회의 기록 요청에 적극적으로 응답하고 팀 공유까지 언급하는 것이 좋습니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-sentence-C-1',
    'This is a *gentle reminder* about the deadline.',
    'polite way to remind you',
    'strict warning',
    'final notice',
    'A',
    '비즈니스',
    '이메일 보고서',
    'sentence',
    '''Gentle reminder''는 정중하게 마감일을 상기시키는 표현입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-sentence-C-2',
    'The data is *preliminary* and subject to change.',
    'not final',
    'accurate',
    'confidential',
    'A',
    '비즈니스',
    '이메일 보고서',
    'sentence',
    '''Preliminary''는 데이터가 아직 확정되지 않았다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-sentence-B-1',
    'For *your reference*, I have attached the previous report.',
    'to help you understand',
    'for you to read',
    'because you asked',
    'A',
    '비즈니스',
    '이메일 보고서',
    'sentence',
    '''For your reference''는 참고용으로 제공한다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-sentence-B-2',
    'Please do not *hesitate* to contact me.',
    'feel free to',
    'be afraid to',
    'forget to',
    'A',
    '비즈니스',
    '이메일 보고서',
    'sentence',
    '''Do not hesitate to''는 언제든지 편하게 연락하라는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-sentence-A-1',
    'I look forward to *hearing from you* soon.',
    'receiving your reply',
    'meeting you',
    'calling you',
    'A',
    '비즈니스',
    '이메일 보고서',
    'sentence',
    '''Hearing from you''는 답장을 기다린다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-sentence-A-2',
    'Best *regards*,',
    'sincerely',
    'thank you',
    'goodbye',
    'A',
    '비즈니스',
    '이메일 보고서',
    'sentence',
    '''Regards''는 이메일 끝에 붙이는 격식 있는 인사말입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-word-A-1',
    'Please find the ____ document.',
    'attached',
    'included',
    'added',
    'A',
    '비즈니스',
    '이메일 보고서',
    'word',
    '이메일에 파일을 첨부했을 때 ''attached''라는 단어를 사용합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-word-A-2',
    'I am writing to ____ about the project.',
    'inquire',
    'ask',
    'tell',
    'A',
    '비즈니스',
    '이메일 보고서',
    'word',
    '''Inquire''는 공식적인 문의를 할 때 사용하는 격식 있는 표현입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-word-B-1',
    'Could you please provide me with an ____?',
    'update',
    'information',
    'news',
    'A',
    '비즈니스',
    '이메일 보고서',
    'word',
    '''Update''는 최신 정보를 요청할 때 사용합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-word-B-2',
    'Please ____ that you have received this email.',
    'confirm',
    'say',
    'check',
    'A',
    '비즈니스',
    '이메일 보고서',
    'word',
    '''Confirm''은 수신 확인을 요청할 때 사용합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-word-C-1',
    'The report ____ the key findings of our research.',
    'summarizes',
    'tells',
    'gives',
    'A',
    '비즈니스',
    '이메일 보고서',
    'word',
    '''Summarizes''는 보고서가 연구의 핵심 결과를 요약한다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-word-C-2',
    'We need to ____ the data before making a decision.',
    'analyze',
    'see',
    'look',
    'A',
    '비즈니스',
    '이메일 보고서',
    'word',
    '''Analyze''는 데이터를 분석한다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-conversation-A-1',
    'Colleague: ''Did you send the weekly report to the manager yet?''',
    'Yes, I sent it this morning. You should find it in your inbox.',
    'I completely forgot about it.',
    'I thought reports were due next week.',
    'A',
    '비즈니스',
    '이메일 보고서',
    'conversation',
    '보고서 발송 여부를 명확히 확인해주고 위치를 알려주는 것이 좋습니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-conversation-A-2',
    'Manager: ''Can you include the latest sales figures in tomorrow''s report?''',
    'Absolutely. I''ll include the most recent sales data in the next section.',
    'I don''t have access to sales information.',
    'Sales figures are confidential and can''t be shared.',
    'A',
    '비즈니스',
    '이메일 보고서',
    'conversation',
    '상사의 요청에 적극적으로 응답하고 구체적인 실행 계획을 제시하는 것이 좋습니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-conversation-B-1',
    'Client: ''The data in your quarterly report doesn''t match our internal records.''',
    'Thank you for pointing that out. Let me review the discrepancy and provide you with a corrected version by end of day.',
    'Our data is always accurate, so your records must be wrong.',
    'You must be misreading the information in the report.',
    'A',
    '비즈니스',
    '이메일 보고서',
    'conversation',
    '데이터 불일치 지적에 감사를 표하고 검토 후 수정된 버전을 제공하겠다는 구체적인 해결책을 제시합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-conversation-B-2',
    'Team member: ''I urgently need the financial analysis for tomorrow''s board presentation.''',
    'I''ll prioritize the financial analysis and have it ready first thing tomorrow morning.',
    'That''s very short notice for such an important request.',
    'You should ask someone else who''s less busy.',
    'A',
    '비즈니스',
    '이메일 보고서',
    'conversation',
    '급한 요청에 대해 우선순위를 두고 구체적인 완성 시간을 약속하는 것이 전문적인 대응입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-conversation-C-1',
    'CEO: ''Your performance analysis shows significant deviation from projected targets. Can you elaborate on the underlying factors?''',
    'Certainly. The deviation stems from three primary factors: market volatility, seasonal adjustments, and our product launch impact. I can provide detailed breakdowns for each.',
    'The numbers in the report speak for themselves.',
    'It''s just normal quarterly fluctuation, nothing to worry about.',
    'A',
    '비즈니스',
    '이메일 보고서',
    'conversation',
    'CEO의 질문에 대해 구체적인 요인들을 체계적으로 나열하고 상세 분석을 제공하겠다는 전문적인 답변이 적절합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'business-email-report-conversation-C-2',
    'Board member: ''How do you validate the predictive models used in your strategic forecast reports?''',
    'We employ cross-validation techniques, backtesting against historical data, and peer review processes to ensure model accuracy and statistical reliability.',
    'We use standard industry practices for all our modeling work.',
    'Our IT department handles all the technical validation aspects.',
    'A',
    '비즈니스',
    '이메일 보고서',
    'conversation',
    '예측 모델 검증에 대한 기술적 질문에는 구체적인 검증 방법론들을 전문적으로 설명하는 것이 적절합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-C-1',
    'The service is temporarily *suspended*.',
    'extended',
    'improved',
    'stopped',
    'C',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Suspended''는 중단된을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-C-2',
    'I need to check the *timetable*.',
    'price',
    'route',
    'schedule',
    'C',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Timetable''은 시간표를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-C-3',
    'This route is *accessible* for wheelchairs.',
    'suitable',
    'expensive',
    'unsuitable',
    'A',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Accessible''는 접근 가능한을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-C-4',
    'The conductor will *inspect* tickets.',
    'sell',
    'collect',
    'check',
    'C',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Inspect''는 검사하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-C-5',
    'There''s a *disruption* on the line.',
    'celebration',
    'discount',
    'interruption',
    'C',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Disruption''은 운행 중단을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-C-6',
    'The service is temporarily *suspended*.',
    'extended',
    'improved',
    'stopped',
    'C',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Suspended''는 중단된을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-C-7',
    'I need to check the *timetable*.',
    'route',
    'price',
    'schedule',
    'C',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Timetable''은 시간표를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-C-8',
    'This route is *accessible* for wheelchairs.',
    'expensive',
    'unsuitable',
    'suitable',
    'C',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Accessible''는 접근 가능한을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-C-9',
    'The conductor will *inspect* tickets.',
    'sell',
    'check',
    'collect',
    'B',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Inspect''는 검사하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-C-10',
    'There''s a *disruption* on the line.',
    'discount',
    'interruption',
    'celebration',
    'B',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Disruption''은 운행 중단을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-B-1',
    'I missed my *connection*.',
    'destination',
    'wallet',
    'transfer',
    'C',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Connection''은 연결편을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-B-2',
    'The train is *delayed*.',
    'canceled',
    'early',
    'late',
    'C',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Delayed''는 지연된을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-B-3',
    'Do you have exact *change*?',
    'time',
    'tickets',
    'coins',
    'C',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Change''는 잔돈을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-B-4',
    'This is an *express* train.',
    'fast',
    'old',
    'slow',
    'A',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Express''는 급행의를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-B-5',
    'Please *validate* your ticket.',
    'buy',
    'throw away',
    'confirm',
    'C',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Validate''는 유효화하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-B-6',
    'I missed my *connection*.',
    'transfer',
    'wallet',
    'destination',
    'A',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Connection''은 연결편을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-B-7',
    'The train is *delayed*.',
    'late',
    'canceled',
    'early',
    'A',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Delayed''는 지연된을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-B-8',
    'Do you have exact *change*?',
    'coins',
    'tickets',
    'time',
    'A',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Change''는 잔돈을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-B-9',
    'This is an *express* train.',
    'fast',
    'slow',
    'old',
    'A',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Express''는 급행의를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-B-10',
    'Please *validate* your ticket.',
    'confirm',
    'buy',
    'throw away',
    'A',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Validate''는 유효화하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-A-1',
    'Where is the *bus stop*?',
    'bus station',
    'restaurant',
    'car park',
    'A',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Bus stop''은 버스 정류장을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-A-2',
    'How much is the *fare*?',
    'hotel rate',
    'ticket price',
    'food cost',
    'B',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Fare''는 요금을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-A-3',
    'What time does the train *arrive*?',
    'stop',
    'leave',
    'come',
    'C',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Arrive''는 도착하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-A-4',
    'I need to *transfer* trains.',
    'cancel',
    'buy',
    'change',
    'C',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Transfer''는 갈아타다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-A-5',
    'The bus is *crowded*.',
    'empty',
    'full of people',
    'broken',
    'B',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Crowded''는 붐비는을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-A-6',
    'Where is the *bus stop*?',
    'bus station',
    'restaurant',
    'car park',
    'A',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Bus stop''은 버스 정류장을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-A-7',
    'How much is the *fare*?',
    'ticket price',
    'hotel rate',
    'food cost',
    'A',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Fare''는 요금을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-A-8',
    'What time does the train *arrive*?',
    'stop',
    'come',
    'leave',
    'B',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Arrive''는 도착하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-A-9',
    'I need to *transfer* trains.',
    'change',
    'buy',
    'cancel',
    'A',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Transfer''는 갈아타다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-sentence-A-10',
    'The bus is *crowded*.',
    'empty',
    'full of people',
    'broken',
    'B',
    '일상생활',
    '대중교통 이용',
    'sentence',
    '''Crowded''는 붐비는을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-B-1',
    'Do you accept _____ cards?',
    'playing',
    'transit',
    'birthday',
    'B',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Transit cards''는 교통카드를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-B-2',
    'The _____ is under construction.',
    'library',
    'restaurant',
    'station',
    'C',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Station''은 역을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-B-3',
    'I need to check the train _____.',
    'menu',
    'schedule',
    'price',
    'B',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Schedule''은 시간표를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-B-4',
    'This is a _____ zone.',
    'restaurant',
    'no-parking',
    'shopping',
    'B',
    '일상생활',
    '대중교통 이용',
    'word',
    '''No-parking zone''은 주차금지구역을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-B-5',
    'The _____ announced a delay.',
    'conductor',
    'teacher',
    'chef',
    'A',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Conductor''는 차장을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-B-6',
    'Do you accept _____ cards?',
    'transit',
    'birthday',
    'playing',
    'A',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Transit cards''는 교통카드를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-B-7',
    'The _____ is under construction.',
    'station',
    'library',
    'restaurant',
    'A',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Station''은 역을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-B-8',
    'I need to check the train _____.',
    'menu',
    'price',
    'schedule',
    'C',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Schedule''은 시간표를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-B-9',
    'This is a _____ zone.',
    'shopping',
    'restaurant',
    'no-parking',
    'C',
    '일상생활',
    '대중교통 이용',
    'word',
    '''No-parking zone''은 주차금지구역을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-B-10',
    'The _____ announced a delay.',
    'teacher',
    'conductor',
    'chef',
    'B',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Conductor''는 차장을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-C-1',
    'Please have your _____ ready for inspection.',
    'homework',
    'lunch',
    'tickets',
    'C',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Tickets''는 표를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-C-2',
    'This service operates with reduced _____.',
    'noise',
    'cost',
    'frequency',
    'C',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Frequency''는 운행 빈도를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-C-3',
    'The _____ provides real-time updates.',
    'library',
    'app',
    'restaurant',
    'B',
    '일상생활',
    '대중교통 이용',
    'word',
    '''App''은 애플리케이션을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-C-4',
    'Senior citizens receive a _____.',
    'gift',
    'discount',
    'penalty',
    'B',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Discount''는 할인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-C-5',
    'The terminal has excellent _____.',
    'food',
    'connectivity',
    'weather',
    'B',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Connectivity''는 연결성을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-C-6',
    'Please have your _____ ready for inspection.',
    'lunch',
    'homework',
    'tickets',
    'C',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Tickets''는 표를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-C-7',
    'This service operates with reduced _____.',
    'noise',
    'frequency',
    'cost',
    'B',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Frequency''는 운행 빈도를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-C-8',
    'The _____ provides real-time updates.',
    'app',
    'library',
    'restaurant',
    'A',
    '일상생활',
    '대중교통 이용',
    'word',
    '''App''은 애플리케이션을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-C-9',
    'Senior citizens receive a _____.',
    'penalty',
    'gift',
    'discount',
    'C',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Discount''는 할인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-C-10',
    'The terminal has excellent _____.',
    'connectivity',
    'food',
    'weather',
    'A',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Connectivity''는 연결성을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-A-1',
    'The _____ is late.',
    'book',
    'bus',
    'food',
    'B',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Bus''는 버스를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-A-2',
    'Where can I buy a _____?',
    'sandwich',
    'shirt',
    'ticket',
    'C',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Ticket''은 표를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-A-3',
    'Which _____ goes downtown?',
    'hotel',
    'restaurant',
    'route',
    'C',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Route''는 노선을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-A-4',
    'The _____ is on platform 3.',
    'train',
    'restaurant',
    'store',
    'A',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Train''은 기차를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-A-5',
    'I need to get off at the next _____.',
    'restaurant',
    'mall',
    'stop',
    'C',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Stop''은 정류장을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-A-6',
    'The _____ is late.',
    'bus',
    'food',
    'book',
    'A',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Bus''는 버스를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-A-7',
    'Where can I buy a _____?',
    'sandwich',
    'ticket',
    'shirt',
    'B',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Ticket''은 표를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-A-8',
    'Which _____ goes downtown?',
    'hotel',
    'route',
    'restaurant',
    'B',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Route''는 노선을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-A-9',
    'The _____ is on platform 3.',
    'store',
    'restaurant',
    'train',
    'C',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Train''은 기차를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-word-A-10',
    'I need to get off at the next _____.',
    'mall',
    'stop',
    'restaurant',
    'B',
    '일상생활',
    '대중교통 이용',
    'word',
    '''Stop''은 정류장을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-conversation-A-1',
    'Bus driver: ''Exact change only, please.''',
    'Here''s the exact fare. Thank you for letting me know.',
    'I only have a twenty-dollar bill with me.',
    'Can''t you just break this large bill for me?',
    'A',
    '일상생활',
    '대중교통 이용',
    'conversation',
    '대중교통에서 정확한 요금을 준비하여 지불하고 안내에 감사하는 것이 매너입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-conversation-A-2',
    'Station attendant: ''The next train is delayed by approximately 10 minutes.''',
    'Thank you for the update. I appreciate you keeping passengers informed.',
    'This delay happens way too often on this line.',
    'Why can''t the trains ever run on time here?',
    'A',
    '일상생활',
    '대중교통 이용',
    'conversation',
    '지연 안내에 대해 감사 인사를 하고 정보 제공에 대한 감사를 표현하는 것이 정중한 대응입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-conversation-B-1',
    'Fellow passenger: ''Excuse me, is this seat taken by anyone?''',
    'No, please feel free to sit down. Let me move my bag out of the way.',
    'I''m not really sure if someone was sitting there.',
    'There are plenty of other empty seats available.',
    'A',
    '일상생활',
    '대중교통 이용',
    'conversation',
    '다른 승객의 자리 문의에 친절하게 응답하고 가방을 옮겨주는 배려를 보이는 것이 좋습니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-conversation-B-2',
    'Transit officer: ''I need to see your ticket or transit pass for validation.''',
    'Of course, here''s my monthly pass. Is there anything else you need to verify?',
    'I thought this section of the train was free.',
    'I must have left my ticket at home today.',
    'A',
    '일상생활',
    '대중교통 이용',
    'conversation',
    '교통 검표원의 요청에 협조적으로 응답하고 추가 확인사항이 있는지 문의하는 것이 적절합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-conversation-C-1',
    'Transportation supervisor: ''We''re implementing a new smart transit system next month. Passengers will need to update their payment methods and learn the new interface.''',
    'I appreciate the advance notice. Could you provide information about training sessions or user guides for the new system? I''d also like to know about support for passengers who might need assistance.',
    'Change is always difficult for regular commuters.',
    'The current system works fine, so why change it?',
    'A',
    '일상생활',
    '대중교통 이용',
    'conversation',
    '새로운 교통 시스템 도입에 대해 사전 공지에 감사하고 교육 자료와 취약계층 지원에 대해 건설적으로 문의하는 것이 시민 의식 있는 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-public-transportation-conversation-C-2',
    'City planner: ''We''re conducting a comprehensive study on commuter patterns to optimize route efficiency. Your input would be valuable for our urban mobility planning.''',
    'I''d be happy to contribute to improving our transportation system. Could you provide details about the study scope and how the data will be used to enhance commuter experiences citywide?',
    'Surveys and studies take too much time to complete.',
    'I don''t really have strong opinions about transportation.',
    'A',
    '일상생활',
    '대중교통 이용',
    'conversation',
    '도시 교통 계획자의 연구 참여 요청에 대해 시민으로서의 책임감을 보이며 연구 범위와 데이터 활용 방안에 대해 구체적으로 문의하는 것이 시민 의식 있는 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-B-1',
    'I''m experiencing *symptoms* of flu.',
    'costs',
    'treatments',
    'signs',
    'C',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Symptoms''는 증상을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-B-2',
    'The nurse will take your *vital signs*.',
    'insurance',
    'health measurements',
    'money',
    'B',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Vital signs''는 활력징후를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-B-3',
    'I need a *prescription* for this medication.',
    'appointment',
    'doctor''s order',
    'receipt',
    'B',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Prescription''은 처방전을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-B-4',
    'The test results are *normal*.',
    'expensive',
    'delayed',
    'typical',
    'C',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Normal''은 정상적인을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-B-5',
    'I have *insurance* coverage.',
    'medical protection',
    'car protection',
    'no money',
    'A',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Insurance''는 보험을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-B-6',
    'I''m experiencing *symptoms* of flu.',
    'signs',
    'treatments',
    'costs',
    'A',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Symptoms''는 증상을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-B-7',
    'The nurse will take your *vital signs*.',
    'money',
    'insurance',
    'health measurements',
    'C',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Vital signs''는 활력징후를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-B-8',
    'I need a *prescription* for this medication.',
    'doctor''s order',
    'appointment',
    'receipt',
    'A',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Prescription''은 처방전을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-B-9',
    'The test results are *normal*.',
    'typical',
    'delayed',
    'expensive',
    'A',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Normal''은 정상적인을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-B-10',
    'I have *insurance* coverage.',
    'car protection',
    'no money',
    'medical protection',
    'C',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Insurance''는 보험을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-C-1',
    'The diagnosis was *comprehensive*.',
    'quick',
    'thorough',
    'expensive',
    'B',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Comprehensive''는 포괄적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-C-2',
    'I need to *consult* with a specialist.',
    'avoid',
    'seek advice from',
    'pay',
    'B',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Consult''는 상담하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-C-3',
    'The medication has *side effects*.',
    'benefits',
    'no cost',
    'adverse reactions',
    'C',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Side effects''는 부작용을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-C-4',
    'I require *immediate* attention.',
    'urgent',
    'optional',
    'expensive',
    'A',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Immediate''는 즉각적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-C-5',
    'The treatment is *effective*.',
    'free',
    'successful',
    'painful',
    'B',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Effective''는 효과적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-C-6',
    'The diagnosis was *comprehensive*.',
    'quick',
    'thorough',
    'expensive',
    'B',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Comprehensive''는 포괄적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-C-7',
    'I need to *consult* with a specialist.',
    'avoid',
    'seek advice from',
    'pay',
    'B',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Consult''는 상담하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-C-8',
    'The medication has *side effects*.',
    'no cost',
    'adverse reactions',
    'benefits',
    'B',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Side effects''는 부작용을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-C-9',
    'I require *immediate* attention.',
    'optional',
    'expensive',
    'urgent',
    'C',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Immediate''는 즉각적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-C-10',
    'The treatment is *effective*.',
    'free',
    'painful',
    'successful',
    'C',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Effective''는 효과적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-A-1',
    'I need to *see* a doctor.',
    'avoid',
    'visit',
    'call',
    'B',
    '일상생활',
    '병원 이용',
    'sentence',
    '''See''는 의사를 만나다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-A-2',
    'I have a *headache*.',
    'broken arm',
    'pain in head',
    'cold',
    'B',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Headache''는 두통을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-A-3',
    'Where is the *emergency* room?',
    'parking',
    'urgent care',
    'gift shop',
    'B',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Emergency''는 응급상황을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-A-4',
    'I need to make an *appointment*.',
    'scheduled visit',
    'complaint',
    'payment',
    'A',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Appointment''는 예약을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-A-5',
    'The doctor will *examine* you.',
    'ignore',
    'check',
    'charge',
    'B',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Examine''은 진찰하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-A-6',
    'I need to *see* a doctor.',
    'call',
    'avoid',
    'visit',
    'C',
    '일상생활',
    '병원 이용',
    'sentence',
    '''See''는 의사를 만나다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-A-7',
    'I have a *headache*.',
    'cold',
    'pain in head',
    'broken arm',
    'B',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Headache''는 두통을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-A-8',
    'Where is the *emergency* room?',
    'urgent care',
    'gift shop',
    'parking',
    'A',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Emergency''는 응급상황을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-A-9',
    'I need to make an *appointment*.',
    'scheduled visit',
    'payment',
    'complaint',
    'A',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Appointment''는 예약을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-sentence-A-10',
    'The doctor will *examine* you.',
    'check',
    'charge',
    'ignore',
    'A',
    '일상생활',
    '병원 이용',
    'sentence',
    '''Examine''은 진찰하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-A-1',
    'I feel _____.',
    'happy',
    'sick',
    'rich',
    'B',
    '일상생활',
    '병원 이용',
    'word',
    '''Sick''은 아픈을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-A-2',
    'Where is the _____?',
    'pharmacy',
    'bank',
    'restaurant',
    'A',
    '일상생활',
    '병원 이용',
    'word',
    '''Pharmacy''는 약국을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-A-3',
    'I need some _____.',
    'medicine',
    'money',
    'food',
    'A',
    '일상생활',
    '병원 이용',
    'word',
    '''Medicine''은 약을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-A-4',
    'The _____ is very kind.',
    'nurse',
    'student',
    'thief',
    'A',
    '일상생활',
    '병원 이용',
    'word',
    '''Nurse''는 간호사를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-A-5',
    'I broke my _____.',
    'car',
    'phone',
    'arm',
    'C',
    '일상생활',
    '병원 이용',
    'word',
    '''Arm''은 팔을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-A-6',
    'I feel _____.',
    'rich',
    'sick',
    'happy',
    'B',
    '일상생활',
    '병원 이용',
    'word',
    '''Sick''은 아픈을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-A-7',
    'Where is the _____?',
    'bank',
    'restaurant',
    'pharmacy',
    'C',
    '일상생활',
    '병원 이용',
    'word',
    '''Pharmacy''는 약국을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-A-8',
    'I need some _____.',
    'medicine',
    'money',
    'food',
    'A',
    '일상생활',
    '병원 이용',
    'word',
    '''Medicine''은 약을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-A-9',
    'The _____ is very kind.',
    'student',
    'nurse',
    'thief',
    'B',
    '일상생활',
    '병원 이용',
    'word',
    '''Nurse''는 간호사를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-A-10',
    'I broke my _____.',
    'arm',
    'car',
    'phone',
    'A',
    '일상생활',
    '병원 이용',
    'word',
    '''Arm''은 팔을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-B-1',
    'I have an _____ infection.',
    'internet',
    'electric',
    'ear',
    'C',
    '일상생활',
    '병원 이용',
    'word',
    '''Ear''는 귀를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-B-2',
    'The doctor ordered blood _____.',
    'food',
    'music',
    'tests',
    'C',
    '일상생활',
    '병원 이용',
    'word',
    '''Tests''는 검사를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-B-3',
    'I need to take this _____ twice daily.',
    'elevator',
    'bus',
    'medication',
    'C',
    '일상생활',
    '병원 이용',
    'word',
    '''Medication''은 약물을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-B-4',
    'The _____ will call you tomorrow.',
    'clinic',
    'restaurant',
    'bank',
    'A',
    '일상생활',
    '병원 이용',
    'word',
    '''Clinic''은 병원을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-B-5',
    'I''m allergic to _____.',
    'penicillin',
    'money',
    'happiness',
    'A',
    '일상생활',
    '병원 이용',
    'word',
    '''Penicillin''은 페니실린을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-B-6',
    'I have an _____ infection.',
    'ear',
    'internet',
    'electric',
    'A',
    '일상생활',
    '병원 이용',
    'word',
    '''Ear''는 귀를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-B-7',
    'The doctor ordered blood _____.',
    'tests',
    'food',
    'music',
    'A',
    '일상생활',
    '병원 이용',
    'word',
    '''Tests''는 검사를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-B-8',
    'I need to take this _____ twice daily.',
    'medication',
    'elevator',
    'bus',
    'A',
    '일상생활',
    '병원 이용',
    'word',
    '''Medication''은 약물을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-B-9',
    'The _____ will call you tomorrow.',
    'clinic',
    'restaurant',
    'bank',
    'A',
    '일상생활',
    '병원 이용',
    'word',
    '''Clinic''은 병원을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-B-10',
    'I''m allergic to _____.',
    'happiness',
    'money',
    'penicillin',
    'C',
    '일상생활',
    '병원 이용',
    'word',
    '''Penicillin''은 페니실린을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-C-1',
    'The _____ recommended surgery.',
    'specialist',
    'waiter',
    'driver',
    'A',
    '일상생활',
    '병원 이용',
    'word',
    '''Specialist''는 전문의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-C-2',
    'I need a _____ opinion.',
    'third',
    'first',
    'second',
    'C',
    '일상생활',
    '병원 이용',
    'word',
    '''Second opinion''은 다른 의사의 의견을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-C-3',
    'The _____ showed a fracture.',
    'movie',
    'restaurant',
    'X-ray',
    'C',
    '일상생활',
    '병원 이용',
    'word',
    '''X-ray''는 엑스레이를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-C-4',
    'I''m scheduled for _____.',
    'shopping',
    'vacation',
    'surgery',
    'C',
    '일상생활',
    '병원 이용',
    'word',
    '''Surgery''는 수술을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-C-5',
    'The treatment requires _____.',
    'decoration',
    'rehabilitation',
    'celebration',
    'B',
    '일상생활',
    '병원 이용',
    'word',
    '''Rehabilitation''은 재활을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-C-6',
    'The _____ recommended surgery.',
    'waiter',
    'driver',
    'specialist',
    'C',
    '일상생활',
    '병원 이용',
    'word',
    '''Specialist''는 전문의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-C-7',
    'I need a _____ opinion.',
    'second',
    'third',
    'first',
    'A',
    '일상생활',
    '병원 이용',
    'word',
    '''Second opinion''은 다른 의사의 의견을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-C-8',
    'The _____ showed a fracture.',
    'restaurant',
    'X-ray',
    'movie',
    'B',
    '일상생활',
    '병원 이용',
    'word',
    '''X-ray''는 엑스레이를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-C-9',
    'I''m scheduled for _____.',
    'surgery',
    'shopping',
    'vacation',
    'A',
    '일상생활',
    '병원 이용',
    'word',
    '''Surgery''는 수술을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-word-C-10',
    'The treatment requires _____.',
    'rehabilitation',
    'celebration',
    'decoration',
    'A',
    '일상생활',
    '병원 이용',
    'word',
    '''Rehabilitation''은 재활을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-conversation-A-1',
    'Receptionist: ''Do you have an appointment scheduled for today?''',
    'Yes, I have an appointment at 3 PM under the name Johnson.',
    'I think I might have one, but I''m not sure.',
    'Do I really need an appointment to see a doctor?',
    'A',
    '일상생활',
    '병원 이용',
    'conversation',
    '병원 접수 시 예약 시간과 이름을 명확히 알려주는 것이 중요합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-conversation-A-2',
    'Nurse: ''Please have a seat in the waiting area. The doctor will see you shortly.''',
    'Thank you. Could you give me an estimate of how long the wait might be?',
    'I''m really in a hurry today.',
    'Why does it always take so long here?',
    'A',
    '일상생활',
    '병원 이용',
    'conversation',
    '간호사의 안내에 감사를 표하고 대기시간을 정중하게 문의하는 것이 적절합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-conversation-B-1',
    'Doctor: ''How long have you been experiencing these particular symptoms?''',
    'The symptoms started about a week ago. They''re most noticeable in the morning and seem to worsen with physical activity.',
    'It hasn''t been very long at all.',
    'The pain comes and goes randomly.',
    'A',
    '일상생활',
    '병원 이용',
    'conversation',
    '의사에게 증상의 시작 시점, 특징, 악화 요인 등을 구체적으로 설명하는 것이 진료에 도움이 됩니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-conversation-B-2',
    'Pharmacist: ''This medication should be taken twice daily with food. Are you currently taking any other medications or supplements?''',
    'Thank you for the instructions. Yes, I''m currently taking blood pressure medication in the morning. Should I be concerned about any interactions?',
    'I take a few different pills throughout the day.',
    'I honestly can''t remember everything I''m taking.',
    'A',
    '일상생활',
    '병원 이용',
    'conversation',
    '복용법 안내에 감사하고 현재 복용 중인 약물을 구체적으로 알리며 상호작용을 확인하는 것이 안전합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-conversation-C-1',
    'Specialist: ''Your test results indicate a complex condition requiring a multidisciplinary treatment approach. I''d like to refer you to our cardiothoracic team.''',
    'I appreciate your thorough evaluation. Could you explain what specific aspects of my condition require cardiothoracic expertise, and what should I expect from this consultation process?',
    'That sounds really serious and concerning.',
    'Just do whatever you think is best for me.',
    'A',
    '일상생활',
    '병원 이용',
    'conversation',
    '전문의의 진료 평가에 감사를 표하고 전문과 진료가 필요한 이유와 예상 과정에 대해 구체적으로 질문하는 것이 적절합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-using-hospital-conversation-C-2',
    'Department head: ''We''re considering both conservative management and surgical intervention. Each approach has distinct risk-benefit profiles that we should discuss.''',
    'I''d very much appreciate a detailed comparison of both approaches. I''m particularly interested in understanding the long-term outcomes, recovery timelines, and potential complications for each option.',
    'You''re the medical expert, so you should decide what''s best.',
    'Surgery sounds really scary to me.',
    'A',
    '일상생활',
    '병원 이용',
    'conversation',
    '의료진의 전문적인 치료 옵션 제시에 대해 상세한 비교 분석을 요청하고 장기 결과, 회복 과정, 합병증에 대한 구체적인 정보를 구하는 것이 현명한 환자의 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-A-1',
    'I''d like to *order* a coffee.',
    'ask for',
    'buy',
    'request',
    'C',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Order''는 주문하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-A-2',
    'Can I have the *bill*, please?',
    'check',
    'receipt',
    'money',
    'A',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Bill''은 계산서를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-A-3',
    'This meal is *delicious*.',
    'expensive',
    'tasty',
    'bad',
    'B',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Delicious''는 맛있다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-A-4',
    'I''m *allergic* to nuts.',
    'sensitive to',
    'hate',
    'love',
    'A',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Allergic''은 알레르기가 있다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-A-5',
    'What do you *recommend*?',
    'sell',
    'suggest',
    'cook',
    'B',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Recommend''는 추천하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-A-6',
    'I''d like to *order* a coffee.',
    'ask for',
    'buy',
    'request',
    'C',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Order''는 주문하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-A-7',
    'Can I have the *bill*, please?',
    'receipt',
    'check',
    'money',
    'B',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Bill''은 계산서를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-A-8',
    'This meal is *delicious*.',
    'expensive',
    'bad',
    'tasty',
    'C',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Delicious''는 맛있다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-A-9',
    'I''m *allergic* to nuts.',
    'sensitive to',
    'love',
    'hate',
    'A',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Allergic''은 알레르기가 있다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-A-10',
    'What do you *recommend*?',
    'sell',
    'cook',
    'suggest',
    'C',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Recommend''는 추천하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-B-1',
    'I''d like to make a *reservation* for two.',
    'table',
    'booking',
    'order',
    'B',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Reservation''은 예약을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-B-2',
    'Could you *wrap* this to go?',
    'package',
    'cook',
    'heat',
    'A',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Wrap''은 포장하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-B-3',
    'Is this dish *spicy*?',
    'hot',
    'sweet',
    'cold',
    'A',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Spicy''는 매운맛을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-B-4',
    'I''m on a *diet*.',
    'weight loss plan',
    'budget',
    'vacation',
    'A',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Diet''은 다이어트를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-B-5',
    'The service here is *excellent*.',
    'expensive',
    'outstanding',
    'slow',
    'B',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Excellent''는 훌륭한을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-B-6',
    'I''d like to make a *reservation* for two.',
    'table',
    'booking',
    'order',
    'B',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Reservation''은 예약을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-B-7',
    'Could you *wrap* this to go?',
    'cook',
    'heat',
    'package',
    'C',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Wrap''은 포장하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-B-8',
    'Is this dish *spicy*?',
    'sweet',
    'cold',
    'hot',
    'C',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Spicy''는 매운맛을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-B-9',
    'I''m on a *diet*.',
    'weight loss plan',
    'vacation',
    'budget',
    'A',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Diet''은 다이어트를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-B-10',
    'The service here is *excellent*.',
    'expensive',
    'outstanding',
    'slow',
    'B',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Excellent''는 훌륭한을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-C-1',
    'This restaurant has a great *ambiance*.',
    'menu',
    'atmosphere',
    'location',
    'B',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Ambiance''는 분위기를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-C-2',
    'I''d like to *complain* about the service.',
    'pay',
    'praise',
    'express dissatisfaction',
    'C',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Complain''은 불만을 표현하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-C-3',
    'The ingredients are *organic*.',
    'expensive',
    'naturally grown',
    'imported',
    'B',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Organic''은 유기농의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-C-4',
    'Could we have separate *checks*?',
    'bills',
    'menus',
    'tables',
    'A',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Checks''는 각각의 계산서를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-C-5',
    'This wine *complements* the meal perfectly.',
    'costs more than',
    'replaces',
    'goes well with',
    'C',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Complements''는 잘 어울린다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-C-6',
    'This restaurant has a great *ambiance*.',
    'menu',
    'location',
    'atmosphere',
    'C',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Ambiance''는 분위기를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-C-7',
    'I''d like to *complain* about the service.',
    'praise',
    'express dissatisfaction',
    'pay',
    'B',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Complain''은 불만을 표현하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-C-8',
    'The ingredients are *organic*.',
    'expensive',
    'naturally grown',
    'imported',
    'B',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Organic''은 유기농의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-C-9',
    'Could we have separate *checks*?',
    'menus',
    'bills',
    'tables',
    'B',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Checks''는 각각의 계산서를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-sentence-C-10',
    'This wine *complements* the meal perfectly.',
    'goes well with',
    'replaces',
    'costs more than',
    'A',
    '일상생활',
    '쇼핑 외식',
    'sentence',
    '''Complements''는 잘 어울린다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-A-1',
    'I need to buy some _____ for dinner.',
    'groceries',
    'books',
    'clothes',
    'A',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Groceries''는 식료품을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-A-2',
    'The _____ is too long.',
    'price',
    'food',
    'queue',
    'C',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Queue''는 줄을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-A-3',
    'Can I pay by _____?',
    'time',
    'card',
    'song',
    'B',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Card''는 카드를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-A-4',
    'This apple is very _____.',
    'expensive',
    'old',
    'fresh',
    'C',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Fresh''는 신선한을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-A-5',
    'Where is the _____ section?',
    'quick',
    'dairy',
    'happy',
    'B',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Dairy''는 유제품을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-A-6',
    'I need to buy some _____ for dinner.',
    'groceries',
    'clothes',
    'books',
    'A',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Groceries''는 식료품을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-A-7',
    'The _____ is too long.',
    'queue',
    'price',
    'food',
    'A',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Queue''는 줄을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-A-8',
    'Can I pay by _____?',
    'time',
    'card',
    'song',
    'B',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Card''는 카드를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-A-9',
    'This apple is very _____.',
    'old',
    'expensive',
    'fresh',
    'C',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Fresh''는 신선한을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-A-10',
    'Where is the _____ section?',
    'happy',
    'quick',
    'dairy',
    'C',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Dairy''는 유제품을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-B-1',
    'I prefer _____ vegetables.',
    'organic',
    'digital',
    'plastic',
    'A',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Organic''은 유기농의를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-B-2',
    'This offer is valid until the _____ date.',
    'expiry',
    'birth',
    'wedding',
    'A',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Expiry''는 만료를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-B-3',
    'Do you have a _____ program?',
    'music',
    'sports',
    'loyalty',
    'C',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Loyalty''는 충성도/적립 프로그램을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-B-4',
    'I''d like to _____ this item.',
    'hide',
    'destroy',
    'exchange',
    'C',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Exchange''는 교환하다를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-B-5',
    'The _____ is included in the price.',
    'music',
    'weather',
    'tax',
    'C',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Tax''는 세금을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-B-6',
    'I prefer _____ vegetables.',
    'organic',
    'digital',
    'plastic',
    'A',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Organic''은 유기농의를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-B-7',
    'This offer is valid until the _____ date.',
    'birth',
    'wedding',
    'expiry',
    'C',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Expiry''는 만료를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-B-8',
    'Do you have a _____ program?',
    'loyalty',
    'music',
    'sports',
    'A',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Loyalty''는 충성도/적립 프로그램을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-B-9',
    'I''d like to _____ this item.',
    'hide',
    'exchange',
    'destroy',
    'B',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Exchange''는 교환하다를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-B-10',
    'The _____ is included in the price.',
    'music',
    'weather',
    'tax',
    'C',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Tax''는 세금을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-C-1',
    'This product contains _____ ingredients.',
    'expensive',
    'artificial',
    'natural',
    'B',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Artificial''은 인공의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-C-2',
    'I have a _____ for this medication.',
    'suggestion',
    'complaint',
    'prescription',
    'C',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Prescription''은 처방전을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-C-3',
    'The store offers _____ delivery.',
    'expensive',
    'slow',
    'complimentary',
    'C',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Complimentary''는 무료의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-C-4',
    'Please keep the _____ for your records.',
    'receipt',
    'food',
    'change',
    'A',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Receipt''는 영수증을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-C-5',
    'This item is currently _____.',
    'discontinued',
    'cheap',
    'popular',
    'A',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Discontinued''는 단종된을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-C-6',
    'This product contains _____ ingredients.',
    'natural',
    'expensive',
    'artificial',
    'C',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Artificial''은 인공의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-C-7',
    'I have a _____ for this medication.',
    'complaint',
    'suggestion',
    'prescription',
    'C',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Prescription''은 처방전을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-C-8',
    'The store offers _____ delivery.',
    'expensive',
    'complimentary',
    'slow',
    'B',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Complimentary''는 무료의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-C-9',
    'Please keep the _____ for your records.',
    'change',
    'receipt',
    'food',
    'B',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Receipt''는 영수증을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-word-C-10',
    'This item is currently _____.',
    'popular',
    'discontinued',
    'cheap',
    'B',
    '일상생활',
    '쇼핑 외식',
    'word',
    '''Discontinued''는 단종된을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-conversation-A-1',
    'Server: ''What would you like to drink with your meal?''',
    'I''ll have a glass of water with lemon, please.',
    'I don''t drink anything with meals.',
    'Just bring me whatever you have.',
    'A',
    '일상생활',
    '쇼핑 외식',
    'conversation',
    '음료 주문 시 정중하게 구체적인 요청을 하는 것이 적절합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-conversation-A-2',
    'Cashier: ''Would you like your receipt with you today?''',
    'Yes, please. I''ll need it for my records.',
    'I don''t care about receipts.',
    'It doesn''t really matter to me.',
    'A',
    '일상생활',
    '쇼핑 외식',
    'conversation',
    '영수증이 필요한 경우 정중하게 요청하고 이유를 간단히 설명하는 것이 좋습니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-conversation-B-1',
    'Server: ''How was everything? Was your meal satisfactory?''',
    'Everything was delicious, thank you. The service was excellent as well.',
    'The food was okay, nothing special.',
    'It was fine, I guess.',
    'A',
    '일상생활',
    '쇼핑 외식',
    'conversation',
    '식사에 대한 만족도를 물을 때 긍정적인 피드백과 서비스에 대한 감사 인사를 표현하는 것이 좋습니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-conversation-B-2',
    'Store clerk: ''I''m sorry, but this item is currently out of stock. Would you like me to check our inventory system?''',
    'That would be great, thank you. If it''s not available, could you recommend a similar alternative?',
    'This kind of thing always happens at this store.',
    'Just forget about it then, I''ll shop elsewhere.',
    'A',
    '일상생활',
    '쇼핑 외식',
    'conversation',
    '품절 상황에서 직원의 도움에 감사를 표하고 대안을 요청하는 것이 건설적입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-conversation-C-1',
    'Sommelier: ''Based on your preference for bold flavors, I''d recommend our 2018 Cabernet Sauvignon. It has complex tannins with notes of dark cherry and oak.''',
    'That sounds perfect for my palate. I appreciate your expertise in wine pairing. Could I try a small taste first?',
    'Wine is pretty much all the same to me.',
    'Just bring me whatever red wine you have open.',
    'A',
    '일상생활',
    '쇼핑 외식',
    'conversation',
    '소믈리에의 전문적인 추천에 대해 감사를 표하고 시음을 정중하게 요청하는 것이 세련된 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'daily-shopping-eating-out-conversation-C-2',
    'Boutique manager: ''This piece is from our exclusive artisan collection, handcrafted using sustainable materials and traditional techniques.''',
    'That''s fascinating. I''m particularly interested in sustainable fashion. Could you tell me more about the artisan''s background and the specific materials used?',
    'How much does it cost? That''s all I really care about.',
    'I''m just browsing today, not looking for anything specific.',
    'A',
    '일상생활',
    '쇼핑 외식',
    'conversation',
    '고급 제품에 대한 설명에 관심을 보이며 지속가능성과 장인정신에 대한 구체적인 질문을 하는 것이 세련된 쇼핑 대화입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-B-1',
    'The professor *assigned* a difficult project.',
    'canceled',
    'gave',
    'praised',
    'B',
    '학업',
    '과제 시험',
    'sentence',
    '''Assigned''는 부여하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-B-2',
    'I need to *cite* my sources properly.',
    'destroy',
    'hide',
    'reference',
    'C',
    '학업',
    '과제 시험',
    'sentence',
    '''Cite''는 인용하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-B-3',
    'The test will *cover* three chapters.',
    'include',
    'skip',
    'repeat',
    'A',
    '학업',
    '과제 시험',
    'sentence',
    '''Cover''는 다루다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-B-4',
    'I need to *revise* my essay.',
    'submit',
    'delete',
    'edit',
    'C',
    '학업',
    '과제 시험',
    'sentence',
    '''Revise''는 수정하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-B-5',
    'The exam *format* includes multiple choice.',
    'location',
    'date',
    'structure',
    'C',
    '학업',
    '과제 시험',
    'sentence',
    '''Format''은 형식을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-B-6',
    'The professor *assigned* a difficult project.',
    'praised',
    'canceled',
    'gave',
    'C',
    '학업',
    '과제 시험',
    'sentence',
    '''Assigned''는 부여하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-B-7',
    'I need to *cite* my sources properly.',
    'reference',
    'destroy',
    'hide',
    'A',
    '학업',
    '과제 시험',
    'sentence',
    '''Cite''는 인용하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-B-8',
    'The test will *cover* three chapters.',
    'skip',
    'include',
    'repeat',
    'B',
    '학업',
    '과제 시험',
    'sentence',
    '''Cover''는 다루다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-B-9',
    'I need to *revise* my essay.',
    'edit',
    'submit',
    'delete',
    'A',
    '학업',
    '과제 시험',
    'sentence',
    '''Revise''는 수정하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-B-10',
    'The exam *format* includes multiple choice.',
    'location',
    'date',
    'structure',
    'C',
    '학업',
    '과제 시험',
    'sentence',
    '''Format''은 형식을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-C-1',
    'I need to *analyze* the data thoroughly.',
    'delete',
    'examine closely',
    'ignore',
    'B',
    '학업',
    '과제 시험',
    'sentence',
    '''Analyze''는 분석하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-C-2',
    'The thesis requires *substantial* research.',
    'significant',
    'minimal',
    'no',
    'A',
    '학업',
    '과제 시험',
    'sentence',
    '''Substantial''은 상당한을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-C-3',
    'I must *synthesize* information from multiple sources.',
    'ignore',
    'separate',
    'combine',
    'C',
    '학업',
    '과제 시험',
    'sentence',
    '''Synthesize''는 종합하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-C-4',
    'The professor provided *constructive* feedback.',
    'no',
    'negative',
    'helpful',
    'C',
    '학업',
    '과제 시험',
    'sentence',
    '''Constructive''는 건설적인을 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-C-5',
    'I need to *substantiate* my arguments.',
    'shorten',
    'support with evidence',
    'remove',
    'B',
    '학업',
    '과제 시험',
    'sentence',
    '''Substantiate''는 입증하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-C-6',
    'I need to *analyze* the data thoroughly.',
    'delete',
    'ignore',
    'examine closely',
    'C',
    '학업',
    '과제 시험',
    'sentence',
    '''Analyze''는 분석하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-C-7',
    'The thesis requires *substantial* research.',
    'minimal',
    'significant',
    'no',
    'B',
    '학업',
    '과제 시험',
    'sentence',
    '''Substantial''은 상당한을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-C-8',
    'I must *synthesize* information from multiple sources.',
    'combine',
    'ignore',
    'separate',
    'A',
    '학업',
    '과제 시험',
    'sentence',
    '''Synthesize''는 종합하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-C-9',
    'The professor provided *constructive* feedback.',
    'helpful',
    'negative',
    'no',
    'A',
    '학업',
    '과제 시험',
    'sentence',
    '''Constructive''는 건설적인을 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-C-10',
    'I need to *substantiate* my arguments.',
    'shorten',
    'remove',
    'support with evidence',
    'C',
    '학업',
    '과제 시험',
    'sentence',
    '''Substantiate''는 입증하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-A-1',
    'I need to *study* for the exam.',
    'prepare',
    'sleep',
    'play',
    'A',
    '학업',
    '과제 시험',
    'sentence',
    '''Study''는 공부하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-A-2',
    'When is the *deadline* for the assignment?',
    'start date',
    'holiday',
    'due date',
    'C',
    '학업',
    '과제 시험',
    'sentence',
    '''Deadline''은 마감일을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-A-3',
    'I need to *research* this topic.',
    'delete',
    'ignore',
    'investigate',
    'C',
    '학업',
    '과제 시험',
    'sentence',
    '''Research''는 조사하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-A-4',
    'Can I *submit* my paper online?',
    'read',
    'copy',
    'hand in',
    'C',
    '학업',
    '과제 시험',
    'sentence',
    '''Submit''은 제출하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-A-5',
    'I need help with my *homework*.',
    'assignment',
    'hobby',
    'lunch',
    'A',
    '학업',
    '과제 시험',
    'sentence',
    '''Homework''는 숙제를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-A-6',
    'I need to *study* for the exam.',
    'sleep',
    'play',
    'prepare',
    'C',
    '학업',
    '과제 시험',
    'sentence',
    '''Study''는 공부하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-A-7',
    'When is the *deadline* for the assignment?',
    'holiday',
    'due date',
    'start date',
    'B',
    '학업',
    '과제 시험',
    'sentence',
    '''Deadline''은 마감일을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-A-8',
    'I need to *research* this topic.',
    'ignore',
    'investigate',
    'delete',
    'B',
    '학업',
    '과제 시험',
    'sentence',
    '''Research''는 조사하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-A-9',
    'Can I *submit* my paper online?',
    'copy',
    'read',
    'hand in',
    'C',
    '학업',
    '과제 시험',
    'sentence',
    '''Submit''은 제출하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-sentence-A-10',
    'I need help with my *homework*.',
    'hobby',
    'assignment',
    'lunch',
    'B',
    '학업',
    '과제 시험',
    'sentence',
    '''Homework''는 숙제를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-A-1',
    'I need to write an _____.',
    'song',
    'email',
    'essay',
    'C',
    '학업',
    '과제 시험',
    'word',
    '''Essay''는 에세이를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-A-2',
    'The _____ is tomorrow.',
    'movie',
    'party',
    'test',
    'C',
    '학업',
    '과제 시험',
    'word',
    '''Test''는 시험을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-A-3',
    'Where can I find _____?',
    'games',
    'food',
    'books',
    'C',
    '학업',
    '과제 시험',
    'word',
    '''Books''는 책을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-A-4',
    'I need to use the _____.',
    'library',
    'kitchen',
    'gym',
    'A',
    '학업',
    '과제 시험',
    'word',
    '''Library''는 도서관을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-A-5',
    'My _____ is due next week.',
    'vacation',
    'birthday',
    'project',
    'C',
    '학업',
    '과제 시험',
    'word',
    '''Project''는 프로젝트를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-A-6',
    'I need to write an _____.',
    'email',
    'essay',
    'song',
    'B',
    '학업',
    '과제 시험',
    'word',
    '''Essay''는 에세이를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-A-7',
    'The _____ is tomorrow.',
    'movie',
    'test',
    'party',
    'B',
    '학업',
    '과제 시험',
    'word',
    '''Test''는 시험을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-A-8',
    'Where can I find _____?',
    'games',
    'books',
    'food',
    'B',
    '학업',
    '과제 시험',
    'word',
    '''Books''는 책을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-A-9',
    'I need to use the _____.',
    'library',
    'gym',
    'kitchen',
    'A',
    '학업',
    '과제 시험',
    'word',
    '''Library''는 도서관을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-A-10',
    'My _____ is due next week.',
    'birthday',
    'project',
    'vacation',
    'B',
    '학업',
    '과제 시험',
    'word',
    '''Project''는 프로젝트를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-B-1',
    'I need to check my _____.',
    'lunch',
    'references',
    'phone',
    'B',
    '학업',
    '과제 시험',
    'word',
    '''References''는 참고문헌을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-B-2',
    'The _____ requires 2000 words.',
    'movie',
    'song',
    'paper',
    'C',
    '학업',
    '과제 시험',
    'word',
    '''Paper''는 논문을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-B-3',
    'I''m working on my _____.',
    'thesis',
    'lunch',
    'vacation',
    'A',
    '학업',
    '과제 시험',
    'word',
    '''Thesis''는 논문을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-B-4',
    'The _____ was very challenging.',
    'movie',
    'lunch',
    'exam',
    'C',
    '학업',
    '과제 시험',
    'word',
    '''Exam''은 시험을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-B-5',
    'I need more _____ for my research.',
    'sleep',
    'food',
    'data',
    'C',
    '학업',
    '과제 시험',
    'word',
    '''Data''는 데이터를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-B-6',
    'I need to check my _____.',
    'phone',
    'references',
    'lunch',
    'B',
    '학업',
    '과제 시험',
    'word',
    '''References''는 참고문헌을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-B-7',
    'The _____ requires 2000 words.',
    'song',
    'paper',
    'movie',
    'B',
    '학업',
    '과제 시험',
    'word',
    '''Paper''는 논문을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-B-8',
    'I''m working on my _____.',
    'vacation',
    'lunch',
    'thesis',
    'C',
    '학업',
    '과제 시험',
    'word',
    '''Thesis''는 논문을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-B-9',
    'The _____ was very challenging.',
    'lunch',
    'movie',
    'exam',
    'C',
    '학업',
    '과제 시험',
    'word',
    '''Exam''은 시험을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-B-10',
    'I need more _____ for my research.',
    'data',
    'sleep',
    'food',
    'A',
    '학업',
    '과제 시험',
    'word',
    '''Data''는 데이터를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-C-1',
    'The study requires _____ analysis.',
    'culinary',
    'statistical',
    'musical',
    'B',
    '학업',
    '과제 시험',
    'word',
    '''Statistical''은 통계적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-C-2',
    'I must follow the _____ guidelines.',
    'driving',
    'academic',
    'cooking',
    'B',
    '학업',
    '과제 시험',
    'word',
    '''Academic''은 학술의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-C-3',
    'The research shows significant _____.',
    'celebration',
    'correlation',
    'decoration',
    'B',
    '학업',
    '과제 시험',
    'word',
    '''Correlation''은 상관관계를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-C-4',
    'I need to conduct a _____ review.',
    'quick',
    'musical',
    'comprehensive',
    'C',
    '학업',
    '과제 시험',
    'word',
    '''Comprehensive''는 종합적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-C-5',
    'The _____ validates my hypothesis.',
    'evidence',
    'party',
    'game',
    'A',
    '학업',
    '과제 시험',
    'word',
    '''Evidence''는 증거를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-C-6',
    'The study requires _____ analysis.',
    'statistical',
    'musical',
    'culinary',
    'A',
    '학업',
    '과제 시험',
    'word',
    '''Statistical''은 통계적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-C-7',
    'I must follow the _____ guidelines.',
    'cooking',
    'driving',
    'academic',
    'C',
    '학업',
    '과제 시험',
    'word',
    '''Academic''은 학술의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-C-8',
    'The research shows significant _____.',
    'correlation',
    'celebration',
    'decoration',
    'A',
    '학업',
    '과제 시험',
    'word',
    '''Correlation''은 상관관계를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-C-9',
    'I need to conduct a _____ review.',
    'musical',
    'quick',
    'comprehensive',
    'C',
    '학업',
    '과제 시험',
    'word',
    '''Comprehensive''는 종합적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-word-C-10',
    'The _____ validates my hypothesis.',
    'party',
    'game',
    'evidence',
    'C',
    '학업',
    '과제 시험',
    'word',
    '''Evidence''는 증거를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-conversation-A-1',
    'Teacher: ''Your research assignment is due next Friday.''',
    'Thank you for the reminder. I''ll make sure to submit it on time.',
    'I completely forgot we had an assignment due.',
    'Can I get an extension because I''m really busy?',
    'A',
    '학업',
    '과제 시험',
    'conversation',
    '과제 마감일 알림에 대해 책임감 있는 자세로 응답하고 감사 인사를 하는 것이 좋습니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-conversation-A-2',
    'Classmate: ''Would you like to study together for tomorrow''s exam?''',
    'That sounds great. Let''s meet at the library after classes end.',
    'I don''t think I have enough time for group studying.',
    'I prefer to study by myself for all my exams.',
    'A',
    '학업',
    '과제 시험',
    'conversation',
    '동료 학생의 공동 학습 제안에 긍정적으로 응답하고 구체적인 만날 장소를 제시하는 것이 협력적입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-conversation-B-1',
    'Professor: ''Your research proposal needs more depth in the methodology section. Can you revise and resubmit by next Friday?''',
    'Thank you for the specific feedback. I''ll strengthen the methodology section with additional detail on data collection and analysis methods, and I''ll have the revision ready by Friday.',
    'I thought the methodology section was detailed enough already.',
    'Next Friday seems like a very short deadline for major revisions.',
    'A',
    '학업',
    '과제 시험',
    'conversation',
    '교수의 피드백에 감사를 표하고 구체적인 개선 계획을 제시하며 마감일 준수를 약속하는 것이 학술적으로 적절합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-conversation-B-2',
    'Study group member: ''I''m struggling with the statistical analysis part of our project. Could you walk me through your approach?''',
    'Absolutely. Let me explain my step-by-step approach and share the resources that helped me understand these statistical concepts better.',
    'The statistical analysis isn''t really that complicated once you get it.',
    'You should probably ask the professor instead of me.',
    'A',
    '학업',
    '과제 시험',
    'conversation',
    '스터디 그룹에서 어려워하는 동료에게 단계별 설명과 유용한 자료를 제공하겠다는 협력적인 자세가 좋습니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-conversation-C-1',
    'Department advisor: ''Your thesis proposal shows innovative thinking, but I''m concerned about the feasibility of your data collection methodology given current constraints.''',
    'Thank you for raising this important methodological concern. I''ve considered alternative approaches including mixed-methods design and partnerships with industry collaborators to overcome data access limitations. I''d like to discuss these adaptations with you in detail.',
    'I believe the methodology I''ve proposed should work fine.',
    'Maybe I should choose a simpler and easier research topic instead.',
    'A',
    '학업',
    '과제 시험',
    'conversation',
    '지도교수의 방법론적 우려에 대해 감사를 표하고 대안적 접근법들을 구체적으로 제시하며 세부 논의를 요청하는 것이 학술적으로 성숙한 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-assignment-test-preparation-conversation-C-2',
    'Peer reviewer: ''Your analysis of contemporary theory lacks engagement with recent deconstructionist critiques. How do you justify this theoretical gap?''',
    'You raise an excellent point about deconstructionist perspectives. I focused primarily on structuralist approaches, but I see how incorporating recent critiques would strengthen my theoretical framework. I''d appreciate your recommendations for key texts to address this gap.',
    'I covered all the main theoretical approaches in my analysis.',
    'Deconstructionist critiques aren''t really relevant to my specific research topic.',
    'A',
    '학업',
    '과제 시험',
    'conversation',
    '동료 검토자의 이론적 지적에 대해 그 타당성을 인정하고, 자신의 접근법을 설명하며, 이론적 프레임워크 강화 방안과 추천 텍스트를 요청하는 것이 지적으로 겸손하고 건설적인 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-B-1',
    'The lecture *covers* important topics.',
    'ignores',
    'includes',
    'repeats',
    'B',
    '학업',
    '수업 참여',
    'sentence',
    '''Covers''는 다루다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-B-2',
    'I need to *participate* in discussions.',
    'sleep during',
    'avoid',
    'take part',
    'C',
    '학업',
    '수업 참여',
    'sentence',
    '''Participate''는 참여하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-B-3',
    'The professor *emphasizes* key points.',
    'ignores',
    'stresses',
    'whispers',
    'B',
    '학업',
    '수업 참여',
    'sentence',
    '''Emphasizes''는 강조하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-B-4',
    'Students must *contribute* to group work.',
    'avoid',
    'complain about',
    'add to',
    'C',
    '학업',
    '수업 참여',
    'sentence',
    '''Contribute''는 기여하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-B-5',
    'I need to *clarify* my understanding.',
    'confuse',
    'ignore',
    'make clear',
    'C',
    '학업',
    '수업 참여',
    'sentence',
    '''Clarify''는 명확히 하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-B-6',
    'The lecture *covers* important topics.',
    'includes',
    'ignores',
    'repeats',
    'A',
    '학업',
    '수업 참여',
    'sentence',
    '''Covers''는 다루다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-B-7',
    'I need to *participate* in discussions.',
    'sleep during',
    'take part',
    'avoid',
    'B',
    '학업',
    '수업 참여',
    'sentence',
    '''Participate''는 참여하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-B-8',
    'The professor *emphasizes* key points.',
    'whispers',
    'ignores',
    'stresses',
    'C',
    '학업',
    '수업 참여',
    'sentence',
    '''Emphasizes''는 강조하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-B-9',
    'Students must *contribute* to group work.',
    'avoid',
    'add to',
    'complain about',
    'B',
    '학업',
    '수업 참여',
    'sentence',
    '''Contribute''는 기여하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-B-10',
    'I need to *clarify* my understanding.',
    'ignore',
    'confuse',
    'make clear',
    'C',
    '학업',
    '수업 참여',
    'sentence',
    '''Clarify''는 명확히 하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-C-1',
    'The discussion *elicited* diverse perspectives.',
    'brought out',
    'ignored',
    'prevented',
    'A',
    '학업',
    '수업 참여',
    'sentence',
    '''Elicited''는 이끌어내다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-C-2',
    'Students should *synthesize* course materials.',
    'combine',
    'ignore',
    'separate',
    'A',
    '학업',
    '수업 참여',
    'sentence',
    '''Synthesize''는 종합하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-C-3',
    'The seminar *facilitates* critical thinking.',
    'prevents',
    'promotes',
    'ignores',
    'B',
    '학업',
    '수업 참여',
    'sentence',
    '''Facilitates''는 촉진하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-C-4',
    'I need to *articulate* my thoughts clearly.',
    'hide',
    'confuse',
    'express',
    'C',
    '학업',
    '수업 참여',
    'sentence',
    '''Articulate''는 명확히 표현하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-C-5',
    'The course *integrates* theory and practice.',
    'separates',
    'ignores',
    'combines',
    'C',
    '학업',
    '수업 참여',
    'sentence',
    '''Integrates''는 통합하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-C-6',
    'The discussion *elicited* diverse perspectives.',
    'ignored',
    'prevented',
    'brought out',
    'C',
    '학업',
    '수업 참여',
    'sentence',
    '''Elicited''는 이끌어내다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-C-7',
    'Students should *synthesize* course materials.',
    'combine',
    'ignore',
    'separate',
    'A',
    '학업',
    '수업 참여',
    'sentence',
    '''Synthesize''는 종합하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-C-8',
    'The seminar *facilitates* critical thinking.',
    'prevents',
    'promotes',
    'ignores',
    'B',
    '학업',
    '수업 참여',
    'sentence',
    '''Facilitates''는 촉진하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-C-9',
    'I need to *articulate* my thoughts clearly.',
    'express',
    'hide',
    'confuse',
    'A',
    '학업',
    '수업 참여',
    'sentence',
    '''Articulate''는 명확히 표현하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-C-10',
    'The course *integrates* theory and practice.',
    'separates',
    'ignores',
    'combines',
    'C',
    '학업',
    '수업 참여',
    'sentence',
    '''Integrates''는 통합하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-A-1',
    'Please *take notes* during the lecture.',
    'sleep',
    'write down',
    'talk',
    'B',
    '학업',
    '수업 참여',
    'sentence',
    '''Take notes''는 노트를 작성하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-A-2',
    'Can you *repeat* the question?',
    'ignore',
    'answer',
    'say again',
    'C',
    '학업',
    '수업 참여',
    'sentence',
    '''Repeat''는 반복하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-A-3',
    'I need to *attend* all classes.',
    'teach',
    'go to',
    'skip',
    'B',
    '학업',
    '수업 참여',
    'sentence',
    '''Attend''는 참석하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-A-4',
    'The professor will *explain* the concept.',
    'clarify',
    'forget',
    'hide',
    'A',
    '학업',
    '수업 참여',
    'sentence',
    '''Explain''은 설명하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-A-5',
    'Please *raise your hand* if you have a question.',
    'lift your hand up',
    'stand up',
    'sit down',
    'A',
    '학업',
    '수업 참여',
    'sentence',
    '''Raise your hand''는 손을 들다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-A-6',
    'Please *take notes* during the lecture.',
    'talk',
    'sleep',
    'write down',
    'C',
    '학업',
    '수업 참여',
    'sentence',
    '''Take notes''는 노트를 작성하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-A-7',
    'Can you *repeat* the question?',
    'ignore',
    'say again',
    'answer',
    'B',
    '학업',
    '수업 참여',
    'sentence',
    '''Repeat''는 반복하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-A-8',
    'I need to *attend* all classes.',
    'skip',
    'go to',
    'teach',
    'B',
    '학업',
    '수업 참여',
    'sentence',
    '''Attend''는 참석하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-A-9',
    'The professor will *explain* the concept.',
    'clarify',
    'hide',
    'forget',
    'A',
    '학업',
    '수업 참여',
    'sentence',
    '''Explain''은 설명하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-sentence-A-10',
    'Please *raise your hand* if you have a question.',
    'sit down',
    'lift your hand up',
    'stand up',
    'B',
    '학업',
    '수업 참여',
    'sentence',
    '''Raise your hand''는 손을 들다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-A-1',
    'The _____ starts at 9 AM.',
    'party',
    'movie',
    'class',
    'C',
    '학업',
    '수업 참여',
    'word',
    '''Class''는 수업을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-A-2',
    'I forgot my _____.',
    'lunch',
    'notebook',
    'keys',
    'B',
    '학업',
    '수업 참여',
    'word',
    '''Notebook''은 노트를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-A-3',
    'The _____ is very interesting.',
    'movie',
    'lecture',
    'song',
    'B',
    '학업',
    '수업 참여',
    'word',
    '''Lecture''는 강의를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-A-4',
    'I need to ask a _____.',
    'question',
    'favor',
    'song',
    'A',
    '학업',
    '수업 참여',
    'word',
    '''Question''은 질문을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-A-5',
    'Please sit in your _____.',
    'seat',
    'house',
    'car',
    'A',
    '학업',
    '수업 참여',
    'word',
    '''Seat''는 자리를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-A-6',
    'The _____ starts at 9 AM.',
    'class',
    'party',
    'movie',
    'A',
    '학업',
    '수업 참여',
    'word',
    '''Class''는 수업을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-A-7',
    'I forgot my _____.',
    'keys',
    'notebook',
    'lunch',
    'B',
    '학업',
    '수업 참여',
    'word',
    '''Notebook''은 노트를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-A-8',
    'The _____ is very interesting.',
    'song',
    'movie',
    'lecture',
    'C',
    '학업',
    '수업 참여',
    'word',
    '''Lecture''는 강의를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-A-9',
    'I need to ask a _____.',
    'song',
    'favor',
    'question',
    'C',
    '학업',
    '수업 참여',
    'word',
    '''Question''은 질문을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-A-10',
    'Please sit in your _____.',
    'seat',
    'car',
    'house',
    'A',
    '학업',
    '수업 참여',
    'word',
    '''Seat''는 자리를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-C-1',
    'The _____ requires active participation.',
    'seminar',
    'gym',
    'restaurant',
    'A',
    '학업',
    '수업 참여',
    'word',
    '''Seminar''는 세미나를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-C-2',
    'I need to prepare for the _____.',
    'presentation',
    'vacation',
    'party',
    'A',
    '학업',
    '수업 참여',
    'word',
    '''Presentation''은 발표를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-C-3',
    'The course includes _____ activities.',
    'cooking',
    'interactive',
    'sleeping',
    'B',
    '학업',
    '수업 참여',
    'word',
    '''Interactive''는 상호작용의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-C-4',
    'Students engage in _____ analysis.',
    'musical',
    'critical',
    'culinary',
    'B',
    '학업',
    '수업 참여',
    'word',
    '''Critical''은 비판적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-C-5',
    'The _____ integrates multiple disciplines.',
    'curriculum',
    'restaurant',
    'gym',
    'A',
    '학업',
    '수업 참여',
    'word',
    '''Curriculum''은 교육과정을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-C-6',
    'The _____ requires active participation.',
    'gym',
    'restaurant',
    'seminar',
    'C',
    '학업',
    '수업 참여',
    'word',
    '''Seminar''는 세미나를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-C-7',
    'I need to prepare for the _____.',
    'vacation',
    'party',
    'presentation',
    'C',
    '학업',
    '수업 참여',
    'word',
    '''Presentation''은 발표를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-C-8',
    'The course includes _____ activities.',
    'sleeping',
    'cooking',
    'interactive',
    'C',
    '학업',
    '수업 참여',
    'word',
    '''Interactive''는 상호작용의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-C-9',
    'Students engage in _____ analysis.',
    'critical',
    'culinary',
    'musical',
    'A',
    '학업',
    '수업 참여',
    'word',
    '''Critical''은 비판적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-C-10',
    'The _____ integrates multiple disciplines.',
    'curriculum',
    'gym',
    'restaurant',
    'A',
    '학업',
    '수업 참여',
    'word',
    '''Curriculum''은 교육과정을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-B-1',
    'The _____ gave us homework.',
    'waiter',
    'professor',
    'driver',
    'B',
    '학업',
    '수업 참여',
    'word',
    '''Professor''는 교수를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-B-2',
    'I need to study the _____.',
    'textbook',
    'comic',
    'cookbook',
    'A',
    '학업',
    '수업 참여',
    'word',
    '''Textbook''은 교과서를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-B-3',
    'The _____ discussion was helpful.',
    'cooking',
    'sports',
    'group',
    'C',
    '학업',
    '수업 참여',
    'word',
    '''Group''은 그룹을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-B-4',
    'I took detailed _____.',
    'notes',
    'naps',
    'photos',
    'A',
    '학업',
    '수업 참여',
    'word',
    '''Notes''는 노트를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-B-5',
    'The _____ explained the theory.',
    'instructor',
    'chef',
    'mechanic',
    'A',
    '학업',
    '수업 참여',
    'word',
    '''Instructor''는 강사를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-B-6',
    'The _____ gave us homework.',
    'driver',
    'professor',
    'waiter',
    'B',
    '학업',
    '수업 참여',
    'word',
    '''Professor''는 교수를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-B-7',
    'I need to study the _____.',
    'comic',
    'textbook',
    'cookbook',
    'B',
    '학업',
    '수업 참여',
    'word',
    '''Textbook''은 교과서를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-B-8',
    'The _____ discussion was helpful.',
    'cooking',
    'sports',
    'group',
    'C',
    '학업',
    '수업 참여',
    'word',
    '''Group''은 그룹을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-B-9',
    'I took detailed _____.',
    'notes',
    'naps',
    'photos',
    'A',
    '학업',
    '수업 참여',
    'word',
    '''Notes''는 노트를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-word-B-10',
    'The _____ explained the theory.',
    'chef',
    'instructor',
    'mechanic',
    'B',
    '학업',
    '수업 참여',
    'word',
    '''Instructor''는 강사를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-conversation-A-1',
    'Professor: ''Can you answer the question I just wrote on the board?''',
    'I''ll give it my best try. Is it asking about the main concept we discussed in yesterday''s lecture?',
    'I don''t know the answer to that question.',
    'I wasn''t really paying attention to what you wrote.',
    'A',
    '학업',
    '수업 참여',
    'conversation',
    '질문에 적극적으로 응답하려는 자세를 보이고 이해 확인을 위한 질문을 하는 것이 좋습니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-conversation-A-2',
    'Classmate: ''Did you understand what the professor just explained about this topic?''',
    'I got the main idea, but I''m not clear on some of the details. Should we ask for clarification?',
    'No, it was really confusing and hard to follow.',
    'I never understand anything in this particular class.',
    'A',
    '학업',
    '수업 참여',
    'conversation',
    '이해 정도를 솔직히 말하고 함께 명확화를 요청하자고 제안하는 것이 건설적입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-conversation-B-1',
    'Professor: ''Your interpretation of the text offers an interesting perspective. However, can you support your argument with more specific textual evidence?''',
    'Thank you for the feedback. You''re absolutely right that I need stronger textual support. Let me reference the passage in chapter 3 where the author explicitly discusses this theme.',
    'I thought my interpretation was clear enough without more evidence.',
    'The textual evidence should be obvious to anyone who read it.',
    'A',
    '학업',
    '수업 참여',
    'conversation',
    '교수의 피드백을 수용하고 구체적인 텍스트 근거를 제시하려는 학문적 자세가 적절합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-conversation-B-2',
    'Fellow student during discussion: ''I disagree with your analysis. I think you''re overlooking important historical context that changes everything.''',
    'That''s a really valid point about historical context. Could you elaborate on which specific aspects you think I should consider more deeply? I''m open to refining my analysis.',
    'I still think my analysis is correct as I presented it.',
    'Historical context isn''t always the most important factor to consider.',
    'A',
    '학업',
    '수업 참여',
    'conversation',
    '다른 학생의 비판적 의견을 타당한 지적으로 받아들이고 구체적인 설명을 요청하며 분석 개선 의지를 보이는 것이 학술적 토론에서 적절합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-conversation-C-1',
    'Department chair during seminar: ''Your synthesis of critical theory demonstrates sophisticated understanding, but how would you apply this theoretical framework to contemporary digital humanities methodologies?''',
    'That''s a fascinating interdisciplinary connection. I see potential for applying these critical frameworks to analyze algorithmic bias in digital archives and computational text analysis. The intersection could reveal new insights about power structures in digital knowledge production.',
    'I haven''t really thought about digital humanities applications before.',
    'Critical theory and digital methods don''t seem to connect very well.',
    'A',
    '학업',
    '수업 참여',
    'conversation',
    '학과장의 고차원적 질문에 대해 이론과 실제 적용의 연결점을 찾아 구체적인 사례와 함께 새로운 통찰 가능성을 제시하는 것이 대학원 세미나 수준의 학술적 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-attending-class-conversation-C-2',
    'Visiting scholar: ''Your methodology integrates quantitative and qualitative approaches innovatively. How do you address the epistemological tensions between positivist and interpretivist paradigms?''',
    'Thank you for this important epistemological question. I address these paradigmatic tensions through pragmatic pluralism, where I acknowledge the different truth claims while focusing on methodological complementarity to provide richer insights than either approach alone could offer.',
    'Mixed methods just combines both quantitative and qualitative approaches together.',
    'I don''t really worry about those kinds of epistemological issues.',
    'A',
    '학업',
    '수업 참여',
    'conversation',
    '방문 학자의 인식론적 질문에 대해 감사를 표하고 실용주의적 다원론이라는 철학적 접근법으로 패러다임 간 긴장을 해결하는 정교한 방법론적 해답을 제시하는 것이 학술적으로 성숙한 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-A-1',
    'I need to *meet* with my advisor.',
    'avoid',
    'see',
    'call',
    'B',
    '학업',
    '학과 대화',
    'sentence',
    '''Meet''는 만나다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-A-2',
    'What courses should I *take*?',
    'enroll in',
    'avoid',
    'teach',
    'A',
    '학업',
    '학과 대화',
    'sentence',
    '''Take''는 수강하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-A-3',
    'I want to *major* in psychology.',
    'teach',
    'avoid',
    'specialize in',
    'C',
    '학업',
    '학과 대화',
    'sentence',
    '''Major''는 전공하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-A-4',
    'Can I *change* my schedule?',
    'keep',
    'modify',
    'ignore',
    'B',
    '학업',
    '학과 대화',
    'sentence',
    '''Change''는 변경하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-A-5',
    'I need help with *registration*.',
    'enrollment',
    'graduation',
    'vacation',
    'A',
    '학업',
    '학과 대화',
    'sentence',
    '''Registration''은 등록을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-A-6',
    'I need to *meet* with my advisor.',
    'see',
    'avoid',
    'call',
    'A',
    '학업',
    '학과 대화',
    'sentence',
    '''Meet''는 만나다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-A-7',
    'What courses should I *take*?',
    'enroll in',
    'avoid',
    'teach',
    'A',
    '학업',
    '학과 대화',
    'sentence',
    '''Take''는 수강하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-A-8',
    'I want to *major* in psychology.',
    'avoid',
    'specialize in',
    'teach',
    'B',
    '학업',
    '학과 대화',
    'sentence',
    '''Major''는 전공하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-A-9',
    'Can I *change* my schedule?',
    'ignore',
    'modify',
    'keep',
    'B',
    '학업',
    '학과 대화',
    'sentence',
    '''Change''는 변경하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-A-10',
    'I need help with *registration*.',
    'graduation',
    'enrollment',
    'vacation',
    'B',
    '학업',
    '학과 대화',
    'sentence',
    '''Registration''은 등록을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-B-1',
    'I need to *declare* my major.',
    'hide',
    'change',
    'officially choose',
    'C',
    '학업',
    '학과 대화',
    'sentence',
    '''Declare''는 선언하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-B-2',
    'The professor has *office hours* on Tuesdays.',
    'vacation',
    'available time',
    'lunch break',
    'B',
    '학업',
    '학과 대화',
    'sentence',
    '''Office hours''는 상담 시간을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-B-3',
    'I want to *drop* this course.',
    'teach',
    'withdraw from',
    'add',
    'B',
    '학업',
    '학과 대화',
    'sentence',
    '''Drop''은 수강 취소하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-B-4',
    'I need to fulfill the *prerequisites*.',
    'required courses',
    'final exams',
    'graduation',
    'A',
    '학업',
    '학과 대화',
    'sentence',
    '''Prerequisites''는 선수과목을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-B-5',
    'Can I get *credit* for this internship?',
    'free time',
    'academic recognition',
    'money',
    'B',
    '학업',
    '학과 대화',
    'sentence',
    '''Credit''은 학점을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-B-6',
    'I need to *declare* my major.',
    'change',
    'officially choose',
    'hide',
    'B',
    '학업',
    '학과 대화',
    'sentence',
    '''Declare''는 선언하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-B-7',
    'The professor has *office hours* on Tuesdays.',
    'vacation',
    'lunch break',
    'available time',
    'C',
    '학업',
    '학과 대화',
    'sentence',
    '''Office hours''는 상담 시간을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-B-8',
    'I want to *drop* this course.',
    'teach',
    'add',
    'withdraw from',
    'C',
    '학업',
    '학과 대화',
    'sentence',
    '''Drop''은 수강 취소하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-B-9',
    'I need to fulfill the *prerequisites*.',
    'required courses',
    'final exams',
    'graduation',
    'A',
    '학업',
    '학과 대화',
    'sentence',
    '''Prerequisites''는 선수과목을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-B-10',
    'Can I get *credit* for this internship?',
    'free time',
    'academic recognition',
    'money',
    'B',
    '학업',
    '학과 대화',
    'sentence',
    '''Credit''은 학점을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-C-1',
    'I need to *petition* for course substitution.',
    'refuse',
    'ignore',
    'formally request',
    'C',
    '학업',
    '학과 대화',
    'sentence',
    '''Petition''은 청원하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-C-2',
    'The department offers *interdisciplinary* studies.',
    'single-field',
    'cross-field',
    'no',
    'B',
    '학업',
    '학과 대화',
    'sentence',
    '''Interdisciplinary''는 학제간의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-C-3',
    'I want to pursue *graduate studies*.',
    'no education',
    'undergraduate',
    'advanced education',
    'C',
    '학업',
    '학과 대화',
    'sentence',
    '''Graduate studies''는 대학원 과정을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-C-4',
    'The curriculum requires *comprehensive* exams.',
    'thorough',
    'easy',
    'no',
    'A',
    '학업',
    '학과 대화',
    'sentence',
    '''Comprehensive''는 종합적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-C-5',
    'I need to *consult* with the department head.',
    'avoid',
    'seek advice from',
    'argue with',
    'B',
    '학업',
    '학과 대화',
    'sentence',
    '''Consult''는 상담하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-C-6',
    'I need to *petition* for course substitution.',
    'ignore',
    'formally request',
    'refuse',
    'B',
    '학업',
    '학과 대화',
    'sentence',
    '''Petition''은 청원하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-C-7',
    'The department offers *interdisciplinary* studies.',
    'cross-field',
    'single-field',
    'no',
    'A',
    '학업',
    '학과 대화',
    'sentence',
    '''Interdisciplinary''는 학제간의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-C-8',
    'I want to pursue *graduate studies*.',
    'advanced education',
    'undergraduate',
    'no education',
    'A',
    '학업',
    '학과 대화',
    'sentence',
    '''Graduate studies''는 대학원 과정을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-C-9',
    'The curriculum requires *comprehensive* exams.',
    'easy',
    'no',
    'thorough',
    'C',
    '학업',
    '학과 대화',
    'sentence',
    '''Comprehensive''는 종합적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-sentence-C-10',
    'I need to *consult* with the department head.',
    'avoid',
    'seek advice from',
    'argue with',
    'B',
    '학업',
    '학과 대화',
    'sentence',
    '''Consult''는 상담하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-A-1',
    'I study _____.',
    'English',
    'sleeping',
    'cooking',
    'A',
    '학업',
    '학과 대화',
    'word',
    '''English''는 영어를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-A-2',
    'My _____ is very helpful.',
    'pet',
    'enemy',
    'advisor',
    'C',
    '학업',
    '학과 대화',
    'word',
    '''Advisor''는 지도교수를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-A-3',
    'I''m in my second _____.',
    'car',
    'house',
    'year',
    'C',
    '학업',
    '학과 대화',
    'word',
    '''Year''는 학년을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-A-4',
    'The _____ is on the third floor.',
    'office',
    'gym',
    'restaurant',
    'A',
    '학업',
    '학과 대화',
    'word',
    '''Office''는 사무실을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-A-5',
    'I need to choose my _____.',
    'clothes',
    'lunch',
    'major',
    'C',
    '학업',
    '학과 대화',
    'word',
    '''Major''는 전공을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-A-6',
    'I study _____.',
    'English',
    'sleeping',
    'cooking',
    'A',
    '학업',
    '학과 대화',
    'word',
    '''English''는 영어를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-A-7',
    'My _____ is very helpful.',
    'advisor',
    'pet',
    'enemy',
    'A',
    '학업',
    '학과 대화',
    'word',
    '''Advisor''는 지도교수를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-A-8',
    'I''m in my second _____.',
    'year',
    'car',
    'house',
    'A',
    '학업',
    '학과 대화',
    'word',
    '''Year''는 학년을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-A-9',
    'The _____ is on the third floor.',
    'office',
    'restaurant',
    'gym',
    'A',
    '학업',
    '학과 대화',
    'word',
    '''Office''는 사무실을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-A-10',
    'I need to choose my _____.',
    'major',
    'clothes',
    'lunch',
    'A',
    '학업',
    '학과 대화',
    'word',
    '''Major''는 전공을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-C-1',
    'I''m pursuing _____ research.',
    'cooking',
    'sleeping',
    'academic',
    'C',
    '학업',
    '학과 대화',
    'word',
    '''Academic''은 학술의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-C-2',
    'The department offers _____ programs.',
    'cooking',
    'driving',
    'specialized',
    'C',
    '학업',
    '학과 대화',
    'word',
    '''Specialized''는 전문화된을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-C-3',
    'I need to complete my _____.',
    'lunch',
    'vacation',
    'dissertation',
    'C',
    '학업',
    '학과 대화',
    'word',
    '''Dissertation''은 학위논문을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-C-4',
    'The _____ committee approved my proposal.',
    'faculty',
    'driving',
    'cooking',
    'A',
    '학업',
    '학과 대화',
    'word',
    '''Faculty''는 교수진을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-C-5',
    'I''m interested in _____ studies.',
    'sleeping',
    'cooking',
    'postgraduate',
    'C',
    '학업',
    '학과 대화',
    'word',
    '''Postgraduate''는 대학원의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-C-6',
    'I''m pursuing _____ research.',
    'cooking',
    'sleeping',
    'academic',
    'C',
    '학업',
    '학과 대화',
    'word',
    '''Academic''은 학술의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-C-7',
    'The department offers _____ programs.',
    'cooking',
    'specialized',
    'driving',
    'B',
    '학업',
    '학과 대화',
    'word',
    '''Specialized''는 전문화된을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-C-8',
    'I need to complete my _____.',
    'lunch',
    'dissertation',
    'vacation',
    'B',
    '학업',
    '학과 대화',
    'word',
    '''Dissertation''은 학위논문을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-C-9',
    'The _____ committee approved my proposal.',
    'driving',
    'faculty',
    'cooking',
    'B',
    '학업',
    '학과 대화',
    'word',
    '''Faculty''는 교수진을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-C-10',
    'I''m interested in _____ studies.',
    'sleeping',
    'postgraduate',
    'cooking',
    'B',
    '학업',
    '학과 대화',
    'word',
    '''Postgraduate''는 대학원의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-B-1',
    'I''m meeting with the _____.',
    'driver',
    'waiter',
    'dean',
    'C',
    '학업',
    '학과 대화',
    'word',
    '''Dean''은 학장을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-B-2',
    'I need more _____ to graduate.',
    'money',
    'time',
    'credits',
    'C',
    '학업',
    '학과 대화',
    'word',
    '''Credits''는 학점을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-B-3',
    'The _____ helps with course planning.',
    'counselor',
    'chef',
    'mechanic',
    'A',
    '학업',
    '학과 대화',
    'word',
    '''Counselor''는 상담사를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-B-4',
    'I''m applying for a _____.',
    'car',
    'scholarship',
    'restaurant',
    'B',
    '학업',
    '학과 대화',
    'word',
    '''Scholarship''은 장학금을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-B-5',
    'The _____ requirements are strict.',
    'cooking',
    'graduation',
    'driving',
    'B',
    '학업',
    '학과 대화',
    'word',
    '''Graduation''은 졸업을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-B-6',
    'I''m meeting with the _____.',
    'driver',
    'dean',
    'waiter',
    'B',
    '학업',
    '학과 대화',
    'word',
    '''Dean''은 학장을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-B-7',
    'I need more _____ to graduate.',
    'time',
    'money',
    'credits',
    'C',
    '학업',
    '학과 대화',
    'word',
    '''Credits''는 학점을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-B-8',
    'The _____ helps with course planning.',
    'mechanic',
    'chef',
    'counselor',
    'C',
    '학업',
    '학과 대화',
    'word',
    '''Counselor''는 상담사를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-B-9',
    'I''m applying for a _____.',
    'car',
    'restaurant',
    'scholarship',
    'C',
    '학업',
    '학과 대화',
    'word',
    '''Scholarship''은 장학금을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-word-B-10',
    'The _____ requirements are strict.',
    'cooking',
    'graduation',
    'driving',
    'B',
    '학업',
    '학과 대화',
    'word',
    '''Graduation''은 졸업을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-conversation-A-1',
    'Department secretary: ''You need to register for your courses by this Friday.''',
    'Thank you for the important reminder. I''ll make sure to complete my registration before the deadline.',
    'I thought course registration was next week.',
    'Can I register late if I miss the Friday deadline?',
    'A',
    '학업',
    '학과 대화',
    'conversation',
    '학과 사무실의 안내에 감사를 표하고 마감일 준수를 약속하는 것이 적절합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-conversation-A-2',
    'Academic advisor: ''What courses are you planning to take next semester?''',
    'I''m planning to take Introduction to Psychology and Statistics. Do you think these courses align well with my major requirements and academic goals?',
    'I haven''t really decided on my courses yet.',
    'I''ll just take whatever courses are still available.',
    'A',
    '학업',
    '학과 대화',
    'conversation',
    '구체적인 수강 계획을 제시하고 전공 요건과 학업 목표와의 연관성을 확인하는 질문을 하는 것이 좋습니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-conversation-B-1',
    'Department head: ''We''re considering changes to our curriculum. As a student representative, what feedback do you have about the current program structure?''',
    'Thank you for including student perspectives in this important decision. I think the core courses provide a solid foundation, but students would benefit from more practical application opportunities and interdisciplinary electives.',
    'The curriculum seems fine as it is right now.',
    'Students always have complaints about something in the program.',
    'A',
    '학업',
    '학과 대화',
    'conversation',
    '학생 의견 수렴에 감사를 표하고 현 커리큘럼의 장점을 인정하면서 건설적인 개선 제안을 하는 것이 적절합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-conversation-B-2',
    'Faculty member: ''I notice you''re interested in our research lab. What specific aspects of our work align with your academic and career goals?''',
    'I''m particularly drawn to your work on cognitive behavioral interventions. This aligns perfectly with my goal to pursue clinical psychology and would provide valuable research experience in evidence-based therapeutic approaches.',
    'Your research lab seems interesting to me.',
    'I just want to get some research experience somewhere.',
    'A',
    '학업',
    '학과 대화',
    'conversation',
    '특정 연구 분야에 대한 관심과 그것이 자신의 학업 및 진로 목표와 어떻게 연결되는지 구체적으로 설명하는 것이 좋습니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-conversation-C-1',
    'Graduate program director: ''Your doctoral application shows strong potential, but I''m concerned about theoretical coherence between your proposed research and your undergraduate focus.''',
    'Thank you for this insightful observation. While my undergraduate work focused on social psychology, I see my proposed research as extending those foundations into organizational behavior. The theoretical bridge lies in applying social identity theory to understand group dynamics in workplace settings.',
    'I think my undergraduate and graduate interests are more related than they might appear.',
    'I''m willing to change my research focus if that would be better.',
    'A',
    '학업',
    '학과 대화',
    'conversation',
    '대학원 프로그램 디렉터의 이론적 일관성에 대한 우려에 감사하며, 학부 전공과 제안 연구 간의 이론적 연결점을 구체적인 이론을 통해 명확히 설명하는 것이 학술적으로 설득력 있는 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'school-department-conversation-conversation-C-2',
    'External examiner during defense: ''Your dissertation contributes significantly to the field, but I question whether your phenomenological approach adequately addresses the ontological assumptions underlying your interpretive framework.''',
    'Thank you for this fundamental philosophical question. My phenomenological approach is grounded in Heideggerian hermeneutics, which acknowledges that understanding is always historically situated. I embrace the ontological assumption that meaning emerges through the interpreter''s engagement with lived experience, while maintaining methodological rigor through systematic bracketing of presuppositions.',
    'Phenomenology seemed like the right methodological approach for my research topic.',
    'I''m not entirely sure I understand all the philosophical implications you''re raising.',
    'A',
    '학업',
    '학과 대화',
    'conversation',
    '외부 심사위원의 존재론적 질문에 대해 감사를 표하고 하이데거의 해석학적 현상학에 기반한 철학적 입장을 명확히 하며, 의미 생성과 방법론적 엄밀성에 대한 정교한 이해를 보여주는 것이 박사 논문 심사에 적합한 학술적 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-B-1',
    'I prefer *off-the-beaten-path* destinations.',
    'expensive places',
    'uncommon places',
    'popular places',
    'B',
    '여행',
    '배낭여행',
    'sentence',
    '''Off-the-beaten-path''는 잘 알려지지 않은 장소를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-B-2',
    'The hostel offers *dormitory* rooms.',
    'shared rooms',
    'private rooms',
    'expensive rooms',
    'A',
    '여행',
    '배낭여행',
    'sentence',
    '''Dormitory''는 기숙사식 방을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-B-3',
    'I need to *conserve* my energy for hiking.',
    'waste',
    'use',
    'save',
    'C',
    '여행',
    '배낭여행',
    'sentence',
    '''Conserve''는 아끼다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-B-4',
    'Let''s *split* the cost of accommodation.',
    'double',
    'divide',
    'ignore',
    'B',
    '여행',
    '배낭여행',
    'sentence',
    '''Split''은 나누다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-B-5',
    'I want to experience *local culture*.',
    'native customs',
    'expensive restaurants',
    'tourist attractions',
    'A',
    '여행',
    '배낭여행',
    'sentence',
    '''Local culture''는 현지 문화를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-B-6',
    'I prefer *off-the-beaten-path* destinations.',
    'popular places',
    'uncommon places',
    'expensive places',
    'B',
    '여행',
    '배낭여행',
    'sentence',
    '''Off-the-beaten-path''는 잘 알려지지 않은 장소를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-B-7',
    'The hostel offers *dormitory* rooms.',
    'expensive rooms',
    'private rooms',
    'shared rooms',
    'C',
    '여행',
    '배낭여행',
    'sentence',
    '''Dormitory''는 기숙사식 방을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-B-8',
    'I need to *conserve* my energy for hiking.',
    'waste',
    'use',
    'save',
    'C',
    '여행',
    '배낭여행',
    'sentence',
    '''Conserve''는 아끼다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-B-9',
    'Let''s *split* the cost of accommodation.',
    'ignore',
    'double',
    'divide',
    'C',
    '여행',
    '배낭여행',
    'sentence',
    '''Split''은 나누다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-B-10',
    'I want to experience *local culture*.',
    'native customs',
    'tourist attractions',
    'expensive restaurants',
    'A',
    '여행',
    '배낭여행',
    'sentence',
    '''Local culture''는 현지 문화를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-C-1',
    'Backpacking allows for *spontaneous* adventures.',
    'unplanned',
    'scheduled',
    'expensive',
    'A',
    '여행',
    '배낭여행',
    'sentence',
    '''Spontaneous''는 즉흥적인을 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-C-2',
    'I need to *optimize* my packing strategy.',
    'complicate',
    'improve',
    'ignore',
    'B',
    '여행',
    '배낭여행',
    'sentence',
    '''Optimize''는 최적화하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-C-3',
    'The trail is *challenging* but rewarding.',
    'boring',
    'easy',
    'difficult',
    'C',
    '여행',
    '배낭여행',
    'sentence',
    '''Challenging''은 도전적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-C-4',
    'I prefer *sustainable* travel practices.',
    'expensive',
    'harmful',
    'environmentally friendly',
    'C',
    '여행',
    '배낭여행',
    'sentence',
    '''Sustainable''은 지속가능한을 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-C-5',
    'The journey *encompasses* multiple countries.',
    'avoids',
    'excludes',
    'includes',
    'C',
    '여행',
    '배낭여행',
    'sentence',
    '''Encompasses''는 포함하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-C-6',
    'Backpacking allows for *spontaneous* adventures.',
    'unplanned',
    'scheduled',
    'expensive',
    'A',
    '여행',
    '배낭여행',
    'sentence',
    '''Spontaneous''는 즉흥적인을 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-C-7',
    'I need to *optimize* my packing strategy.',
    'ignore',
    'complicate',
    'improve',
    'C',
    '여행',
    '배낭여행',
    'sentence',
    '''Optimize''는 최적화하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-C-8',
    'The trail is *challenging* but rewarding.',
    'difficult',
    'boring',
    'easy',
    'A',
    '여행',
    '배낭여행',
    'sentence',
    '''Challenging''은 도전적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-C-9',
    'I prefer *sustainable* travel practices.',
    'expensive',
    'harmful',
    'environmentally friendly',
    'C',
    '여행',
    '배낭여행',
    'sentence',
    '''Sustainable''은 지속가능한을 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-C-10',
    'The journey *encompasses* multiple countries.',
    'avoids',
    'includes',
    'excludes',
    'B',
    '여행',
    '배낭여행',
    'sentence',
    '''Encompasses''는 포함하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-A-1',
    'I need to *pack* my backpack.',
    'buy',
    'empty',
    'fill',
    'C',
    '여행',
    '배낭여행',
    'sentence',
    '''Pack''은 짐을 싸다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-A-2',
    'Where can I find a *hostel*?',
    'restaurant',
    'expensive hotel',
    'budget accommodation',
    'C',
    '여행',
    '배낭여행',
    'sentence',
    '''Hostel''은 호스텔을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-A-3',
    'I''m traveling on a *budget*.',
    'unlimited money',
    'limited money',
    'no money',
    'B',
    '여행',
    '배낭여행',
    'sentence',
    '''Budget''은 예산을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-A-4',
    'Can I *store* my luggage here?',
    'break',
    'lose',
    'keep',
    'C',
    '여행',
    '배낭여행',
    'sentence',
    '''Store''는 보관하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-A-5',
    'I need a *map* of the city.',
    'ticket',
    'guide',
    'menu',
    'B',
    '여행',
    '배낭여행',
    'sentence',
    '''Map''은 지도를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-A-6',
    'I need to *pack* my backpack.',
    'fill',
    'empty',
    'buy',
    'A',
    '여행',
    '배낭여행',
    'sentence',
    '''Pack''은 짐을 싸다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-A-7',
    'Where can I find a *hostel*?',
    'restaurant',
    'budget accommodation',
    'expensive hotel',
    'B',
    '여행',
    '배낭여행',
    'sentence',
    '''Hostel''은 호스텔을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-A-8',
    'I''m traveling on a *budget*.',
    'unlimited money',
    'limited money',
    'no money',
    'B',
    '여행',
    '배낭여행',
    'sentence',
    '''Budget''은 예산을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-A-9',
    'Can I *store* my luggage here?',
    'lose',
    'keep',
    'break',
    'B',
    '여행',
    '배낭여행',
    'sentence',
    '''Store''는 보관하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-sentence-A-10',
    'I need a *map* of the city.',
    'ticket',
    'guide',
    'menu',
    'B',
    '여행',
    '배낭여행',
    'sentence',
    '''Map''은 지도를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-A-1',
    'I need a new _____.',
    'car',
    'backpack',
    'house',
    'B',
    '여행',
    '배낭여행',
    'word',
    '''Backpack''은 배낭을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-A-2',
    'The _____ is very cheap.',
    'restaurant',
    'hostel',
    'mansion',
    'B',
    '여행',
    '배낭여행',
    'word',
    '''Hostel''은 호스텔을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-A-3',
    'I''m going on a _____.',
    'trip',
    'meeting',
    'diet',
    'A',
    '여행',
    '배낭여행',
    'word',
    '''Trip''은 여행을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-A-4',
    'Where can I catch a _____?',
    'bus',
    'cold',
    'fish',
    'A',
    '여행',
    '배낭여행',
    'word',
    '''Bus''는 버스를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-A-5',
    'I need comfortable _____.',
    'shoes',
    'houses',
    'cars',
    'A',
    '여행',
    '배낭여행',
    'word',
    '''Shoes''는 신발을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-A-6',
    'I need a new _____.',
    'house',
    'car',
    'backpack',
    'C',
    '여행',
    '배낭여행',
    'word',
    '''Backpack''은 배낭을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-A-7',
    'The _____ is very cheap.',
    'hostel',
    'restaurant',
    'mansion',
    'A',
    '여행',
    '배낭여행',
    'word',
    '''Hostel''은 호스텔을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-A-8',
    'I''m going on a _____.',
    'meeting',
    'trip',
    'diet',
    'B',
    '여행',
    '배낭여행',
    'word',
    '''Trip''은 여행을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-A-9',
    'Where can I catch a _____?',
    'cold',
    'bus',
    'fish',
    'B',
    '여행',
    '배낭여행',
    'word',
    '''Bus''는 버스를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-A-10',
    'I need comfortable _____.',
    'houses',
    'cars',
    'shoes',
    'C',
    '여행',
    '배낭여행',
    'word',
    '''Shoes''는 신발을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-C-1',
    'I prefer _____ travel.',
    'expensive',
    'independent',
    'guided',
    'B',
    '여행',
    '배낭여행',
    'word',
    '''Independent''는 독립적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-C-2',
    'The _____ offers unique experiences.',
    'itinerary',
    'office',
    'restaurant',
    'A',
    '여행',
    '배낭여행',
    'word',
    '''Itinerary''는 여행 일정을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-C-3',
    'I need to respect local _____.',
    'shops',
    'customs',
    'restaurants',
    'B',
    '여행',
    '배낭여행',
    'word',
    '''Customs''는 관습을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-C-4',
    'The trail requires proper _____.',
    'food',
    'music',
    'equipment',
    'C',
    '여행',
    '배낭여행',
    'word',
    '''Equipment''는 장비를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-C-5',
    'I''m documenting my _____ through photos.',
    'work',
    'journey',
    'lunch',
    'B',
    '여행',
    '배낭여행',
    'word',
    '''Journey''는 여정을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-C-6',
    'I prefer _____ travel.',
    'independent',
    'expensive',
    'guided',
    'A',
    '여행',
    '배낭여행',
    'word',
    '''Independent''는 독립적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-C-7',
    'The _____ offers unique experiences.',
    'office',
    'itinerary',
    'restaurant',
    'B',
    '여행',
    '배낭여행',
    'word',
    '''Itinerary''는 여행 일정을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-C-8',
    'I need to respect local _____.',
    'restaurants',
    'customs',
    'shops',
    'B',
    '여행',
    '배낭여행',
    'word',
    '''Customs''는 관습을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-C-9',
    'The trail requires proper _____.',
    'equipment',
    'food',
    'music',
    'A',
    '여행',
    '배낭여행',
    'word',
    '''Equipment''는 장비를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-C-10',
    'I''m documenting my _____ through photos.',
    'work',
    'lunch',
    'journey',
    'C',
    '여행',
    '배낭여행',
    'word',
    '''Journey''는 여정을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-B-1',
    'I''m staying in a _____ room.',
    'expensive',
    'shared',
    'private',
    'B',
    '여행',
    '배낭여행',
    'word',
    '''Shared''는 공유의를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-B-2',
    'The _____ has great reviews.',
    'movie',
    'accommodation',
    'restaurant',
    'B',
    '여행',
    '배낭여행',
    'word',
    '''Accommodation''은 숙박시설을 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-B-3',
    'I need to buy travel _____.',
    'clothes',
    'insurance',
    'food',
    'B',
    '여행',
    '배낭여행',
    'word',
    '''Insurance''는 보험을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-B-4',
    'The _____ is breathtaking.',
    'scenery',
    'music',
    'food',
    'A',
    '여행',
    '배낭여행',
    'word',
    '''Scenery''는 풍경을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-B-5',
    'I''m following the _____ guide.',
    'driving',
    'travel',
    'cooking',
    'B',
    '여행',
    '배낭여행',
    'word',
    '''Travel guide''는 여행 가이드를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-B-6',
    'I''m staying in a _____ room.',
    'expensive',
    'private',
    'shared',
    'C',
    '여행',
    '배낭여행',
    'word',
    '''Shared''는 공유의를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-B-7',
    'The _____ has great reviews.',
    'restaurant',
    'accommodation',
    'movie',
    'B',
    '여행',
    '배낭여행',
    'word',
    '''Accommodation''은 숙박시설을 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-B-8',
    'I need to buy travel _____.',
    'food',
    'insurance',
    'clothes',
    'B',
    '여행',
    '배낭여행',
    'word',
    '''Insurance''는 보험을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-B-9',
    'The _____ is breathtaking.',
    'scenery',
    'music',
    'food',
    'A',
    '여행',
    '배낭여행',
    'word',
    '''Scenery''는 풍경을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-word-B-10',
    'I''m following the _____ guide.',
    'cooking',
    'driving',
    'travel',
    'C',
    '여행',
    '배낭여행',
    'word',
    '''Travel guide''는 여행 가이드를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-conversation-A-1',
    'Hostel receptionist: ''What time would you like to check out tomorrow morning?''',
    'What time is checkout? I''d prefer to leave around 10 AM if that''s possible.',
    'I''ll check out whenever I wake up.',
    'I don''t really know my plans for tomorrow yet.',
    'A',
    '여행',
    '배낭여행',
    'conversation',
    '체크아웃 시간을 확인하고 자신의 계획을 정중하게 알려주는 것이 적절합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-conversation-A-2',
    'Fellow backpacker: ''Where are you planning to head next on your trip?''',
    'I''m planning to go to Prague next. Have you been there before? Any recommendations?',
    'I''m not really sure where I''m going yet.',
    'I''m just traveling around Europe somewhere.',
    'A',
    '여행',
    '배낭여행',
    'conversation',
    '구체적인 계획을 공유하고 상대방의 경험과 조언을 구하는 것이 좋은 여행자 간의 대화입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-conversation-C-1',
    'Conservation officer: ''This protected ecosystem requires minimal impact camping techniques. Your group size and planned route may affect wildlife migration patterns.''',
    'We absolutely respect the conservation priorities here. We''re prepared to split into smaller groups, adjust our timing to avoid sensitive periods, and use only established campsites. Could you provide guidance on the least disruptive route alternatives and current wildlife activity patterns?',
    'We''ll be very careful not to disturb anything while we''re here.',
    'We''ve already planned our entire route and made all our reservations.',
    'A',
    '여행',
    '배낭여행',
    'conversation',
    '보호구역 관리자의 환경적 우려에 대해 보존 우선순위를 존중한다는 명확한 입장을 표하고, 구체적인 완화 조치들을 제시하며, 전문적인 가이던스를 요청하는 것이 책임감 있는 생태 백패커의 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-conversation-C-2',
    'Cultural anthropologist: ''Your presence in this indigenous territory represents cross-cultural contact that can have lasting impacts. How do you approach travel in culturally sensitive areas?''',
    'Thank you for raising this crucial consideration. I approach such travel with deep humility, always seeking permission through appropriate community channels, contributing economically in ways the community prefers, and educating myself about cultural protocols beforehand. I''m committed to being a respectful guest rather than just a visitor.',
    'I always try to be respectful of local customs and traditions.',
    'Tourism generally helps local economies, so it''s beneficial for everyone.',
    'A',
    '여행',
    '배낭여행',
    'conversation',
    '문화인류학자의 민감한 문화적 접촉에 대한 지적에 감사하며, 겸손한 자세, 적절한 허가 절차, 지역사회 선호 방식의 경제적 기여, 사전 문화 교육, 손님으로서의 자세 등 포괄적이고 존중하는 접근 방식을 제시하는 것이 문화적으로 의식 있는 여행자의 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-conversation-B-1',
    'Local mountain guide: ''The weather can be unpredictable in these mountains. Do you have proper gear for potentially challenging conditions?''',
    'Yes, I have waterproof gear and layers for temperature changes. Could you recommend any additional equipment I should consider for this specific trail?',
    'I think I''m prepared enough for most situations.',
    'The weather forecast looked fine when I checked this morning.',
    'A',
    '여행',
    '배낭여행',
    'conversation',
    '안전 장비 준비 상황을 확인해주고 해당 트레일에 특화된 추가 조언을 구하는 것이 책임감 있는 여행자의 자세입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-backpacking-conversation-B-2',
    'Experienced traveler: ''That route through the national park is challenging but rewarding. Have you considered the permit requirements and camping restrictions?''',
    'Thank you for the valuable advice. I''ve researched the basic requirements, but could you share your experience with the permit process? I want to make sure I''m fully compliant with all park regulations.',
    'I''ll figure out the permit stuff when I get there.',
    'Permits and restrictions are just unnecessary bureaucracy.',
    'A',
    '여행',
    '배낭여행',
    'conversation',
    '조언에 감사를 표하고 기본 조사를 마쳤음을 알리면서 실제 경험담을 요청하고 규정 준수 의지를 보이는 것이 현명한 백패커의 대응입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-A-1',
    'We need *family-friendly* activities.',
    'adults only',
    'suitable for all ages',
    'boring',
    'B',
    '여행',
    '가족여행',
    'sentence',
    '''Family-friendly''는 가족 친화적인을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-A-2',
    'Can we get a *discount* for children?',
    'higher price',
    'reduced price',
    'no price',
    'B',
    '여행',
    '가족여행',
    'sentence',
    '''Discount''는 할인을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-A-3',
    'I need to *book* a family room.',
    'cancel',
    'reserve',
    'avoid',
    'B',
    '여행',
    '가족여행',
    'sentence',
    '''Book''은 예약하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-A-4',
    'The kids want to go to the *playground*.',
    'restaurant',
    'office',
    'play area',
    'C',
    '여행',
    '가족여행',
    'sentence',
    '''Playground''는 놀이터를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-A-5',
    'We should *plan* our itinerary carefully.',
    'organize',
    'cancel',
    'ignore',
    'A',
    '여행',
    '가족여행',
    'sentence',
    '''Plan''은 계획하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-A-6',
    'We need *family-friendly* activities.',
    'boring',
    'suitable for all ages',
    'adults only',
    'B',
    '여행',
    '가족여행',
    'sentence',
    '''Family-friendly''는 가족 친화적인을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-A-7',
    'Can we get a *discount* for children?',
    'no price',
    'reduced price',
    'higher price',
    'B',
    '여행',
    '가족여행',
    'sentence',
    '''Discount''는 할인을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-A-8',
    'I need to *book* a family room.',
    'reserve',
    'avoid',
    'cancel',
    'A',
    '여행',
    '가족여행',
    'sentence',
    '''Book''은 예약하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-A-9',
    'The kids want to go to the *playground*.',
    'office',
    'restaurant',
    'play area',
    'C',
    '여행',
    '가족여행',
    'sentence',
    '''Playground''는 놀이터를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-A-10',
    'We should *plan* our itinerary carefully.',
    'organize',
    'ignore',
    'cancel',
    'A',
    '여행',
    '가족여행',
    'sentence',
    '''Plan''은 계획하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-C-1',
    'The vacation *encompasses* educational experiences.',
    'avoids',
    'includes',
    'excludes',
    'B',
    '여행',
    '가족여행',
    'sentence',
    '''Encompasses''는 포함하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-C-2',
    'We seek *culturally enriching* activities.',
    'expensive',
    'boring',
    'educational',
    'C',
    '여행',
    '가족여행',
    'sentence',
    '''Culturally enriching''은 문화적으로 풍요로운을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-C-3',
    'The itinerary *balances* fun and learning.',
    'combines equally',
    'separates',
    'ignores',
    'A',
    '여행',
    '가족여행',
    'sentence',
    '''Balances''는 균형을 맞추다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-C-4',
    'We need *accessible* facilities for grandparents.',
    'difficult',
    'suitable for elderly',
    'expensive',
    'B',
    '여행',
    '가족여행',
    'sentence',
    '''Accessible''는 접근 가능한을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-C-5',
    'The resort *specializes* in family vacations.',
    'avoids',
    'charges extra for',
    'focuses on',
    'C',
    '여행',
    '가족여행',
    'sentence',
    '''Specializes''는 전문화하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-C-6',
    'The vacation *encompasses* educational experiences.',
    'excludes',
    'avoids',
    'includes',
    'C',
    '여행',
    '가족여행',
    'sentence',
    '''Encompasses''는 포함하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-C-7',
    'We seek *culturally enriching* activities.',
    'boring',
    'expensive',
    'educational',
    'C',
    '여행',
    '가족여행',
    'sentence',
    '''Culturally enriching''은 문화적으로 풍요로운을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-C-8',
    'The itinerary *balances* fun and learning.',
    'combines equally',
    'separates',
    'ignores',
    'A',
    '여행',
    '가족여행',
    'sentence',
    '''Balances''는 균형을 맞추다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-C-9',
    'We need *accessible* facilities for grandparents.',
    'difficult',
    'expensive',
    'suitable for elderly',
    'C',
    '여행',
    '가족여행',
    'sentence',
    '''Accessible''는 접근 가능한을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-C-10',
    'The resort *specializes* in family vacations.',
    'avoids',
    'charges extra for',
    'focuses on',
    'C',
    '여행',
    '가족여행',
    'sentence',
    '''Specializes''는 전문화하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-B-1',
    'The resort offers *supervised* kids'' activities.',
    'expensive',
    'unsupervised',
    'monitored',
    'C',
    '여행',
    '가족여행',
    'sentence',
    '''Supervised''는 관리되는을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-B-2',
    'We need *adjoining* rooms for the family.',
    'connecting',
    'expensive',
    'separate',
    'A',
    '여행',
    '가족여행',
    'sentence',
    '''Adjoining''은 인접한을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-B-3',
    'The tour *accommodates* families with young children.',
    'excludes',
    'provides for',
    'charges extra for',
    'B',
    '여행',
    '가족여행',
    'sentence',
    '''Accommodates''는 수용하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-B-4',
    'We prefer *all-inclusive* packages.',
    'expensive only',
    'everything included',
    'nothing included',
    'B',
    '여행',
    '가족여행',
    'sentence',
    '''All-inclusive''는 모든 것이 포함된을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-B-5',
    'The attraction has *height restrictions*.',
    'no limits',
    'size limits',
    'age limits',
    'B',
    '여행',
    '가족여행',
    'sentence',
    '''Height restrictions''는 키 제한을 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-B-6',
    'The resort offers *supervised* kids'' activities.',
    'unsupervised',
    'monitored',
    'expensive',
    'B',
    '여행',
    '가족여행',
    'sentence',
    '''Supervised''는 관리되는을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-B-7',
    'We need *adjoining* rooms for the family.',
    'separate',
    'expensive',
    'connecting',
    'C',
    '여행',
    '가족여행',
    'sentence',
    '''Adjoining''은 인접한을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-B-8',
    'The tour *accommodates* families with young children.',
    'provides for',
    'excludes',
    'charges extra for',
    'A',
    '여행',
    '가족여행',
    'sentence',
    '''Accommodates''는 수용하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-B-9',
    'We prefer *all-inclusive* packages.',
    'nothing included',
    'expensive only',
    'everything included',
    'C',
    '여행',
    '가족여행',
    'sentence',
    '''All-inclusive''는 모든 것이 포함된을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-sentence-B-10',
    'The attraction has *height restrictions*.',
    'no limits',
    'age limits',
    'size limits',
    'C',
    '여행',
    '가족여행',
    'sentence',
    '''Height restrictions''는 키 제한을 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-A-1',
    'The _____ love the pool.',
    'pets',
    'adults',
    'children',
    'C',
    '여행',
    '가족여행',
    'word',
    '''Children''은 아이들을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-A-2',
    'We need a _____ room.',
    'single',
    'family',
    'office',
    'B',
    '여행',
    '가족여행',
    'word',
    '''Family room''은 가족실을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-A-3',
    'The _____ has many rides.',
    'park',
    'library',
    'office',
    'A',
    '여행',
    '가족여행',
    'word',
    '''Park''는 공원을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-A-4',
    'Dad is taking _____.',
    'photos',
    'naps',
    'work',
    'A',
    '여행',
    '가족여행',
    'word',
    '''Photos''는 사진을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-A-5',
    'Mom packed healthy _____.',
    'books',
    'snacks',
    'clothes',
    'B',
    '여행',
    '가족여행',
    'word',
    '''Snacks''는 간식을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-A-6',
    'The _____ love the pool.',
    'pets',
    'adults',
    'children',
    'C',
    '여행',
    '가족여행',
    'word',
    '''Children''은 아이들을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-A-7',
    'We need a _____ room.',
    'family',
    'office',
    'single',
    'A',
    '여행',
    '가족여행',
    'word',
    '''Family room''은 가족실을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-A-8',
    'The _____ has many rides.',
    'park',
    'library',
    'office',
    'A',
    '여행',
    '가족여행',
    'word',
    '''Park''는 공원을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-A-9',
    'Dad is taking _____.',
    'photos',
    'naps',
    'work',
    'A',
    '여행',
    '가족여행',
    'word',
    '''Photos''는 사진을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-A-10',
    'Mom packed healthy _____.',
    'snacks',
    'clothes',
    'books',
    'A',
    '여행',
    '가족여행',
    'word',
    '''Snacks''는 간식을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-B-1',
    'The hotel provides _____ for kids.',
    'homework',
    'entertainment',
    'work',
    'B',
    '여행',
    '가족여행',
    'word',
    '''Entertainment''는 오락을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-B-2',
    'We booked a _____ vacation.',
    'package',
    'work',
    'business',
    'A',
    '여행',
    '가족여행',
    'word',
    '''Package''는 패키지를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-B-3',
    'The _____ is very spacious.',
    'suite',
    'closet',
    'car',
    'A',
    '여행',
    '가족여행',
    'word',
    '''Suite''는 스위트룸을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-B-4',
    'Kids enjoy the _____ activities.',
    'work',
    'indoor',
    'outdoor',
    'C',
    '여행',
    '가족여행',
    'word',
    '''Outdoor''는 야외의를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-B-5',
    'The _____ includes breakfast.',
    'work',
    'rate',
    'homework',
    'B',
    '여행',
    '가족여행',
    'word',
    '''Rate''는 요금을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-B-6',
    'The hotel provides _____ for kids.',
    'work',
    'entertainment',
    'homework',
    'B',
    '여행',
    '가족여행',
    'word',
    '''Entertainment''는 오락을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-B-7',
    'We booked a _____ vacation.',
    'work',
    'package',
    'business',
    'B',
    '여행',
    '가족여행',
    'word',
    '''Package''는 패키지를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-B-8',
    'The _____ is very spacious.',
    'suite',
    'car',
    'closet',
    'A',
    '여행',
    '가족여행',
    'word',
    '''Suite''는 스위트룸을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-B-9',
    'Kids enjoy the _____ activities.',
    'work',
    'indoor',
    'outdoor',
    'C',
    '여행',
    '가족여행',
    'word',
    '''Outdoor''는 야외의를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-B-10',
    'The _____ includes breakfast.',
    'work',
    'rate',
    'homework',
    'B',
    '여행',
    '가족여행',
    'word',
    '''Rate''는 요금을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-C-1',
    'The resort offers _____ programs.',
    'educational',
    'work',
    'business',
    'A',
    '여행',
    '가족여행',
    'word',
    '''Educational''은 교육적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-C-2',
    'We prefer _____ accommodations.',
    'luxury',
    'basic',
    'work',
    'A',
    '여행',
    '가족여행',
    'word',
    '''Luxury''는 고급의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-C-3',
    'The _____ caters to all ages.',
    'office',
    'destination',
    'school',
    'B',
    '여행',
    '가족여행',
    'word',
    '''Destination''은 목적지를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-C-4',
    'The trip includes _____ experiences.',
    'work',
    'business',
    'cultural',
    'C',
    '여행',
    '가족여행',
    'word',
    '''Cultural''은 문화적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-C-5',
    'We need _____ transportation.',
    'work',
    'reliable',
    'unreliable',
    'B',
    '여행',
    '가족여행',
    'word',
    '''Reliable''은 신뢰할 수 있는을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-C-6',
    'The resort offers _____ programs.',
    'educational',
    'work',
    'business',
    'A',
    '여행',
    '가족여행',
    'word',
    '''Educational''은 교육적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-C-7',
    'We prefer _____ accommodations.',
    'work',
    'luxury',
    'basic',
    'B',
    '여행',
    '가족여행',
    'word',
    '''Luxury''는 고급의를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-C-8',
    'The _____ caters to all ages.',
    'destination',
    'office',
    'school',
    'A',
    '여행',
    '가족여행',
    'word',
    '''Destination''은 목적지를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-C-9',
    'The trip includes _____ experiences.',
    'business',
    'cultural',
    'work',
    'B',
    '여행',
    '가족여행',
    'word',
    '''Cultural''은 문화적인을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-word-C-10',
    'We need _____ transportation.',
    'unreliable',
    'work',
    'reliable',
    'C',
    '여행',
    '가족여행',
    'word',
    '''Reliable''은 신뢰할 수 있는을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-conversation-A-1',
    'Hotel concierge: ''What types of activities would your family be most interested in during your stay?''',
    'We have two young children, so we''re looking for family-friendly activities like interactive museums or parks. What would you recommend for kids their age?',
    'We want to do fun things, but nothing too expensive.',
    'We''ll probably just figure out what to do as we go.',
    'A',
    '여행',
    '가족여행',
    'conversation',
    '가족 구성을 알려주고 구체적인 관심사를 제시하여 맞춤 추천을 받는 것이 좋습니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-conversation-A-2',
    'Restaurant host: ''Do you need a high chair or booster seat for your little one?''',
    'Yes, a high chair would be very helpful. Thank you for offering.',
    'We don''t really need any special accommodations.',
    'Do you have those kinds of things available here?',
    'A',
    '여행',
    '가족여행',
    'conversation',
    '아이를 위한 배려에 감사를 표하고 필요함을 명확히 알리는 것이 적절합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-conversation-B-1',
    'Tour guide: ''This historical site has steep stairs and uneven surfaces. Will this be manageable for your elderly parents and young children?''',
    'Thank you for the heads up. My parents are fairly active, but could you suggest an alternative route or tell us about accessibility options? We want everyone to enjoy the experience safely.',
    'They''ll probably manage to get through it somehow.',
    'We''ll just take our chances and see how it goes.',
    'A',
    '여행',
    '가족여행',
    'conversation',
    '가족 구성원의 상황을 설명하고 대안이나 접근성 옵션을 문의하며 모두의 안전한 참여를 우선시하는 배려 깊은 가족 여행 리더의 대응입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-conversation-B-2',
    'Local parent at playground: ''Your children are welcome to join our kids in the game. Are you comfortable with them playing together?''',
    'That''s so kind of you to offer! My children would love that. I''ll keep an eye on them, and please let me know if they need any guidance with your family rules.',
    'Sure, they can play together if they want to.',
    'I don''t know if that''s such a good idea right now.',
    'A',
    '여행',
    '가족여행',
    'conversation',
    '다른 가족의 친근한 제안에 감사를 표하고 아이들이 즐거워할 것이라는 긍정적 반응을 보이며, 감독 의지와 상대방 가족 규칙 존중 의사를 표현하는 것이 따뜻한 가족 간 교류를 보여줍니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-conversation-C-1',
    'Cultural heritage specialist: ''This UNESCO site offers educational programs that enhance understanding of historical significance. We have age-appropriate materials from elementary to adult levels.''',
    'That sounds wonderful! We believe travel is an incredible learning opportunity. Could you help us design an experience that engages our teenagers intellectually while keeping our younger children interested? We''re particularly curious about hands-on activities that connect past and present.',
    'Educational programs sound too formal and structured for vacation time.',
    'We just want to see the main sights and take some photos.',
    'A',
    '여행',
    '가족여행',
    'conversation',
    '문화유산 전문가의 교육 프로그램 제안에 열정적으로 반응하며 여행을 학습 기회로 보는 교육적 가치관을 표현하고, 다양한 연령대의 아이들을 고려한 맞춤형 경험과 체험 활동을 요청하는 것이 교육에 관심 있는 가족의 성숙한 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-family-trip-conversation-C-2',
    'Sustainable tourism coordinator: ''Our destination implements responsible tourism practices to preserve cultural authenticity while providing meaningful experiences. Your family''s choices can support local communities.''',
    'We''re absolutely committed to responsible travel and want our children to understand their impact as global citizens. Could you recommend locally-owned accommodations, authentic cultural exchanges, and conservation activities where our family can contribute positively? We''d love to make this both educational and meaningful.',
    'We try to be responsible tourists when we can.',
    'As long as it doesn''t cost significantly more, we''re interested.',
    'A',
    '여행',
    '가족여행',
    'conversation',
    '지속가능한 관광 코디네이터의 책임감 있는 여행 제안에 대해 강한 의지를 표명하며 아이들을 세계시민으로 교육하려는 목표를 밝히고, 지역 경제 지원, 진정한 문화 교류, 보존 활동 참여 등 구체적이고 의미 있는 여행 방식을 요청하는 것이 의식 있는 가족 여행자의 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-C-1',
    'The excursion *facilitated* group bonding.',
    'prevented',
    'ignored',
    'helped',
    'C',
    '여행',
    '친구와 여행',
    'sentence',
    '''Facilitated''는 촉진하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-C-2',
    'We *prioritized* adventure over comfort.',
    'put first',
    'avoided',
    'ignored',
    'A',
    '여행',
    '친구와 여행',
    'sentence',
    '''Prioritized''는 우선순위를 두다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-C-3',
    'The journey *encompassed* diverse experiences.',
    'avoided',
    'excluded',
    'included',
    'C',
    '여행',
    '친구와 여행',
    'sentence',
    '''Encompassed''는 포함하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-C-4',
    'We *collaborated* on trip planning.',
    'argued',
    'worked together',
    'worked separately',
    'B',
    '여행',
    '친구와 여행',
    'sentence',
    '''Collaborated''는 협력하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-C-5',
    'The adventure *exceeded* our expectations.',
    'met',
    'fell short of',
    'surpassed',
    'C',
    '여행',
    '친구와 여행',
    'sentence',
    '''Exceeded''는 초과하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-C-6',
    'The excursion *facilitated* group bonding.',
    'helped',
    'ignored',
    'prevented',
    'A',
    '여행',
    '친구와 여행',
    'sentence',
    '''Facilitated''는 촉진하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-C-7',
    'We *prioritized* adventure over comfort.',
    'put first',
    'ignored',
    'avoided',
    'A',
    '여행',
    '친구와 여행',
    'sentence',
    '''Prioritized''는 우선순위를 두다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-C-8',
    'The journey *encompassed* diverse experiences.',
    'avoided',
    'included',
    'excluded',
    'B',
    '여행',
    '친구와 여행',
    'sentence',
    '''Encompassed''는 포함하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-C-9',
    'We *collaborated* on trip planning.',
    'worked together',
    'worked separately',
    'argued',
    'A',
    '여행',
    '친구와 여행',
    'sentence',
    '''Collaborated''는 협력하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-C-10',
    'The adventure *exceeded* our expectations.',
    'met',
    'fell short of',
    'surpassed',
    'C',
    '여행',
    '친구와 여행',
    'sentence',
    '''Exceeded''는 초과하다는 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-B-1',
    'The group decided to *venture* into the mountains.',
    'work',
    'go exploring',
    'stay home',
    'B',
    '여행',
    '친구와 여행',
    'sentence',
    '''Venture''는 모험하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-B-2',
    'We should *compromise* on the destination.',
    'argue',
    'separate',
    'find middle ground',
    'C',
    '여행',
    '친구와 여행',
    'sentence',
    '''Compromise''는 타협하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-B-3',
    'Let''s *indulge* in local cuisine.',
    'cook',
    'avoid',
    'enjoy freely',
    'C',
    '여행',
    '친구와 여행',
    'sentence',
    '''Indulge''는 즐기다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-B-4',
    'The trip *strengthened* our friendship.',
    'weakened',
    'made stronger',
    'ended',
    'B',
    '여행',
    '친구와 여행',
    'sentence',
    '''Strengthened''는 강화하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-B-5',
    'We need to *synchronize* our departure times.',
    'separate',
    'ignore',
    'match up',
    'C',
    '여행',
    '친구와 여행',
    'sentence',
    '''Synchronize''는 동기화하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-B-6',
    'The group decided to *venture* into the mountains.',
    'go exploring',
    'work',
    'stay home',
    'A',
    '여행',
    '친구와 여행',
    'sentence',
    '''Venture''는 모험하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-B-7',
    'We should *compromise* on the destination.',
    'separate',
    'find middle ground',
    'argue',
    'B',
    '여행',
    '친구와 여행',
    'sentence',
    '''Compromise''는 타협하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-B-8',
    'Let''s *indulge* in local cuisine.',
    'enjoy freely',
    'cook',
    'avoid',
    'A',
    '여행',
    '친구와 여행',
    'sentence',
    '''Indulge''는 즐기다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-B-9',
    'The trip *strengthened* our friendship.',
    'made stronger',
    'weakened',
    'ended',
    'A',
    '여행',
    '친구와 여행',
    'sentence',
    '''Strengthened''는 강화하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-B-10',
    'We need to *synchronize* our departure times.',
    'separate',
    'ignore',
    'match up',
    'C',
    '여행',
    '친구와 여행',
    'sentence',
    '''Synchronize''는 동기화하다는 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-A-1',
    'Let''s *split* the cost.',
    'divide',
    'ignore',
    'double',
    'A',
    '여행',
    '친구와 여행',
    'sentence',
    '''Split''은 나누다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-A-2',
    'We should *book* tickets in advance.',
    'lose',
    'reserve',
    'cancel',
    'B',
    '여행',
    '친구와 여행',
    'sentence',
    '''Book''은 예약하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-A-3',
    'Everyone wants to *party* tonight.',
    'sleep',
    'celebrate',
    'work',
    'B',
    '여행',
    '친구와 여행',
    'sentence',
    '''Party''는 파티하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-A-4',
    'Let''s *explore* the nightlife.',
    'avoid',
    'sleep',
    'discover',
    'C',
    '여행',
    '친구와 여행',
    'sentence',
    '''Explore''는 탐험하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-A-5',
    'We need to *coordinate* our schedules.',
    'ignore',
    'organize together',
    'separate',
    'B',
    '여행',
    '친구와 여행',
    'sentence',
    '''Coordinate''는 조정하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-A-6',
    'Let''s *split* the cost.',
    'divide',
    'ignore',
    'double',
    'A',
    '여행',
    '친구와 여행',
    'sentence',
    '''Split''은 나누다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-A-7',
    'We should *book* tickets in advance.',
    'cancel',
    'lose',
    'reserve',
    'C',
    '여행',
    '친구와 여행',
    'sentence',
    '''Book''은 예약하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-A-8',
    'Everyone wants to *party* tonight.',
    'sleep',
    'celebrate',
    'work',
    'B',
    '여행',
    '친구와 여행',
    'sentence',
    '''Party''는 파티하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-A-9',
    'Let''s *explore* the nightlife.',
    'discover',
    'sleep',
    'avoid',
    'A',
    '여행',
    '친구와 여행',
    'sentence',
    '''Explore''는 탐험하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-sentence-A-10',
    'We need to *coordinate* our schedules.',
    'organize together',
    'ignore',
    'separate',
    'A',
    '여행',
    '친구와 여행',
    'sentence',
    '''Coordinate''는 조정하다는 의미입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-C-1',
    'We planned a _____ itinerary.',
    'rigid',
    'work',
    'flexible',
    'C',
    '여행',
    '친구와 여행',
    'word',
    '''Flexible''은 유연한을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-C-2',
    'The trip created lasting _____.',
    'problems',
    'work',
    'bonds',
    'C',
    '여행',
    '친구와 여행',
    'word',
    '''Bonds''는 유대감을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-C-3',
    'We documented our _____ journey.',
    'work',
    'adventurous',
    'boring',
    'B',
    '여행',
    '친구와 여행',
    'word',
    '''Adventurous''는 모험적인을 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-C-4',
    'The group showed great _____.',
    'work',
    'conflict',
    'camaraderie',
    'C',
    '여행',
    '친구와 여행',
    'word',
    '''Camaraderie''는 동료애를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-C-5',
    'We embraced _____ experiences.',
    'spontaneous',
    'planned',
    'work',
    'A',
    '여행',
    '친구와 여행',
    'word',
    '''Spontaneous''는 즉흥적인을 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-C-6',
    'We planned a _____ itinerary.',
    'rigid',
    'flexible',
    'work',
    'B',
    '여행',
    '친구와 여행',
    'word',
    '''Flexible''은 유연한을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-C-7',
    'The trip created lasting _____.',
    'work',
    'bonds',
    'problems',
    'B',
    '여행',
    '친구와 여행',
    'word',
    '''Bonds''는 유대감을 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-C-8',
    'We documented our _____ journey.',
    'boring',
    'work',
    'adventurous',
    'C',
    '여행',
    '친구와 여행',
    'word',
    '''Adventurous''는 모험적인을 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-C-9',
    'The group showed great _____.',
    'work',
    'camaraderie',
    'conflict',
    'B',
    '여행',
    '친구와 여행',
    'word',
    '''Camaraderie''는 동료애를 의미합니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-C-10',
    'We embraced _____ experiences.',
    'planned',
    'spontaneous',
    'work',
    'B',
    '여행',
    '친구와 여행',
    'word',
    '''Spontaneous''는 즉흥적인을 의미입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-B-1',
    'The _____ was amazing.',
    'work',
    'adventure',
    'meeting',
    'B',
    '여행',
    '친구와 여행',
    'word',
    '''Adventure''는 모험을 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-B-2',
    'We''re sharing an _____.',
    'office',
    'apartment',
    'classroom',
    'B',
    '여행',
    '친구와 여행',
    'word',
    '''Apartment''는 아파트를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-B-3',
    'The group enjoys _____ sports.',
    'work',
    'boring',
    'extreme',
    'C',
    '여행',
    '친구와 여행',
    'word',
    '''Extreme''은 익스트림의를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-B-4',
    'We made a _____ together.',
    'memory',
    'mistake',
    'business',
    'A',
    '여행',
    '친구와 여행',
    'word',
    '''Memory''는 추억을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-B-5',
    'The _____ brought us closer.',
    'experience',
    'meeting',
    'work',
    'A',
    '여행',
    '친구와 여행',
    'word',
    '''Experience''는 경험을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-B-6',
    'The _____ was amazing.',
    'work',
    'adventure',
    'meeting',
    'B',
    '여행',
    '친구와 여행',
    'word',
    '''Adventure''는 모험을 의미입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-B-7',
    'We''re sharing an _____.',
    'classroom',
    'office',
    'apartment',
    'C',
    '여행',
    '친구와 여행',
    'word',
    '''Apartment''는 아파트를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-B-8',
    'The group enjoys _____ sports.',
    'boring',
    'work',
    'extreme',
    'C',
    '여행',
    '친구와 여행',
    'word',
    '''Extreme''은 익스트림의를 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-B-9',
    'We made a _____ together.',
    'business',
    'mistake',
    'memory',
    'C',
    '여행',
    '친구와 여행',
    'word',
    '''Memory''는 추억을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-B-10',
    'The _____ brought us closer.',
    'experience',
    'meeting',
    'work',
    'A',
    '여행',
    '친구와 여행',
    'word',
    '''Experience''는 경험을 의미합니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-A-1',
    'My _____ are coming with me.',
    'parents',
    'enemies',
    'friends',
    'C',
    '여행',
    '친구와 여행',
    'word',
    '''Friends''는 친구들을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-A-2',
    'We''re going to a _____.',
    'meeting',
    'work',
    'concert',
    'C',
    '여행',
    '친구와 여행',
    'word',
    '''Concert''는 콘서트를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-A-3',
    'Let''s try the local _____.',
    'food',
    'homework',
    'work',
    'A',
    '여행',
    '친구와 여행',
    'word',
    '''Food''는 음식을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-A-4',
    'The _____ is very lively.',
    'club',
    'office',
    'library',
    'A',
    '여행',
    '친구와 여행',
    'word',
    '''Club''은 클럽을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-A-5',
    'We need to buy _____.',
    'homework',
    'work',
    'souvenirs',
    'C',
    '여행',
    '친구와 여행',
    'word',
    '''Souvenirs''는 기념품을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-A-6',
    'My _____ are coming with me.',
    'friends',
    'parents',
    'enemies',
    'A',
    '여행',
    '친구와 여행',
    'word',
    '''Friends''는 친구들을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-A-7',
    'We''re going to a _____.',
    'work',
    'concert',
    'meeting',
    'B',
    '여행',
    '친구와 여행',
    'word',
    '''Concert''는 콘서트를 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-A-8',
    'Let''s try the local _____.',
    'food',
    'homework',
    'work',
    'A',
    '여행',
    '친구와 여행',
    'word',
    '''Food''는 음식을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-A-9',
    'The _____ is very lively.',
    'office',
    'club',
    'library',
    'B',
    '여행',
    '친구와 여행',
    'word',
    '''Club''은 클럽을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-word-A-10',
    'We need to buy _____.',
    'work',
    'homework',
    'souvenirs',
    'C',
    '여행',
    '친구와 여행',
    'word',
    '''Souvenirs''는 기념품을 의미합니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-conversation-C-1',
    'Travel insurance agent: ''Given your group''s planned adventure activities, I recommend comprehensive policies that include medical evacuation and activity-specific coverage.''',
    'Thank you for the detailed recommendation. Travel safety is definitely a priority for our group. Let me propose we each research the coverage options you''ve outlined, and then discuss how to ensure everyone has appropriate protection within their budget.',
    'We''ll each just handle our own insurance decisions individually.',
    'Insurance seems pretty expensive for what''s supposed to be a short trip.',
    'A',
    '여행',
    '친구와 여행',
    'conversation',
    '보험 에이전트의 전문적 조언에 감사하며 그룹 안전을 우선시한다는 입장을 명확히 하고, 개인별 예산 상황을 존중하면서도 적절한 보장을 위한 협력적 해결책을 제시하는 것이 성숙한 그룹 여행 조율자의 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-conversation-C-2',
    'Cultural expert: ''Your diverse group represents interesting cross-cultural dynamics. How do you navigate different travel styles and decision-making processes while maintaining group cohesion?''',
    'That''s a very perceptive observation about group dynamics. We''ve found that open communication about expectations, rotating leadership for different activities based on individual interests and expertise, and building in flexibility for both group and individual experiences helps us honor everyone''s travel personality while creating shared meaningful memories.',
    'We just try to get along and have fun together.',
    'Everyone learns to adapt when you''re traveling in a group.',
    'A',
    '여행',
    '친구와 여행',
    'conversation',
    '문화 전문가의 그룹 역학에 대한 통찰력 있는 관찰에 대해 인정하며, 기대치 소통, 순환 리더십, 개인과 그룹 경험의 균형 등 구체적이고 성숙한 그룹 관리 전략을 설명하여 다문화적 여행 경험에 대한 깊이 있는 성찰을 보여주는 것이 사회적 통찰력 있는 대응입니다.',
    3
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-conversation-B-1',
    'Friend: ''I''m feeling really tired from all the walking today. Can we plan something more relaxed for tomorrow?''',
    'Of course! Let''s plan a more leisurely day tomorrow. Maybe we can find a nice café and do some gentle sightseeing, or just rest by the pool.',
    'But we''re here to see everything, so we shouldn''t waste time.',
    'You can rest while the rest of us continue exploring.',
    'A',
    '여행',
    '친구와 여행',
    'conversation',
    '친구의 피로를 이해하고 함께 편안한 일정을 계획하자고 제안하는 것이 배려 깊은 여행 동반자의 모습입니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-conversation-B-2',
    'Local guide: ''Your group seems interested in adventure activities. However, weather conditions tomorrow might not be ideal for hiking.''',
    'Thanks for the weather update. Let me check with my friends about their preferences. Some might want to wait for better hiking conditions, while others might prefer indoor alternatives. Could you give us a few minutes to discuss?',
    'We''ll do whatever you think is the best option.',
    'Bad weather doesn''t really bother us that much.',
    'A',
    '여행',
    '친구와 여행',
    'conversation',
    '날씨 정보에 감사하고 그룹 내 다양한 선호도를 인정하며 모든 친구들과 상의할 시간을 요청하는 것이 민주적이고 포용적인 그룹 리더십을 보여줍니다.',
    2
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-conversation-A-1',
    'Friend: ''What should we do for dinner tonight?''',
    'How about we try that local restaurant we saw earlier? Or we could explore the night market if you prefer.',
    'I don''t really care what we do tonight.',
    'You can decide since I picked yesterday.',
    'A',
    '여행',
    '친구와 여행',
    'conversation',
    '구체적인 제안을 하면서 선택권을 제공하는 것이 좋은 여행 동반자의 자세입니다.',
    1
);

INSERT IGNORE INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level
) VALUES (
    'travel-trip-with-friends-conversation-A-2',
    'Hotel staff: ''Your group has reserved two rooms. Here are all your room keys.''',
    'Thank you very much. Could you tell us about the hotel amenities and what time breakfast is served?',
    'Thanks for the keys. That''s all we need.',
    'Where exactly are these rooms located in the building?',
    'A',
    '여행',
    '친구와 여행',
    'conversation',
    '감사 인사와 함께 유용한 정보를 문의하는 것이 적절합니다.',
    1
);

