package com.problemservice.ProblemService.util;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 카테고리 표준화 유틸리티
 * - 한국어/영어 입력을 DB 저장 형식(한글)으로 정규화
 * - DB에 한글로 저장되어 있으므로 영문 입력을 한글로 변환
 */
public final class CategoryMapper {

    private static final Map<String, String> KO_TO_EN;
    private static final Map<String, String> EN_TO_KO;

    static {
        Map<String, String> koToEn = new HashMap<>();
        koToEn.put("학업", "school");
        koToEn.put("비즈니스", "business");
        koToEn.put("여행", "travel");
        koToEn.put("일상생활", "daily");
        KO_TO_EN = Collections.unmodifiableMap(koToEn);
        
        // 역방향 매핑 (영문 → 한글)
        Map<String, String> enToKo = new HashMap<>();
        enToKo.put("school", "학업");
        enToKo.put("business", "비즈니스");
        enToKo.put("travel", "여행");
        enToKo.put("daily", "일상생활");
        EN_TO_KO = Collections.unmodifiableMap(enToKo);
    }

    private CategoryMapper() {}

    /**
     * 입력을 DB 저장 형식(한글)으로 변환
     * - 영문 입력 → 한글 변환
     * - 한글 입력 → 그대로 반환
     */
    public static String toDbCategory(String input) {
        if (input == null) return null;
        String trimmed = input.trim();
        if (trimmed.isEmpty()) return trimmed;

        // 영문을 한글로 변환 (DB에 한글로 저장되어 있음)
        String lowerInput = trimmed.toLowerCase(Locale.ROOT);
        String mapped = EN_TO_KO.get(lowerInput);
        if (mapped != null) return mapped;

        // 이미 한글인 경우 그대로 반환
        return trimmed;
    }

    public static List<String> toDbCategories(List<String> categories) {
        if (categories == null) return List.of();
        return categories.stream()
                .filter(Objects::nonNull)
                .map(CategoryMapper::toDbCategory)
                .filter(s -> s != null && !s.isBlank())
                .distinct()
                .collect(Collectors.toList());
    }
}


