package com.problemservice.ProblemService.Integration;

import com.problemservice.ProblemService.util.CategoryMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class CategoryMapperTest {

    @Test
    @DisplayName("한국어 카테고리 매핑: 학업/비즈니스/여행/일상생활")
    void koToEnMapping() {
        assertThat(CategoryMapper.toDbCategory("학업")).isEqualTo("school");
        assertThat(CategoryMapper.toDbCategory("비즈니스")).isEqualTo("business");
        assertThat(CategoryMapper.toDbCategory("여행")).isEqualTo("travel");
        assertThat(CategoryMapper.toDbCategory("일상생활")).isEqualTo("daily");
    }

    @Test
    @DisplayName("이미 영문 카테고리는 소문자 통일")
    void englishLowercase() {
        assertThat(CategoryMapper.toDbCategory("Business")).isEqualTo("business");
        assertThat(CategoryMapper.toDbCategory("TRAVEL")).isEqualTo("travel");
    }
}


