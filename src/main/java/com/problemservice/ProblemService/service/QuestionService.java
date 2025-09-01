package com.problemservice.ProblemService.service;

import com.problemservice.ProblemService.exception.EntityNotFoundException;
import com.problemservice.ProblemService.model.dto.QuestionCreateDto;
import com.problemservice.ProblemService.model.dto.QuestionResponseDto;
import com.problemservice.ProblemService.model.dto.QuestionUpdateDto;
import com.problemservice.ProblemService.model.entity.Question;
import com.problemservice.ProblemService.repository.QuestionRepository;
import com.problemservice.ProblemService.service.base.BaseService;
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
public class QuestionService extends BaseService {

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
        logMethodEntry("createQuestion", createDto.getQuestionId());
        validateCreateDto(createDto);
        
        Question question = buildQuestionFromDto(createDto);
        Question savedQuestion = questionRepository.save(question);
        
        QuestionResponseDto result = convertToResponseDto(savedQuestion);
        logMethodExit("createQuestion", result.getQuestionId());
        return result;
    }

    /**
     * ID로 특정 문제 조회
     * 단계: 1) ID로 문제 검색 2) 존재하지 않으면 예외 발생 3) 응답 DTO로 변환
     * 입력: 문제 ID (String)
     * 출력: 해당 문제의 상세 정보 DTO
     */
    public QuestionResponseDto getQuestionById(String id) {
        logMethodEntry("getQuestionById", id);
        validateId(id, "Question");
        
        Question question = findQuestionByIdOrThrow(id);
        
        QuestionResponseDto result = convertToResponseDto(question);
        logMethodExit("getQuestionById", result.getQuestionId());
        return result;
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
        logMethodEntry("updateQuestion", id);
        validateId(id, "Question");
        
        Question question = findQuestionByIdOrThrow(id);
        updateQuestionFromDto(question, updateDto);
        
        Question savedQuestion = questionRepository.save(question);
        
        QuestionResponseDto result = convertToResponseDto(savedQuestion);
        logMethodExit("updateQuestion", result.getQuestionId());
        return result;
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
        logMethodEntry("deleteQuestion", id);
        validateId(id, "Question");
        
        findQuestionByIdOrThrow(id);
        questionRepository.deleteById(id);
        
        logMethodExit("deleteQuestion", "Question deleted: " + id);
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
        logMethodEntry("getQuestionsByDifficultyLevel", level);
        
        Integer difficultyLevel = parseDifficultyLevel(level);
        List<Question> questions = questionRepository.findByDifficultyLevel(difficultyLevel);
        
        List<QuestionResponseDto> result = questions.stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
                
        logMethodExit("getQuestionsByDifficultyLevel", result.size() + " questions found");
        return result;
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
        return QuestionResponseDto.builder()
                .questionId(question.getQuestionId())
                .questionText(question.getQuestionText())
                .optionA(question.getOptionA())
                .optionB(question.getOptionB())
                .optionC(question.getOptionC())
                .correctAnswer(question.getCorrectAnswer())
                .majorCategory(question.getMajorCategory())
                .minorCategory(question.getMinorCategory())
                .questionType(question.getQuestionType())
                .explanation(question.getExplanation())
                .difficultyLevel(question.getDifficultyLevel())
                .createdAt(question.getCreatedAt())
                .updatedAt(question.getUpdatedAt())
                .build();
    }
    
    private void validateCreateDto(QuestionCreateDto createDto) {
        if (createDto == null) {
            throw new IllegalArgumentException("Create DTO cannot be null");
        }
        if (createDto.getQuestionId() == null || createDto.getQuestionId().trim().isEmpty()) {
            throw new IllegalArgumentException("Question ID cannot be null or empty");
        }
        if (createDto.getQuestionText() == null || createDto.getQuestionText().trim().isEmpty()) {
            throw new IllegalArgumentException("Question text cannot be null or empty");
        }
    }
    
    private Question buildQuestionFromDto(QuestionCreateDto createDto) {
        return Question.builder()
                .questionId(createDto.getQuestionId())
                .questionText(createDto.getQuestionText())
                .optionA(createDto.getOptionA())
                .optionB(createDto.getOptionB())
                .optionC(createDto.getOptionC())
                .correctAnswer(createDto.getCorrectAnswer())
                .majorCategory(createDto.getMajorCategory())
                .minorCategory(createDto.getMinorCategory())
                .questionType(createDto.getQuestionType())
                .explanation(createDto.getExplanation())
                .difficultyLevel(createDto.getDifficultyLevel())
                .build();
    }
    
    private Question findQuestionByIdOrThrow(String id) {
        return questionRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Question", id));
    }
    
    private void updateQuestionFromDto(Question question, QuestionUpdateDto updateDto) {
        question.setQuestionText(updateDto.getQuestionText());
        question.setOptionA(updateDto.getOptionA());
        question.setOptionB(updateDto.getOptionB());
        question.setOptionC(updateDto.getOptionC());
        question.setCorrectAnswer(updateDto.getCorrectAnswer());
        question.setMajorCategory(updateDto.getMajorCategory());
        question.setMinorCategory(updateDto.getMinorCategory());
        question.setQuestionType(updateDto.getQuestionType());
        question.setExplanation(updateDto.getExplanation());
        question.setDifficultyLevel(updateDto.getDifficultyLevel());
    }
    
    private Integer parseDifficultyLevel(String level) {
        try {
            return Integer.parseInt(level);
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Invalid difficulty level: " + level, e);
        }
    }
}