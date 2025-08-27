package com.problemservice.ProblemService.model.dto;

import com.problemservice.ProblemService.model.enums.Difficulty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 난이도 전략을 나타내는 클래스
 * 사용자 설정과 분석 데이터를 결합한 문제 난이도 배분 전략
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DifficultyStrategy {
    
    /**
     * 주 난이도 설정
     */
    private Difficulty primaryDifficulty;
    
    /**
     * 쉬운 난이도 비율 (0.0 - 1.0)
     */
    private double easyRatio;
    
    /**
     * 중간 난이도 비율 (0.0 - 1.0)
     */
    private double mediumRatio;
    
    /**
     * 어려운 난이도 비율 (0.0 - 1.0)
     */
    private double hardRatio;
    
    /**
     * 정적 팩토리 메서드 - 비율만으로 전략 생성
     * @param easy 쉬운 난이도 비율
     * @param medium 중간 난이도 비율
     * @param hard 어려운 난이도 비율
     * @return DifficultyStrategy 객체
     */
    public static DifficultyStrategy of(double easy, double medium, double hard) {
        return DifficultyStrategy.builder()
                .easyRatio(easy)
                .mediumRatio(medium)
                .hardRatio(hard)
                .build();
    }
    
    /**
     * 비율의 합계가 1.0인지 검증
     * @return 비율의 합계가 유효한지 여부
     */
    public boolean isValidRatios() {
        double sum = easyRatio + mediumRatio + hardRatio;
        return Math.abs(sum - 1.0) < 0.001; // 부동소수점 오차 고려
    }
}