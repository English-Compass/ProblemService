package com.problemservice.ProblemService.model.enums;

/**
 * 문제 난이도를 나타내는 열거형
 * A (초급), B (중급), C (고급) 세 단계로 구성
 */
public enum Difficulty {
    
    /**
     * 초급 난이도 (Beginner)
     * 난이도 레벨 1에 해당
     */
    A(1),
    
    /**
     * 중급 난이도 (Intermediate)
     * 난이도 레벨 2에 해당
     */
    B(2),
    
    /**
     * 고급 난이도 (Advanced)
     * 난이도 레벨 3에 해당
     */
    C(3);
    
    private final int level;
    
    Difficulty(int level) {
        this.level = level;
    }
    
    public int getLevel() {
        return level;
    }
    
    /**
     * 레벨 번호로부터 Difficulty enum을 가져오는 정적 메서드
     * @param level 난이도 레벨 (1, 2, 3)
     * @return 해당하는 Difficulty enum
     */
    public static Difficulty fromLevel(int level) {
        switch (level) {
            case 1: return A;
            case 2: return B;
            case 3: return C;
            default: throw new IllegalArgumentException("Invalid difficulty level: " + level);
        }
    }
}