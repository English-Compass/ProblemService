package com.problemservice.ProblemService.controller;

import com.problemservice.ProblemService.model.dto.UserLearningProfileDto;
import com.problemservice.ProblemService.model.dto.WordStudyRequestDto;
import com.problemservice.ProblemService.model.dto.WordStudyResponseDto;
import com.problemservice.ProblemService.service.WordStudyService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 사용자별 맞춤형 단어 학습 API 컨트롤러
 * Combined Tactic 2+3: Category Proficiency + Progressive Difficulty 전략 기반
 * 사용자의 학습 성과 데이터를 분석하여 약점 카테고리와 난이도에 집중한 단어 목록 제공
 */
@RestController
@RequestMapping("/api/word-study")
@RequiredArgsConstructor
@Slf4j
public class WordStudyController {

    private final WordStudyService wordStudyService;

    /**
     * 사용자 맞춤형 단어 학습 목록 생성
     * 사용자의 학습 이력을 분석하여 약점 카테고리와 난이도에 맞춘 단어 목록을 AI로 생성
     * 
     * @param requestDto 단어 생성 요청 (사용자 ID, 단어 개수, 집중 카테고리/난이도)
     * @return 생성된 단어 목록과 학습 전략
     */
    @PostMapping("/generate")
    public ResponseEntity<WordStudyResponseDto> generateWordStudyList(
            @Valid @RequestBody WordStudyRequestDto requestDto) {
        
        log.info("단어 학습 목록 생성 요청 - 사용자: {}, 단어 수: {}", 
                requestDto.getUserId(), requestDto.getWordCount());
        
        try {
            WordStudyResponseDto response = wordStudyService.generateWordStudyList(requestDto);
            
            if (response.isSuccess()) {
                log.info("단어 학습 목록 생성 성공 - 사용자: {}, 생성된 단어 수: {}", 
                        requestDto.getUserId(), response.getWords().size());
                return ResponseEntity.ok(response);
            } else {
                log.error("단어 학습 목록 생성 실패 - 사용자: {}, 오류: {}", 
                        requestDto.getUserId(), response.getErrorMessage());
                return ResponseEntity.badRequest().body(response);
            }
            
        } catch (Exception e) {
            log.error("단어 학습 목록 생성 중 예외 발생", e);
            WordStudyResponseDto errorResponse = WordStudyResponseDto.builder()
                    .success(false)
                    .errorMessage("단어 학습 목록 생성 중 서버 오류가 발생했습니다: " + e.getMessage())
                    .build();
            return ResponseEntity.internalServerError().body(errorResponse);
        }
    }

    /**
     * 사용자 학습 프로필 분석 조회
     * 사용자의 카테고리별, 난이도별 성과 데이터와 약점 분석 결과 제공
     * 
     * @param userId 사용자 ID
     * @return 사용자의 학습 프로필 분석 결과
     */
    @GetMapping("/profile/{userId}")
    public ResponseEntity<UserLearningProfileDto> getUserLearningProfile(@PathVariable String userId) {
        
        log.info("사용자 학습 프로필 조회 요청 - 사용자: {}", userId);
        
        try {
            UserLearningProfileDto profile = wordStudyService.analyzeUserLearningProfile(userId);
            
            log.info("사용자 학습 프로필 조회 성공 - 사용자: {}, 약점 카테고리: {}, 가장 약한 난이도: {}", 
                    userId, profile.getWeakCategories(), profile.getWeakestDifficulty());
            
            return ResponseEntity.ok(profile);
            
        } catch (Exception e) {
            log.error("사용자 학습 프로필 조회 중 예외 발생", e);
            return ResponseEntity.internalServerError().build();
        }
    }

    /**
     * 특정 카테고리에 집중한 단어 학습 목록 생성
     * 사용자가 지정한 카테고리에 더 높은 비중을 둔 단어 목록 생성
     * 
     * @param userId 사용자 ID
     * @param category 집중할 카테고리 (학업, 비즈니스, 여행, 일상생활)
     * @param wordCount 생성할 단어 개수
     * @return 특정 카테고리에 집중한 단어 목록
     */
    @PostMapping("/generate/category/{userId}")
    public ResponseEntity<WordStudyResponseDto> generateCategoryFocusedWords(
            @PathVariable String userId,
            @RequestParam String category,
            @RequestParam(defaultValue = "20") Integer wordCount) {
        
        log.info("카테고리 집중 단어 학습 목록 생성 요청 - 사용자: {}, 카테고리: {}, 단어 수: {}", 
                userId, category, wordCount);
        
        WordStudyRequestDto requestDto = WordStudyRequestDto.builder()
                .userId(userId)
                .wordCount(wordCount)
                .focusCategory(category)
                .build();
        
        return generateWordStudyList(requestDto);
    }

    /**
     * 특정 난이도에 집중한 단어 학습 목록 생성
     * 사용자가 지정한 난이도에 더 높은 비중을 둔 단어 목록 생성
     * 
     * @param userId 사용자 ID
     * @param difficulty 집중할 난이도 (A: 초급, B: 중급, C: 고급)
     * @param wordCount 생성할 단어 개수
     * @return 특정 난이도에 집중한 단어 목록
     */
    @PostMapping("/generate/difficulty/{userId}")
    public ResponseEntity<WordStudyResponseDto> generateDifficultyFocusedWords(
            @PathVariable String userId,
            @RequestParam String difficulty,
            @RequestParam(defaultValue = "20") Integer wordCount) {
        
        log.info("난이도 집중 단어 학습 목록 생성 요청 - 사용자: {}, 난이도: {}, 단어 수: {}", 
                userId, difficulty, wordCount);
        
        WordStudyRequestDto requestDto = WordStudyRequestDto.builder()
                .userId(userId)
                .wordCount(wordCount)
                .targetDifficulty(difficulty)
                .build();
        
        return generateWordStudyList(requestDto);
    }

    /**
     * 오늘의 단어 조회 (Today Words API)
     * 사용자별 맞춤형 일일 단어 목록을 제공 - 기본 5개 단어
     * 
     * @param userId 사용자 ID
     * @return 오늘의 단어 목록 (간소화된 형태)
     */
    @GetMapping("/today-words/{userId}")
    public ResponseEntity<WordStudyResponseDto> getTodayWords(@PathVariable String userId) {
        
        log.info("오늘의 단어 조회 요청 - 사용자: {}", userId);
        
        try {
            WordStudyRequestDto todayWordsRequest = WordStudyRequestDto.builder()
                    .userId(userId)
                    .wordCount(5) // 오늘의 단어는 5개 고정
                    .build();
            
            WordStudyResponseDto response = wordStudyService.generateWordStudyList(todayWordsRequest);
            
            log.info("오늘의 단어 조회 성공 - 사용자: {}, 단어 수: {}", 
                    userId, response.getWords().size());
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            log.error("오늘의 단어 조회 중 예외 발생", e);
            WordStudyResponseDto errorResponse = WordStudyResponseDto.builder()
                    .success(false)
                    .errorMessage("오늘의 단어 조회 중 서버 오류가 발생했습니다: " + e.getMessage())
                    .build();
            return ResponseEntity.internalServerError().body(errorResponse);
        }
    }

    /**
     * 사용자의 약점 영역 요약 조회
     * 사용자의 주요 약점 카테고리, 난이도, 문제 유형을 간단히 요약하여 제공
     * 
     * @param userId 사용자 ID
     * @return 약점 영역 요약 정보
     */
    @GetMapping("/weakness-summary/{userId}")
    public ResponseEntity<?> getWeaknessSummary(@PathVariable String userId) {
        
        log.info("약점 영역 요약 조회 요청 - 사용자: {}", userId);
        
        try {
            UserLearningProfileDto profile = wordStudyService.analyzeUserLearningProfile(userId);
            
            // 약점 요약 정보만 추출
            var weaknessSummary = Map.of(
                    "userId", profile.getUserId(),
                    "weakestCategories", profile.getWeakCategories(),
                    "weakestDifficulty", profile.getWeakestDifficulty(),
                    "weakestDifficultyAccuracy", String.format("%.1f%%", profile.getWeakestDifficultyAccuracy() * 100),
                    "weakQuestionTypes", profile.getWeakQuestionTypes(),
                    "learningPattern", profile.getLearningPattern(),
                    "recommendedFocus", profile.getWeakCategories().isEmpty() ? 
                            "전반적인 실력 향상" : 
                            profile.getWeakCategories().get(0) + " 카테고리 집중 학습"
            );
            
            log.info("약점 영역 요약 조회 성공 - 사용자: {}, 주요 약점: {}", 
                    userId, weaknessSummary.get("recommendedFocus"));
            
            return ResponseEntity.ok(weaknessSummary);
            
        } catch (Exception e) {
            log.error("약점 영역 요약 조회 중 예외 발생", e);
            return ResponseEntity.internalServerError().body(
                    Map.of("error", "약점 영역 요약 조회 중 오류가 발생했습니다: " + e.getMessage())
            );
        }
    }
    
    // ==================== 캐시 관리 API ====================
    
    /**
     * 사용자별 단어 학습 캐시 무효화
     * 사용자의 학습 프로필이 변경되었을 때 캐시를 갱신하기 위해 사용
     * 
     * @param userId 캐시를 무효화할 사용자 ID
     * @return 무효화 결과
     */
    @DeleteMapping("/cache/{userId}")
    public ResponseEntity<Map<String, Object>> evictUserCache(@PathVariable String userId) {
        
        log.info("사용자 단어 학습 캐시 무효화 요청 - 사용자: {}", userId);
        
        try {
            wordStudyService.evictUserWordStudyCache(userId);
            
            Map<String, Object> response = Map.of(
                "success", true,
                "userId", userId,
                "message", "사용자 캐시가 성공적으로 무효화되었습니다",
                "timestamp", System.currentTimeMillis()
            );
            
            log.info("사용자 단어 학습 캐시 무효화 성공 - 사용자: {}", userId);
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            log.error("사용자 캐시 무효화 중 예외 발생", e);
            Map<String, Object> errorResponse = Map.of(
                "success", false,
                "userId", userId,
                "error", "캐시 무효화 중 오류가 발생했습니다: " + e.getMessage(),
                "timestamp", System.currentTimeMillis()
            );
            return ResponseEntity.internalServerError().body(errorResponse);
        }
    }
    
    /**
     * 사용자 캐시 통계 정보 조회
     * 모니터링 및 디버깅 목적으로 사용자의 캐시 상태를 확인
     * 
     * @param userId 캐시 통계를 조회할 사용자 ID
     * @return 캐시 통계 정보
     */
    @GetMapping("/cache/stats/{userId}")
    public ResponseEntity<Map<String, Object>> getCacheStatistics(@PathVariable String userId) {
        
        log.info("사용자 캐시 통계 조회 요청 - 사용자: {}", userId);
        
        try {
            Map<String, Object> stats = wordStudyService.getCacheStatistics(userId);
            
            log.debug("사용자 캐시 통계 조회 성공 - 사용자: {}, 캐시 항목: {}", 
                    userId, stats.get("cachedItems"));
            
            return ResponseEntity.ok(stats);
            
        } catch (Exception e) {
            log.error("사용자 캐시 통계 조회 중 예외 발생", e);
            Map<String, Object> errorResponse = Map.of(
                "error", "캐시 통계 조회 중 오류가 발생했습니다: " + e.getMessage(),
                "userId", userId,
                "timestamp", System.currentTimeMillis()
            );
            return ResponseEntity.internalServerError().body(errorResponse);
        }
    }
    
    /**
     * 자주 사용하는 사용자를 위한 캐시 사전 로딩
     * 시스템 성능 최적화를 위해 예상되는 요청에 대해 미리 캐시를 준비
     * 
     * @param userId 캐시를 사전 로딩할 사용자 ID
     * @param categories 사전 로딩할 카테고리 목록 (선택사항)
     * @return 사전 로딩 결과
     */
    @PostMapping("/cache/preload/{userId}")
    public ResponseEntity<Map<String, Object>> preloadUserCache(
            @PathVariable String userId,
            @RequestParam(required = false) List<String> categories) {
        
        log.info("사용자 캐시 사전 로딩 요청 - 사용자: {}, 카테고리: {}", userId, categories);
        
        try {
            // 기본 카테고리 설정 (파라미터가 없는 경우)
            List<String> preloadCategories = categories != null && !categories.isEmpty() ? 
                    categories : List.of("학업", "비즈니스", "여행", "일상생활");
            
            wordStudyService.preloadFrequentUserCache(userId, preloadCategories);
            
            Map<String, Object> response = Map.of(
                "success", true,
                "userId", userId,
                "preloadCategories", preloadCategories,
                "message", "사용자 캐시 사전 로딩이 시작되었습니다 (백그라운드 처리)",
                "timestamp", System.currentTimeMillis()
            );
            
            log.info("사용자 캐시 사전 로딩 시작 - 사용자: {}", userId);
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            log.error("사용자 캐시 사전 로딩 중 예외 발생", e);
            Map<String, Object> errorResponse = Map.of(
                "success", false,
                "userId", userId,
                "error", "캐시 사전 로딩 중 오류가 발생했습니다: " + e.getMessage(),
                "timestamp", System.currentTimeMillis()
            );
            return ResponseEntity.internalServerError().body(errorResponse);
        }
    }
}