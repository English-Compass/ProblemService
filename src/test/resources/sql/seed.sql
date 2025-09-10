INSERT INTO question (question_id,question_text,option_a,option_b,option_c,correct_answer,major_category,minor_category,question_type,explanation,difficulty_level,created_at,updated_at)
VALUES ('test-q-1','Test?','A1','B1','C1','A','business','customer_service','WORD','',1,NOW(6),NOW(6));

INSERT INTO learning_sessions (session_id,user_id,created_at,updated_at,status,session_type,total_questions,answered_questions,correct_answers,wrong_answers,progress_percentage,session_metadata)
VALUES ('test-s-1','u1',NOW(6),NOW(6),'COMPLETED','REVIEW',1,1,0,1,100.0,NULL);

INSERT INTO session_question (session_id,question_id,question_order) VALUES ('test-s-1','test-q-1',1);

INSERT INTO question_answer (session_id,question_id,user_id,session_type,user_answer,is_correct,time_spent,answered_at,solve_count)
VALUES ('test-s-1','test-q-1','u1','REVIEW','B',0,10,NOW(6),1);

-- 다량 더미(카테고리/난이도 다양화)
INSERT INTO question (question_id,question_text,option_a,option_b,option_c,correct_answer,major_category,minor_category,question_type,explanation,difficulty_level,created_at,updated_at) VALUES
('test-q-b-1','B A?','A','B','C','A','business','meeting','WORD','',2,NOW(6),NOW(6)),
('test-q-b-2','B B?','A','B','C','B','business','email','SENTENCE','',2,NOW(6),NOW(6)),
('test-q-b-3','B C?','A','B','C','C','business','customer_service','CONVERSATION','',3,NOW(6),NOW(6)),
('test-q-d-1','D A?','A','B','C','A','daily','shopping_eating_out','WORD','',1,NOW(6),NOW(6)),
('test-q-d-2','D B?','A','B','C','B','daily','using_public_transportation','SENTENCE','',2,NOW(6),NOW(6)),
('test-q-d-3','D C?','A','B','C','C','daily','using_hospital','CONVERSATION','',3,NOW(6),NOW(6)),
('test-q-t-1','T A?','A','B','C','A','travel','family_trip','WORD','',1,NOW(6),NOW(6)),
('test-q-t-2','T B?','A','B','C','B','travel','trip_with_friends','SENTENCE','',2,NOW(6),NOW(6)),
('test-q-t-3','T C?','A','B','C','C','travel','backpacking','CONVERSATION','',3,NOW(6),NOW(6)),
('test-q-s-1','S A?','A','B','C','A','school','attending_class','WORD','',1,NOW(6),NOW(6)),
('test-q-s-2','S B?','A','B','C','B','school','assignment_test_preparation','SENTENCE','',2,NOW(6),NOW(6)),
('test-q-s-3','S C?','A','B','C','C','school','department_conversation','CONVERSATION','',3,NOW(6),NOW(6));

-- 사용자 정답 기록(리뷰 세션용)
INSERT INTO learning_sessions (session_id,user_id,created_at,updated_at,status,session_type,total_questions,answered_questions,correct_answers,wrong_answers,progress_percentage,session_metadata)
VALUES ('test-s-2','u1',NOW(6),NOW(6),'COMPLETED','PRACTICE',1,1,1,0,100.0,NULL);

INSERT INTO session_question (session_id,question_id,question_order) VALUES ('test-s-2','test-q-b-1',1);

INSERT INTO question_answer (session_id,question_id,user_id,session_type,user_answer,is_correct,time_spent,answered_at,solve_count)
VALUES ('test-s-2','test-q-b-1','u1','PRACTICE','A',1,8,NOW(6),1);
