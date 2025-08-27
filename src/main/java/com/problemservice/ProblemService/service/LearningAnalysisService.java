package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.dto.CompleteLearningAnalysis;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.concurrent.ConcurrentHashMap;
import java.util.Map;

/**
 * 학습 분석 데이터 관리 서비스
 * Kafka로 받은 분석 데이터를 메모리에 저장하고 조회하는 기능 제공
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class LearningAnalysisService {
    
    // 메모리 기반 캐시 (사용자 ID -> 분석 데이터)
    private final Map<String, CompleteLearningAnalysis> analysisCache = new ConcurrentHashMap<>();
    
    /**
     * Kafka 이벤트로 받은 분석 데이터를 메모리에 저장
     * @param analysisData 저장할 학습 분석 데이터
     */
    public void saveAnalysisData(CompleteLearningAnalysis analysisData) {
        try {
            analysisCache.put(analysisData.getUserId(), analysisData);
            
            log.info("Learning analysis data saved for user: {}, sessionId: {}", 
                analysisData.getUserId(), analysisData.getSessionId());
                
        } catch (Exception e) {
            log.error("Failed to save learning analysis data for user: {}", 
                analysisData.getUserId(), e);
            throw new RuntimeException("Failed to cache learning analysis data", e);
        }
    }
    
    /**
     * 사용자의 최신 분석 데이터 조회
     * @param userId 사용자 ID
     * @return 최신 학습 분석 데이터 또는 null (데이터가 없는 경우)
     */
    public CompleteLearningAnalysis getLatestAnalysisData(String userId) {
        try {
            CompleteLearningAnalysis data = analysisCache.get(userId);
            
            if (data != null) {
                log.debug("Retrieved learning analysis data for user: {}", userId);
                return data;
            }
            
            log.debug("No learning analysis data found for user: {}", userId);
            return null;
            
        } catch (Exception e) {
            log.error("Failed to retrieve learning analysis data for user: {}", userId, e);
            return null;
        }
    }
    
    /**
     * 분석 데이터 존재 여부 확인
     * @param userId 사용자 ID
     * @return 분석 데이터 존재 여부
     */
    public boolean hasAnalysisData(String userId) {
        return analysisCache.containsKey(userId);
    }
    
    /**
     * 특정 사용자의 분석 데이터 삭제
     * @param userId 사용자 ID
     */
    public void deleteAnalysisData(String userId) {
        try {
            analysisCache.remove(userId);
            log.info("Deleted learning analysis data for user: {}", userId);
            
        } catch (Exception e) {
            log.error("Failed to delete learning analysis data for user: {}", userId, e);
        }
    }
}