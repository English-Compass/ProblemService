-- =====================================================
-- Business Quiz Data Insert Statements
-- Generated from 27 JSON files
-- Total Questions: 102
-- =====================================================

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_customer_service_conversation_A_001',
    'Customer: ''I have a problem with my order.''',
    'I''m sorry to hear that. Let me help you with your order right away.',
    'That''s not my problem to solve.',
    'All orders are final and cannot be changed.',
    'A',
    'business',
    'customer_service',
    'CONVERSATION',
    '고객의 문제에 공감하고 즉시 도움을 제공하는 것이 좋은 고객 서비스입니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_customer_service_conversation_A_002',
    'Customer: ''Can you give me a discount on this item?''',
    'Let me check what discounts are available for you.',
    'We don''t offer any discounts here.',
    'Why do you think you deserve a discount?',
    'A',
    'business',
    'customer_service',
    'CONVERSATION',
    '고객의 할인 요청에 대해 적극적으로 확인해보겠다는 자세가 중요합니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_customer_service_conversation_B_001',
    'Customer: ''I''ve been waiting for 30 minutes and nobody has helped me yet.''',
    'I sincerely apologize for the wait. Let me personally assist you right now.',
    'Everyone is really busy today, so please be patient.',
    'You should have made an appointment if you wanted faster service.',
    'A',
    'business',
    'customer_service',
    'CONVERSATION',
    '장시간 대기에 대해 진심으로 사과하고 즉시 개인적인 도움을 제공하는 것이 적절한 대응입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_customer_service_conversation_B_002',
    'Customer: ''Your competitor offers the same service for half the price.''',
    'I understand price is important. Let me explain the additional value we provide.',
    'Then you should go to our competitor instead.',
    'Our prices are set and cannot be negotiated.',
    'A',
    'business',
    'customer_service',
    'CONVERSATION',
    '가격에 대한 고객의 우려를 이해하고 회사가 제공하는 부가가치를 설명하는 것이 좋습니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_customer_service_conversation_C_001',
    'Corporate client: ''We''re considering terminating our partnership due to recent service disruptions.''',
    'I completely understand your concerns. Let me schedule an urgent meeting with our senior team to address these issues comprehensively.',
    'Contract termination requires 30 days written notice as per our agreement.',
    'Service disruptions are temporary and will resolve themselves soon.',
    'A',
    'business',
    'customer_service',
    'CONVERSATION',
    '기업 고객의 계약 해지 고려에 대해 우려를 완전히 이해한다는 표현과 함께 고위 팀과의 긴급 미팅을 제안하는 것이 적절합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_customer_service_conversation_C_002',
    'Executive: ''I want to discuss implementing a strategic partnership program with your organization.''',
    'Absolutely. Let me connect you with our partnership development director who specializes in strategic alliances.',
    'The manager is currently unavailable for such discussions.',
    'I can handle all partnership discussions myself without involving others.',
    'A',
    'business',
    'customer_service',
    'CONVERSATION',
    '전략적 파트너십과 같은 고급 비즈니스 문의는 해당 전문가에게 연결해주는 것이 가장 적절합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_customer_service_sentence_A_001',
    'I''ll *put you through* to the manager.',
    'connect you with',
    'go with you to',
    'call for you',
    'A',
    'business',
    'customer_service',
    'SENTENCE',
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
    'business_customer_service_sentence_A_002',
    'Is there *anything else* I can help you with?',
    'do you need more help',
    'is that all',
    'can I go now',
    'A',
    'business',
    'customer_service',
    'SENTENCE',
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
    'business_customer_service_sentence_B_001',
    'We will *look into* this matter right away.',
    'investigate',
    'ignore',
    'delay',
    'A',
    'business',
    'customer_service',
    'SENTENCE',
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
    'business_customer_service_sentence_B_002',
    'I''m afraid that''s *against our policy*.',
    'not allowed by our rules',
    'a good idea',
    'possible',
    'A',
    'business',
    'customer_service',
    'SENTENCE',
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
    'business_customer_service_sentence_C_001',
    'We will do our *utmost* to resolve this issue.',
    'best',
    'part',
    'bit',
    'A',
    'business',
    'customer_service',
    'SENTENCE',
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
    'business_customer_service_sentence_C_002',
    'We need to *compensate* the customer for the error.',
    'pay back',
    'apologize to',
    'thank',
    'A',
    'business',
    'customer_service',
    'SENTENCE',
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
    'business_customer_service_word_A_001',
    'How can I ____ you today?',
    'help',
    'do',
    'make',
    'A',
    'business',
    'customer_service',
    'WORD',
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
    'business_customer_service_word_A_002',
    'I''m sorry for the ____.',
    'inconvenience',
    'problem',
    'issue',
    'A',
    'business',
    'customer_service',
    'WORD',
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
    'business_customer_service_word_B_001',
    'We will ____ the issue as soon as possible.',
    'investigate',
    'ignore',
    'forget',
    'A',
    'business',
    'customer_service',
    'WORD',
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
    'business_customer_service_word_B_002',
    'We offer a full ____ if you are not satisfied.',
    'refund',
    'discount',
    'exchange',
    'A',
    'business',
    'customer_service',
    'WORD',
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
    'business_customer_service_word_C_001',
    'We are committed to ____ our customers'' expectations.',
    'exceeding',
    'meeting',
    'matching',
    'A',
    'business',
    'customer_service',
    'WORD',
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
    'business_customer_service_word_C_002',
    'Thank you for your ____.',
    'patience',
    'time',
    'effort',
    'A',
    'business',
    'customer_service',
    'WORD',
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
    'business_email_report_conversation_A_001',
    'Colleague: ''Did you send the weekly report to the manager yet?''',
    'Yes, I sent it this morning. You should find it in your inbox.',
    'I completely forgot about it.',
    'I thought reports were due next week.',
    'A',
    'business',
    'email_report',
    'CONVERSATION',
    '보고서 발송 여부를 명확히 확인해주고 위치를 알려주는 것이 좋습니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_email_report_conversation_A_002',
    'Manager: ''Can you include the latest sales figures in tomorrow''s report?''',
    'Absolutely. I''ll include the most recent sales data in the next section.',
    'I don''t have access to sales information.',
    'Sales figures are confidential and can''t be shared.',
    'A',
    'business',
    'email_report',
    'CONVERSATION',
    '상사의 요청에 적극적으로 응답하고 구체적인 실행 계획을 제시하는 것이 좋습니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_email_report_conversation_B_001',
    'Client: ''The data in your quarterly report doesn''t match our internal records.''',
    'Thank you for pointing that out. Let me review the discrepancy and provide you with a corrected version by end of day.',
    'Our data is always accurate, so your records must be wrong.',
    'You must be misreading the information in the report.',
    'A',
    'business',
    'email_report',
    'CONVERSATION',
    '데이터 불일치 지적에 감사를 표하고 검토 후 수정된 버전을 제공하겠다는 구체적인 해결책을 제시합니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_email_report_conversation_B_002',
    'Team member: ''I urgently need the financial analysis for tomorrow''s board presentation.''',
    'I''ll prioritize the financial analysis and have it ready first thing tomorrow morning.',
    'That''s very short notice for such an important request.',
    'You should ask someone else who''s less busy.',
    'A',
    'business',
    'email_report',
    'CONVERSATION',
    '급한 요청에 대해 우선순위를 두고 구체적인 완성 시간을 약속하는 것이 전문적인 대응입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_email_report_conversation_C_001',
    'CEO: ''Your performance analysis shows significant deviation from projected targets. Can you elaborate on the underlying factors?''',
    'Certainly. The deviation stems from three primary factors: market volatility, seasonal adjustments, and our product launch impact. I can provide detailed breakdowns for each.',
    'The numbers in the report speak for themselves.',
    'It''s just normal quarterly fluctuation, nothing to worry about.',
    'A',
    'business',
    'email_report',
    'CONVERSATION',
    'CEO의 질문에 대해 구체적인 요인들을 체계적으로 나열하고 상세 분석을 제공하겠다는 전문적인 답변이 적절합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_email_report_conversation_C_002',
    'Board member: ''How do you validate the predictive models used in your strategic forecast reports?''',
    'We employ cross-validation techniques, backtesting against historical data, and peer review processes to ensure model accuracy and statistical reliability.',
    'We use standard industry practices for all our modeling work.',
    'Our IT department handles all the technical validation aspects.',
    'A',
    'business',
    'email_report',
    'CONVERSATION',
    '예측 모델 검증에 대한 기술적 질문에는 구체적인 검증 방법론들을 전문적으로 설명하는 것이 적절합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_email_report_sentence_A_001',
    'I look forward to *hearing from you* soon.',
    'receiving your reply',
    'meeting you',
    'calling you',
    'A',
    'business',
    'email_report',
    'SENTENCE',
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
    'business_email_report_sentence_A_002',
    'Best *regards*,',
    'sincerely',
    'thank you',
    'goodbye',
    'A',
    'business',
    'email_report',
    'SENTENCE',
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
    'business_email_report_sentence_B_001',
    'For *your reference*, I have attached the previous report.',
    'to help you understand',
    'for you to read',
    'because you asked',
    'A',
    'business',
    'email_report',
    'SENTENCE',
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
    'business_email_report_sentence_B_002',
    'Please do not *hesitate* to contact me.',
    'feel free to',
    'be afraid to',
    'forget to',
    'A',
    'business',
    'email_report',
    'SENTENCE',
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
    'business_email_report_sentence_C_001',
    'This is a *gentle reminder* about the deadline.',
    'polite way to remind you',
    'strict warning',
    'final notice',
    'A',
    'business',
    'email_report',
    'SENTENCE',
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
    'business_email_report_sentence_C_002',
    'The data is *preliminary* and subject to change.',
    'not final',
    'accurate',
    'confidential',
    'A',
    'business',
    'email_report',
    'SENTENCE',
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
    'business_email_report_word_A_001',
    'Please find the ____ document.',
    'attached',
    'included',
    'added',
    'A',
    'business',
    'email_report',
    'WORD',
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
    'business_email_report_word_A_002',
    'I am writing to ____ about the project.',
    'inquire',
    'ask',
    'tell',
    'A',
    'business',
    'email_report',
    'WORD',
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
    'business_email_report_word_B_001',
    'Could you please provide me with an ____?',
    'update',
    'information',
    'news',
    'A',
    'business',
    'email_report',
    'WORD',
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
    'business_email_report_word_B_002',
    'Please ____ that you have received this email.',
    'confirm',
    'say',
    'check',
    'A',
    'business',
    'email_report',
    'WORD',
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
    'business_email_report_word_C_001',
    'The report ____ the key findings of our research.',
    'summarizes',
    'tells',
    'gives',
    'A',
    'business',
    'email_report',
    'WORD',
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
    'business_email_report_word_C_002',
    'We need to ____ the data before making a decision.',
    'analyze',
    'see',
    'look',
    'A',
    'business',
    'email_report',
    'WORD',
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
    'business_meeting_conference_conversation_A_001',
    'Colleague: ''What time does today''s team meeting start?''',
    'The meeting starts at 2 PM in conference room B.',
    'You should check the calendar yourself.',
    'I''m not sure about the exact time.',
    'A',
    'business',
    'meeting_conference',
    'CONVERSATION',
    '회의 시간과 장소를 명확하게 알려주는 것이 도움이 됩니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_meeting_conference_conversation_A_002',
    'Manager: ''Could you take notes during today''s client presentation?''',
    'Of course. I''ll take detailed notes and share them with the team afterwards.',
    'I don''t really like taking notes during meetings.',
    'Someone else should be responsible for that.',
    'A',
    'business',
    'meeting_conference',
    'CONVERSATION',
    '회의 기록 요청에 적극적으로 응답하고 팀 공유까지 언급하는 것이 좋습니다.',
    1,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_meeting_conference_conversation_B_001',
    'Team member: ''I disagree with the proposed timeline. It seems too aggressive for our resources.''',
    'That''s a valid concern. Let''s break down the timeline and discuss which phases might need more realistic timeframes.',
    'We need to stick to the timeline regardless of concerns.',
    'Disagreements like this just slow down our progress.',
    'A',
    'business',
    'meeting_conference',
    'CONVERSATION',
    '다른 의견을 타당한 우려로 인정하고 구체적인 해결 방안을 제시하여 건설적인 토론을 이끄는 것이 좋습니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_meeting_conference_conversation_B_002',
    'Client: ''We need to reschedule next week''s conference call due to an unexpected emergency.''',
    'I understand completely. Let me coordinate with all participants to find an alternative time that works for everyone.',
    'This kind of last-minute change is really inconvenient for us.',
    'Emergency rescheduling seems to happen too frequently.',
    'A',
    'business',
    'meeting_conference',
    'CONVERSATION',
    '긴급상황으로 인한 일정 변경에 이해를 표하고 모든 참가자를 위한 대안을 찾겠다는 적극적인 자세가 전문적입니다.',
    2,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_meeting_conference_conversation_C_001',
    'Board member: ''How do we address the strategic misalignment between our European and Asian operations discussed in today''s session?''',
    'I recommend establishing a cross-regional task force with senior representatives from both operations to identify synergies and develop a unified strategic framework within the next quarter.',
    'That''s a very complex issue that will take time to resolve.',
    'The regional offices should work together to figure it out themselves.',
    'A',
    'business',
    'meeting_conference',
    'CONVERSATION',
    '전략적 불일치 문제에 대해 구체적이고 실행 가능한 해결책을 제시하고 명확한 타임라인을 포함하는 것이 임원급 대응입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_meeting_conference_conversation_C_002',
    'Stakeholder: ''Given current market volatility, shouldn''t we postpone the digital transformation initiative we discussed?''',
    'While market volatility presents challenges, digital transformation will actually strengthen our resilience. I suggest we proceed with a phased approach to manage risks while capturing competitive advantages.',
    'Market volatility definitely affects all our business initiatives.',
    'We should probably wait for more stable economic conditions.',
    'A',
    'business',
    'meeting_conference',
    'CONVERSATION',
    '시장 불안정성을 인정하면서도 디지털 전환의 전략적 가치를 강조하고 위험 관리와 경쟁 우위 확보를 동시에 고려한 단계적 접근법을 제시하는 것이 전략적 대응입니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

INSERT INTO question (
    question_id, question_text, option_a, option_b, option_c, 
    correct_answer, major_category, minor_category, question_type, 
    explanation, difficulty_level, created_at, updated_at
) VALUES (
    'business_meeting_conference_sentence_A_001',
    'Let''s *go over* the main points.',
    'review',
    'skip',
    'discuss',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_A_002',
    'Can you *take notes* during the meeting?',
    'write down what is said',
    'speak in the meeting',
    'leave the meeting',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_A_003',
    'Please *speak up* if you have questions.',
    'talk louder',
    'be quiet',
    'leave',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_A_004',
    'Let''s *move on* to the next topic.',
    'continue to',
    'return to',
    'stop at',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_A_005',
    'Can you *fill me in* on the details?',
    'tell me about',
    'leave me out',
    'forget about',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_A_006',
    'We need to *work out* the problems.',
    'solve',
    'create',
    'ignore',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_A_007',
    'Please *hold on* for a moment.',
    'wait',
    'continue',
    'leave',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_A_008',
    'Let''s *wrap up* the meeting.',
    'finish',
    'start',
    'continue',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_A_009',
    'Can you *bring up* that issue?',
    'mention',
    'forget',
    'hide',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_A_010',
    'We should *look into* this matter.',
    'investigate',
    'ignore',
    'forget',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_B_001',
    'We are running out of time, so let''s *wrap up*.',
    'finish',
    'start',
    'delay',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_B_002',
    'I''ll *get back to you* on that.',
    'respond to you later',
    'forget about it',
    'agree with you',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_B_003',
    'Let''s *touch base* next week.',
    'check in with each other',
    'avoid each other',
    'compete',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_B_004',
    'We need to *iron out* the details.',
    'resolve',
    'complicate',
    'ignore',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_B_005',
    'Please *keep me posted* on the progress.',
    'inform me regularly',
    'leave me alone',
    'hide from me',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_B_006',
    'Let''s *put this on hold* for now.',
    'postpone',
    'accelerate',
    'complete',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_B_007',
    'We should *think it through* carefully.',
    'consider thoroughly',
    'decide quickly',
    'ignore completely',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_B_008',
    'Can you *break down* the costs?',
    'analyze in detail',
    'combine together',
    'hide completely',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_B_009',
    'Let''s *nail down* the specifics.',
    'finalize',
    'avoid',
    'postpone',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_B_010',
    'We need to *step up* our efforts.',
    'increase',
    'decrease',
    'stop',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_C_001',
    'Let''s *table this discussion* for now.',
    'postpone the discussion',
    'end the discussion',
    'start the discussion',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_C_002',
    'We need to *think outside the box* for a solution.',
    'think creatively',
    'think carefully',
    'think logically',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_C_003',
    'This initiative will *break new ground*.',
    'pioneer something innovative',
    'repeat old methods',
    'abandon the project',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_C_004',
    'We must *leverage our core competencies*.',
    'utilize our main strengths',
    'ignore our abilities',
    'hide our skills',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_C_005',
    'Let''s *drill down* into the metrics.',
    'examine in great detail',
    'ignore completely',
    'summarize briefly',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_C_006',
    'We need to *synergize our efforts* across departments.',
    'coordinate collaboratively',
    'work independently',
    'compete internally',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_C_007',
    'This strategy will *differentiate us* in the market.',
    'make us unique',
    'make us similar',
    'make us invisible',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_C_008',
    'Let''s *operationalize* these concepts.',
    'implement practically',
    'theorize abstractly',
    'ignore completely',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_C_009',
    'We should *benchmark* against industry leaders.',
    'compare with',
    'ignore',
    'compete against',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_sentence_C_010',
    'This will *streamline* our processes.',
    'make more efficient',
    'make more complex',
    'eliminate completely',
    'A',
    'business',
    'meeting_conference',
    'SENTENCE',
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
    'business_meeting_conference_word_A_001',
    'Can we ____ a time for the meeting?',
    'set',
    'put',
    'do',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_A_002',
    'Please send me the ____ before the meeting.',
    'agenda',
    'menu',
    'map',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_A_003',
    'The meeting will ____ at 2 PM.',
    'start',
    'stop',
    'pause',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_A_004',
    'Please ____ the presentation.',
    'prepare',
    'eat',
    'buy',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_A_005',
    'We need to ____ the schedule.',
    'check',
    'cook',
    'clean',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_A_006',
    'Let''s ____ the main points.',
    'discuss',
    'dance',
    'drive',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_A_007',
    'The ____ is very important.',
    'meeting',
    'movie',
    'music',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_A_008',
    'Please ____ on time.',
    'arrive',
    'sleep',
    'eat',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_A_009',
    'We will ____ the decision tomorrow.',
    'make',
    'take',
    'give',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_A_010',
    'The ____ room is ready.',
    'conference',
    'kitchen',
    'bedroom',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_B_001',
    'We need to ____ on the key decisions.',
    'follow up',
    'fall behind',
    'drop out',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_B_002',
    'Let''s try to ____ the deadline.',
    'meet',
    'see',
    'go',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_B_003',
    'The project requires careful ____.',
    'planning',
    'cooking',
    'sleeping',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_B_004',
    'We should ____ the budget first.',
    'review',
    'ignore',
    'forget',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_B_005',
    'The team needs to ____ effectively.',
    'collaborate',
    'compete',
    'complain',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_B_006',
    'Let''s ____ the presentation format.',
    'standardize',
    'randomize',
    'memorize',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_B_007',
    'We must ____ our objectives clearly.',
    'define',
    'ignore',
    'forget',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_B_008',
    'The manager will ____ the final decision.',
    'authorize',
    'prevent',
    'delay',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_B_009',
    'Please ____ the meeting minutes.',
    'distribute',
    'hide',
    'destroy',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_B_010',
    'We need to ____ our strategy.',
    'adjust',
    'abandon',
    'ignore',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_C_001',
    'The purpose of this meeting is to ____ a consensus.',
    'reach',
    'make',
    'find',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_C_002',
    'We need to consider the long-term ____ of this decision.',
    'implications',
    'applications',
    'complications',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_C_003',
    'The proposal requires ____ analysis.',
    'comprehensive',
    'simple',
    'quick',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_C_004',
    'We must ____ all stakeholders in this process.',
    'engage',
    'exclude',
    'ignore',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_C_005',
    'The initiative aims to ____ operational efficiency.',
    'optimize',
    'minimize',
    'eliminate',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_C_006',
    'Let''s ____ the strategic objectives.',
    'articulate',
    'obscure',
    'confuse',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_C_007',
    'The framework will ____ sustainable growth.',
    'facilitate',
    'hinder',
    'prevent',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_C_008',
    'We need to ____ market dynamics carefully.',
    'evaluate',
    'ignore',
    'guess',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_C_009',
    'The methodology should be ____.',
    'rigorous',
    'casual',
    'random',
    'A',
    'business',
    'meeting_conference',
    'WORD',
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
    'business_meeting_conference_word_C_010',
    'Let''s ____ the competitive landscape.',
    'assess',
    'ignore',
    'avoid',
    'A',
    'business',
    'meeting_conference',
    'WORD',
    '경쟁 환경을 평가할 때 ''assess''를 사용합니다.',
    3,
    CURRENT_TIMESTAMP(6),
    CURRENT_TIMESTAMP(6)
);

