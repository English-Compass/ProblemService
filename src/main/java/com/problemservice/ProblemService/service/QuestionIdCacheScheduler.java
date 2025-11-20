package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.repository.QuestionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 문제 ID 캐싱 스케줄러
 * 주기적으로 DB에서 문제 ID 목록을 조회하여 Redis에 캐싱
 * 
 * 실행 주기: 10분마다 (600,000ms)
 * DB 부하: 10분에 한 번이므로 전혀 문제없음
 */
@Component
@RequiredArgsConstructor
@Slf4j
@ConditionalOnProperty(name = "app.cache.question-ids.enabled", havingValue = "true", matchIfMissing = true)
public class QuestionIdCacheScheduler {

    private final QuestionRepository questionRepository;
    private final QuestionIdCacheService questionIdCacheService;

    // 대분류 카테고리 목록 (DB에 저장된 한국어 값 사용)
    private static final List<String> MAJOR_CATEGORIES = List.of("학업", "비즈니스", "여행", "일상생활");
    
    // 난이도 레벨 목록
    private static final List<Integer> DIFFICULTY_LEVELS = List.of(1, 2, 3);

    /**
     * 10분마다 실행: 모든 대분류 + 난이도 조합의 문제 ID를 Redis에 캐싱
     */
    @Transactional(readOnly = true)
    @Scheduled(fixedDelayString = "${app.cache.question-ids.refresh-interval:600000}", initialDelay = 30000)
    public void refreshQuestionIdCache() {
        log.info("Starting question ID cache refresh...");
        log.info("QuestionRepository instance: {}", questionRepository.getClass().getName());
        
        // 테스트: 전체 문제 수 확인
        long totalCount = questionRepository.count();
        log.info("Total questions in DB (via count()): {}", totalCount);
        
        List<Question> allQuestions = questionRepository.findAll();
        log.info("Total questions in DB (via findAll()): {}", allQuestions.size());
        
        if (!allQuestions.isEmpty()) {
            Question first = allQuestions.get(0);
            log.info("First question sample: id={}, major='{}', minor='{}', level={}", 
                    first.getQuestionId(), first.getMajorCategory(), first.getMinorCategory(), first.getDifficultyLevel());
        }
        
        long startTime = System.currentTimeMillis();
        int totalCached = 0;

        try {
            // 대분류 + 난이도 조합으로 캐싱
            for (String majorCategory : MAJOR_CATEGORIES) {
                for (Integer level : DIFFICULTY_LEVELS) {
                    log.info("Querying DB for majorCategory: '{}', level: {}", majorCategory, level);
                    
                    // DB에서 문제 ID만 조회 (RAND() 없이, 단순 조회)
                    List<Question> questions = questionRepository.findByMajorCategoryAndDifficultyLevel(majorCategory, level);
                    log.info("Found {} questions for majorCategory: '{}', level: {}", questions.size(), majorCategory, level);
                    
                    if (!questions.isEmpty()) {
                        log.info("Sample question: id={}, major={}, minor={}, level={}", 
                                questions.get(0).getQuestionId(),
                                questions.get(0).getMajorCategory(),
                                questions.get(0).getMinorCategory(),
                                questions.get(0).getDifficultyLevel());
                    }
                    
                    List<String> questionIds = questions.stream()
                            .map(Question::getQuestionId)
                            .collect(Collectors.toList());
                    
                    if (!questionIds.isEmpty()) {
                        questionIdCacheService.cacheQuestionIdsByMajorCategory(majorCategory, level, questionIds);
                        totalCached += questionIds.size();
                        log.info("Cached {} question IDs for major category: {}, level: {}", 
                                questionIds.size(), majorCategory, level);
                    } else {
                        log.warn("No questions found for majorCategory: {}, level: {}", majorCategory, level);
                    }
                }
            }

            // 소분류별 캐싱 (모든 소분류 조회)
            cacheMinorCategories();

            long duration = System.currentTimeMillis() - startTime;
            log.info("Question ID cache refresh completed. Total cached: {} IDs, Duration: {}ms", totalCached, duration);
            
        } catch (Exception e) {
            log.error("Failed to refresh question ID cache", e);
        }
    }

    /**
     * 소분류별 문제 ID 캐싱
     * 모든 소분류를 조회하여 캐싱
     */
    private void cacheMinorCategories() {
        // 모든 문제를 조회하여 소분류별로 그룹화
        List<Question> allQuestions = questionRepository.findAll();
        
        // 소분류 + 난이도별로 그룹화
        allQuestions.stream()
                .collect(Collectors.groupingBy(
                        q -> q.getMinorCategory() + ":" + q.getDifficultyLevel(),
                        Collectors.mapping(Question::getQuestionId, Collectors.toList())
                ))
                .forEach((key, questionIds) -> {
                    String[] parts = key.split(":");
                    String minorCategory = parts[0];
                    Integer level = Integer.parseInt(parts[1]);
                    questionIdCacheService.cacheQuestionIdsByMinorCategory(minorCategory, level, questionIds);
                });
        
        log.debug("Cached question IDs for all minor categories");
    }

    /**
     * 애플리케이션 시작 시 즉시 캐싱 실행
     */
    @Transactional(readOnly = true)
    @Scheduled(initialDelay = 5000, fixedDelay = Long.MAX_VALUE)
    public void initialCacheLoad() {
        log.info("Performing initial question ID cache load...");
        refreshQuestionIdCache();
    }
}

