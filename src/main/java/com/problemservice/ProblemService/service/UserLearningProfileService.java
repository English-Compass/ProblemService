package com.problemservice.ProblemService.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.problemservice.ProblemService.model.dto.QuestionTypePerformance;
import com.problemservice.ProblemService.model.entity.QuestionAnswer;
import com.problemservice.ProblemService.model.entity.UserLearningProfile;
import com.problemservice.ProblemService.repository.QuestionAnswerRepository;
import com.problemservice.ProblemService.repository.UserLearningProfileRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserLearningProfileService {

    private final UserLearningProfileRepository profileRepository;
    private final QuestionAnswerRepository answerRepository;
    private final ObjectMapper objectMapper;

    @Transactional
    public void updateUserProfile(String userId) {
        log.info("Updating user learning profile for userId: {}", userId);

        List<QuestionAnswer> allAnswers = answerRepository.findAllByUserId(userId);
        if (allAnswers.isEmpty()) {
            log.warn("No answers found for userId: {}. Profile not updated.", userId);
            return;
        }

        int totalAnswered = allAnswers.size();
        long totalCorrect = allAnswers.stream().filter(QuestionAnswer::getIsCorrect).count();
        double overallAccuracy = (double) totalCorrect / totalAnswered;

        Map<String, Map<String, Integer>> categoryPerformance = calculateCategoryPerformance(allAnswers);

        UserLearningProfile profile = profileRepository.findByUserId(userId)
                .orElse(UserLearningProfile.builder().userId(userId).build());

        profile.setTotalQuestionsAnswered(totalAnswered);
        profile.setTotalCorrectAnswers((int) totalCorrect);
        profile.setOverallAccuracy(overallAccuracy);

        try {
            profile.setCategoryPerformance(objectMapper.writeValueAsString(categoryPerformance));
        } catch (IOException e) {
            log.error("Error serializing category performance for userId: {}", userId, e);
            // Handle exception, maybe throw a custom exception
        }

        profileRepository.save(profile);
        log.info("Successfully updated user learning profile for userId: {}", userId);
    }

    private Map<String, Map<String, Integer>> calculateCategoryPerformance(List<QuestionAnswer> answers) {
        return answers.stream()
                .filter(answer -> answer.getQuestion() != null && answer.getQuestion().getMajorCategory() != null)
                .collect(Collectors.groupingBy(
                        answer -> answer.getQuestion().getMajorCategory(),
                        Collectors.collectingAndThen(
                                Collectors.toList(),
                                list -> {
                                    int total = list.size();
                                    long correct = list.stream().filter(QuestionAnswer::getIsCorrect).count();
                                    Map<String, Integer> performance = new HashMap<>();
                                    performance.put("total", total);
                                    performance.put("correct", (int) correct);
                                    return performance;
                                }
                        )
                ));
    }
}
