package com.problemservice.ProblemService.util;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 카테고리 표준화 유틸리티
 * - 한국어/영어 입력을 DB 저장 형식(영문 소문자)으로 정규화
 */
public final class CategoryMapper {

    private static final Map<String, String> KO_TO_EN;

    static {
        Map<String, String> map = new HashMap<>();
        map.put("학업", "school");
        map.put("비즈니스", "business");
        map.put("여행", "travel");
        map.put("일상생활", "daily");
        KO_TO_EN = Collections.unmodifiableMap(map);
    }

    private CategoryMapper() {}

    public static String toDbCategory(String input) {
        if (input == null) return null;
        String trimmed = input.trim();
        if (trimmed.isEmpty()) return trimmed;

        // 한국어 매핑 우선
        String mapped = KO_TO_EN.get(trimmed);
        if (mapped != null) return mapped;

        // 이미 영문인 경우 소문자로 통일
        return trimmed.toLowerCase(Locale.ROOT);
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


