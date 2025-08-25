package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.model.dto.QuestionCreateDto;
import com.problemservice.ProblemService.model.dto.QuestionResponseDto;
import com.problemservice.ProblemService.model.dto.QuestionUpdateDto;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.repository.QuestionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 문제 관리 비즈니스 로직 서비스
 * 문제 생성, 조회, 수정, 삭제 및 카테고리별 필터링 기능 제공
 * 입력: 문제 생성/수정 DTO, 검색 조건
 * 출력: 문제 응답 DTO 및 목록
 */
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class QuestionService {

    // 문제 데이터 접근을 위한 레포지토리
    private final QuestionRepository questionRepository;

    /**
     * 새로운 문제 생성
     * 단계: 1) DTO에서 엔티티로 변환 2) 데이터베이스 저장 3) 응답 DTO로 변환
     * 입력: 문제 생성 DTO (문제 내용, 선택지, 정답, 카테고리 정보)
     * 출력: 생성된 문제의 응답 DTO
     */
    @Transactional
    public QuestionResponseDto createQuestion(QuestionCreateDto createDto) {
        // 1단계: 입력 DTO에서 Question 엔티티 생성
        Question question = Question.builder()
                .questionId(createDto.getQuestionId()) // 문제 고유 ID 설정
                .questionText(createDto.getQuestionText()) // 문제 텍스트 설정
                .optionA(createDto.getOptionA()) // 선택지 A 설정
                .optionB(createDto.getOptionB()) // 선택지 B 설정
                .optionC(createDto.getOptionC()) // 선택지 C 설정
                .correctAnswer(createDto.getCorrectAnswer()) // 정답 설정
                .majorCategory(createDto.getMajorCategory()) // 주요 카테고리 설정
                .minorCategory(createDto.getMinorCategory()) // 세부 카테고리 설정
                .questionType(createDto.getQuestionType()) // 문제 유형 설정
                .explanation(createDto.getExplanation()) // 설명 설정
                .difficultyLevel(createDto.getDifficultyLevel()) // 난이도 설정
                .build();

        // 2단계: 데이터베이스에 문제 저장
        Question savedQuestion = questionRepository.save(question);
        // 3단계: 저장된 엔티티를 응답 DTO로 변환하여 반환
        return convertToResponseDto(savedQuestion);
    }

    /**
     * ID로 특정 문제 조회
     * 단계: 1) ID로 문제 검색 2) 존재하지 않으면 예외 발생 3) 응답 DTO로 변환
     * 입력: 문제 ID (String)
     * 출력: 해당 문제의 상세 정보 DTO
     */
    public QuestionResponseDto getQuestionById(String id) {
        // 1단계: ID로 문제를 데이터베이스에서 조회
        Question question = questionRepository.findById(id)
                // 2단계: 문제가 존재하지 않으면 예외 발생
                .orElseThrow(() -> new RuntimeException("Question not found"));
        // 3단계: 조회된 엔티티를 응답 DTO로 변환하여 반환
        return convertToResponseDto(question);
    }

    /**
     * 모든 문제를 페이지 단위로 조회
     * 단계: 1) 페이징 조건으로 문제 목록 조회 2) 각 엔티티를 응답 DTO로 변환
     * 입력: 페이징 정보 (페이지 번호, 크기, 정렬 조건)
     * 출력: 페이징 처리된 문제 응답 DTO 목록
     */
    public Page<QuestionResponseDto> getAllQuestions(Pageable pageable) {
        // 1단계: 페이징 조건에 따라 문제 목록을 데이터베이스에서 조회
        Page<Question> questionPage = questionRepository.findAll(pageable);
        // 2단계: 페이지 내 각 문제 엔티티를 응답 DTO로 변환
        return questionPage.map(this::convertToResponseDto);
    }

    /**
     * 기존 문제 정보 수정
     * 단계: 1) ID로 기존 문제 조회 2) DTO 정보로 엔티티 필드 업데이트 3) 저장 4) 응답 DTO 변환
     * 입력: 문제 ID, 수정할 정보가 담긴 DTO
     * 출력: 수정된 문제의 응답 DTO
     */
    @Transactional
    public QuestionResponseDto updateQuestion(String id, QuestionUpdateDto updateDto) {
        // 1단계: ID로 기존 문제를 데이터베이스에서 조회
        Question question = questionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Question not found"));

        // 2단계: 수정 DTO의 값으로 기존 엔티티 필드들을 업데이트
        question.setQuestionText(updateDto.getQuestionText()); // 문제 텍스트 수정
        question.setOptionA(updateDto.getOptionA()); // 선택지 A 수정
        question.setOptionB(updateDto.getOptionB()); // 선택지 B 수정
        question.setOptionC(updateDto.getOptionC()); // 선택지 C 수정
        question.setCorrectAnswer(updateDto.getCorrectAnswer()); // 정답 수정
        question.setMajorCategory(updateDto.getMajorCategory()); // 주요 카테고리 수정
        question.setMinorCategory(updateDto.getMinorCategory()); // 세부 카테고리 수정
        question.setQuestionType(updateDto.getQuestionType()); // 문제 유형 수정
        question.setExplanation(updateDto.getExplanation()); // 설명 수정
        question.setDifficultyLevel(updateDto.getDifficultyLevel()); // 난이도 수정

        // 3단계: 수정된 엔티티를 데이터베이스에 저장
        Question savedQuestion = questionRepository.save(question);
        // 4단계: 저장된 엔티티를 응답 DTO로 변환하여 반환
        return convertToResponseDto(savedQuestion);
    }

    /**
     * 문제 삭제
     * 단계: 1) ID로 문제 존재 확인 2) 문제가 존재하면 삭제 실행
     * 입력: 삭제할 문제 ID
     * 출력: 없음 (void)
     * 조건: 문제가 존재하지 않으면 예외 발생
     */
    @Transactional
    public void deleteQuestion(String id) {
        // 1단계: ID로 문제 존재 여부 확인 (존재하지 않으면 예외 발생)
        questionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Question not found"));
        // 2단계: 문제가 존재하면 데이터베이스에서 삭제
        questionRepository.deleteById(id);
    }

    /**
     * 주요 카테고리별 문제 목록 조회
     * 단계: 1) 카테고리로 문제 목록 조회 2) 각 엔티티를 DTO로 변환
     * 입력: 주요 카테고리명 (예: "학업", "비즈니스")
     * 출력: 해당 카테고리의 모든 문제 응답 DTO 목록
     */
    public List<QuestionResponseDto> getQuestionsByCategory(String category) {
        // 1단계: 주요 카테고리로 문제 목록을 데이터베이스에서 조회
        List<Question> questions = questionRepository.findByMajorCategory(category);
        // 2단계: 조회된 각 문제 엔티티를 응답 DTO로 변환하여 리스트로 수집
        return questions.stream()
                .map(this::convertToResponseDto) // 각 엔티티를 DTO로 변환
                .collect(Collectors.toList()); // 변환된 DTO들을 리스트로 수집
    }

    /**
     * 난이도별 문제 목록 조회
     * 단계: 1) 문자열 난이도를 정수로 변환 2) 유효성 검증 3) 난이도로 문제 조회 4) DTO 변환
     * 입력: 난이도 레벨 (문자열 형태의 "1", "2", "3")
     * 출력: 해당 난이도의 모든 문제 응답 DTO 목록
     * 조건: 유효하지 않은 난이도 형식이면 예외 발생
     */
    public List<QuestionResponseDto> getQuestionsByDifficultyLevel(String level) {
        Integer difficultyLevel;
        // 1단계: 입력받은 문자열 난이도를 정수로 변환
        try {
            difficultyLevel = Integer.parseInt(level);
        } catch (NumberFormatException e) {
            // 2단계: 변환 실패 시 (유효하지 않은 형식) 예외 발생
            throw new RuntimeException("Invalid difficulty level: " + level);
        }
        // 3단계: 변환된 난이도로 문제 목록을 데이터베이스에서 조회
        List<Question> questions = questionRepository.findByDifficultyLevel(difficultyLevel);
        // 4단계: 조회된 각 문제 엔티티를 응답 DTO로 변환하여 리스트로 반환
        return questions.stream()
                .map(this::convertToResponseDto) // 각 엔티티를 DTO로 변환
                .collect(Collectors.toList()); // 변환된 DTO들을 리스트로 수집
    }

    /**
     * 문제 유형별 문제 목록 조회
     * 단계: 1) 문제 유형으로 문제 목록 조회 2) 각 엔티티를 DTO로 변환
     * 입력: 문제 유형 ("Word" 또는 "Sentence")
     * 출력: 해당 유형의 모든 문제 응답 DTO 목록
     */
    public List<QuestionResponseDto> getQuestionsByQuestionType(String questionType) {
        // 1단계: 문제 유형으로 문제 목록을 데이터베이스에서 조회
        List<Question> questions = questionRepository.findByQuestionType(questionType);
        // 2단계: 조회된 각 문제 엔티티를 응답 DTO로 변환하여 리스트로 반환
        return questions.stream()
                .map(this::convertToResponseDto) // 각 엔티티를 DTO로 변환
                .collect(Collectors.toList()); // 변환된 DTO들을 리스트로 수집
    }

    /**
     * Question 엔티티를 QuestionResponseDto로 변환하는 헬퍼 메소드
     * 단계: 1) 엔티티의 모든 필드를 DTO 빌더에 설정 2) DTO 객체 생성
     * 입력: Question 엔티티
     * 출력: QuestionResponseDto
     */
    private QuestionResponseDto convertToResponseDto(Question question) {
        // 1단계: 엔티티의 모든 필드 값을 DTO 빌더에 설정
        return QuestionResponseDto.builder()
                .questionId(question.getQuestionId()) // 문제 ID 설정
                .questionText(question.getQuestionText()) // 문제 텍스트 설정
                .optionA(question.getOptionA()) // 선택지 A 설정
                .optionB(question.getOptionB()) // 선택지 B 설정
                .optionC(question.getOptionC()) // 선택지 C 설정
                .correctAnswer(question.getCorrectAnswer()) // 정답 설정
                .majorCategory(question.getMajorCategory()) // 주요 카테고리 설정
                .minorCategory(question.getMinorCategory()) // 세부 카테고리 설정
                .questionType(question.getQuestionType()) // 문제 유형 설정
                .explanation(question.getExplanation()) // 설명 설정
                .difficultyLevel(question.getDifficultyLevel()) // 난이도 설정
                .createdAt(question.getCreatedAt()) // 생성 시각 설정
                .updatedAt(question.getUpdatedAt()) // 수정 시각 설정
                // 2단계: 설정된 빌더로 DTO 객체 생성
                .build();
    }
}