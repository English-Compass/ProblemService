1. 주요 분석 결과 데이터
CompleteLearningAnalysis (전체 학습 완료 분석)
sessionId: 학습 세션 ID
userId: 사용자 ID
totalDuration: 총 학습 시간 (초)
averageTimePerQuestion: 문제당 평균 응답 시간 (초)
wrongQuestionIds: 오답 문제 ID 목록
weakQuestionTypes: 취약한 문제 유형 목록
questionTypePerformances: 문제 유형별 상세 성과
overallLearningPattern: 전체 학습 패턴
consistencyScore: 학습 일관성 점수 (0-100)
recommendedReviewQuestions: 복습 추천 문제 ID 목록
learningSuggestion: 개인화된 학습 제안 메시지
focusAreas: 집중 학습 영역
estimatedReviewTime: 예상 복습 시간 (분)
2. 학습 패턴 분류
개별 학습 패턴 (determineLearningPattern)
FAST_LEARNER: 빠른 학습자 (평균 시간 < 20초)
MODERATE_LEARNER: 보통 속도 학습자 (평균 시간 20-40초)
CAREFUL_LEARNER: 신중한 학습자 (평균 시간 40-60초)
SLOW_LEARNER: 느린 학습자 (평균 시간 60초+)
전체 학습 패턴 (determineOverallLearningPattern)
EXCELLENT: 우수한 학습자 (정답률 80%+, 빠른 속도)
ACCURATE_BUT_SLOW: 정확하지만 느린 학습자 (정답률 80%+, 느린 속도)
GOOD: 좋은 학습자 (정답률 60%+, 적당한 속도)
GOOD_BUT_SLOW: 좋지만 느린 학습자 (정답률 60%+, 느린 속도)
AVERAGE: 평균적인 학습자 (정답률 40%+)
NEEDS_IMPROVEMENT: 개선이 필요한 학습자 (정답률 < 40%)
NO_DATA: 데이터 없음
3. 문제 유형별 성과 데이터
QuestionTypePerformance
questionType: 문제 유형 (FILL_IN_THE_BLANK, SYNONYM_SELECTION, PRONUNCIATION_RECOGNITION)
totalQuestions: 총 문제 수
correctAnswers: 정답 수
accuracy: 정답률
isWeakArea: 취약 영역 여부 (정답률 < 70%)
averageTime: 평균 응답 시간
difficulty: 난이도
4. 학습 진행 분석 데이터
LearningProgressAnalysis
sessionId: 세션 ID
userId: 사용자 ID
questionId: 문제 ID
isCorrect: 정답 여부
timeSpent: 걸린 시간
currentQuestionNumber: 현재 문제 번호
totalQuestions: 총 문제 수
correctAnswers: 정답 수
wrongAnswers: 오답 수
progressPercentage: 진행률
averageTimePerQuestion: 평균 시간
learningPattern: 학습 패턴

이 형식을 바탕으로 문제 할당 로직 작성 및 수정