package com.problemservice.ProblemService.model.enums;

/**
 * 문제 유형을 나타내는 열거형
 * 언어 학습에서 사용되는 세 가지 문제 유형을 정의
 */
public enum QuestionType {
    
    /**
     * 단어 문제 (Word) - 빈칸에 알맞은 단어를 선택하는 문제
     */
    WORD,
    
    /**
     * 문장 문제 (Sentence) - 문장에서 굵게 표시된 부분의 동의어를 선택하는 문제
     */
    SENTENCE,
    
    /**
     * 대화 문제 (Conversation) - 주어진 문장에 대한 적절한 응답을 선택하는 문제
     */
    CONVERSATION
}