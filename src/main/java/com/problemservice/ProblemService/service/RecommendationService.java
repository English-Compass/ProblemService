package com.problemservice.ProblemService.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.problemservice.ProblemService.model.dto.QuestionTypePerformance;
import com.problemservice.ProblemService.model.entity.UserLearningProfile;
import com.problemservice.ProblemService.repository.UserLearningProfileRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class RecommendationService {

    private final UserLearningProfileRepository profileRepository;
    private final ObjectMapper objectMapper;

    public List<String> recommendWeakestCategories(String userId) {
        UserLearningProfile profile = profileRepository.findByUserId(userId).orElse(null);
        if (profile == null || profile.getCategoryPerformance() == null) {
            log.warn("No learning profile found for user: {}. Cannot generate recommendations.", userId);
            return Collections.emptyList();
        }

        try {
            Map<String, Map<String, Integer>> performanceMap = objectMapper.readValue(
                profile.getCategoryPerformance(),
                new TypeReference<Map<String, Map<String, Integer>>>() {}
            );

            return performanceMap.entrySet().stream()
                    .sorted(Comparator.comparingDouble(entry -> {
                        Map<String, Integer> performance = entry.getValue();
                        int total = performance.getOrDefault("total", 0);
                        int correct = performance.getOrDefault("correct", 0);
                        return total > 0 ? (double) correct / total : 0.0;
                    }))
                    .map(Map.Entry::getKey)
                    .collect(Collectors.toList());

        } catch (IOException e) {
            log.error("Error deserializing category performance for recommendation, userId: {}", userId, e);
            return Collections.emptyList();
        }
    }
}
