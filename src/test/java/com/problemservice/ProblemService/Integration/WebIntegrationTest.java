package com.problemservice.ProblemService.Integration;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.hamcrest.Matchers.*;

import org.springframework.security.test.context.support.WithMockUser;

@SpringBootTest
@AutoConfigureMockMvc
@WithMockUser(username="test-user", roles={"USER"})
@org.springframework.test.context.ActiveProfiles("test")
class WebIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    @org.springframework.test.context.jdbc.Sql(scripts = "/sql/cleanup.sql", executionPhase = org.springframework.test.context.jdbc.Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @org.springframework.test.context.jdbc.Sql(scripts = "/sql/seed.sql", executionPhase = org.springframework.test.context.jdbc.Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @org.springframework.test.context.jdbc.Sql(scripts = "/sql/cleanup.sql", executionPhase = org.springframework.test.context.jdbc.Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("오답 목록 API - DB 시드 기반 200")
    void wrongQuestionsOk() throws Exception {
        mockMvc.perform(get("/api/quiz/user/{userId}/wrong-questions", "u1"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$[0].id").value("test-q-1"));
    }

    @Test
    @org.springframework.test.context.jdbc.Sql(scripts = "/sql/cleanup.sql", executionPhase = org.springframework.test.context.jdbc.Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @org.springframework.test.context.jdbc.Sql(scripts = "/sql/seed.sql", executionPhase = org.springframework.test.context.jdbc.Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @org.springframework.test.context.jdbc.Sql(scripts = "/sql/cleanup.sql", executionPhase = org.springframework.test.context.jdbc.Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("리뷰 퀴즈 API - 200")
    void reviewQuizOk() throws Exception {
        mockMvc.perform(get("/api/quiz/review").param("userId", "u1"))
            .andExpect(status().isOk());
    }

    @Test
    @org.springframework.test.context.jdbc.Sql(scripts = "/sql/cleanup.sql", executionPhase = org.springframework.test.context.jdbc.Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @org.springframework.test.context.jdbc.Sql(scripts = "/sql/seed.sql", executionPhase = org.springframework.test.context.jdbc.Sql.ExecutionPhase.BEFORE_TEST_METHOD)
    @org.springframework.test.context.jdbc.Sql(scripts = "/sql/cleanup.sql", executionPhase = org.springframework.test.context.jdbc.Sql.ExecutionPhase.AFTER_TEST_METHOD)
    @DisplayName("오답 세션 API - 생성 및 문제 할당 확인")
    void wrongAnswerSessionFlow() throws Exception {
        // 오답 노트 API가 200을 반환하고, 최소 1개 이상 문제를 포함하는지 점검
        mockMvc.perform(get("/api/quiz/wrong-answers").param("userId", "u1"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$", hasSize(greaterThanOrEqualTo(1))));
    }
}


