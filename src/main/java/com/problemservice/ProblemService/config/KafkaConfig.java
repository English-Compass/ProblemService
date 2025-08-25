package com.problemservice.ProblemService.config;

import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.apache.kafka.common.serialization.StringSerializer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.annotation.EnableKafka;
import org.springframework.kafka.config.ConcurrentKafkaListenerContainerFactory;
import org.springframework.kafka.core.*;
import org.springframework.kafka.support.serializer.JsonDeserializer;
import org.springframework.kafka.support.serializer.JsonSerializer;

import java.util.HashMap;
import java.util.Map;

/**
 * Kafka 메시징 시스템 관련 설정 클래스
 * 프로듀서, 컴슈머, 리스너 팩토리 빈 구성
 * 입력: application.properties에서 Kafka 서버 설정 값
 * 출력: Kafka 를 사용하기 위한 빈 인스턴스
 */
@Configuration
@EnableKafka
public class KafkaConfig {

    // Kafka 브로커 서버 주소
    @Value("${spring.kafka.bootstrap-servers}")
    private String bootstrapServers;

    // Kafka 컴슈머 그룹 ID
    @Value("${spring.kafka.consumer.group-id}")
    private String groupId;

    /**
     * Kafka 메시지 전송을 위한 프로듀서 팩토리 생성
     * 단계: 1) 설정 값 맵 생성 2) 기본 옵션 설정 3) 신룰성 옵션 설정 4) 팩토리 생성
     * 입력: 없음
     * 출력: 구성된 Kafka 프로듀서 팩토리
     */
    @Bean
    public ProducerFactory<String, Object> producerFactory() {
        // 1단계: 프로듀서 설정 수집을 위한 맵 생성
        Map<String, Object> configProps = new HashMap<>();
        // 2단계: 기본 연결 및 직렬화 옵션 설정
        configProps.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers); // Kafka 브로커 주소
        configProps.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class); // 키 직렬화
        configProps.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, JsonSerializer.class); // 값 직렬화 (JSON)
        // 3단계: 메시지 전송 신룰성 보장을 위한 옵션 설정
        configProps.put(ProducerConfig.ACKS_CONFIG, "all"); // 모든 레플리카에서 ACK 대기
        configProps.put(ProducerConfig.RETRIES_CONFIG, 3); // 전송 실패 시 재시도 횟수
        configProps.put(ProducerConfig.ENABLE_IDEMPOTENCE_CONFIG, true); // 중복 메시지 방지
        // 4단계: 설정을 사용하여 프로듀서 팩토리 생성
        return new DefaultKafkaProducerFactory<>(configProps);
    }

    /**
     * Kafka 메시지 전송을 위한 템플릿 빈 생성
     * 단계: 1) 프로듀서 팩토리로 Kafka 템플릿 생성
     * 입력: 없음
     * 출력: 설정된 Kafka 랜플릿 (전송 기능 제공)
     */
    @Bean
    public KafkaTemplate<String, Object> kafkaTemplate() {
        // 1단계: 프로듀서 팩토리를 사용하여 Kafka 템플릿 생성
        return new KafkaTemplate<>(producerFactory());
    }

    /**
     * Kafka 메시지 수신을 위한 컴슈머 팩토리 생성
     * 단계: 1) 설정 맵 생성 2) 기본 연결 설정 3) 역직렬화 설정 4) 오프셋 및 폴링 옵션 5) 팩토리 생성
     * 입력: 없음
     * 출력: 구성된 Kafka 컴슈머 팩토리
     */
    @Bean
    public ConsumerFactory<String, Object> consumerFactory() {
        // 1단계: 컴슈머 설정 수집을 위한 맵 생성
        Map<String, Object> configProps = new HashMap<>();
        // 2단계: 기본 연결 및 그룹 설정
        configProps.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers); // Kafka 브로커 주소
        configProps.put(ConsumerConfig.GROUP_ID_CONFIG, groupId); // 컴슈머 그룹 ID
        // 3단계: 키/값 역직렬화 설정
        configProps.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class); // 키 역직렬화
        configProps.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, JsonDeserializer.class); // 값 역직렬화 (JSON)
        // 4단계: 오프셋 및 메시지 수신 옵션 설정
        configProps.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest"); // 처음부터 메시지 수신
        configProps.put(JsonDeserializer.TRUSTED_PACKAGES, "*"); // 모든 패키지 신룰
        configProps.put(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, false); // 수동 오프셋 커밋
        configProps.put(ConsumerConfig.MAX_POLL_RECORDS_CONFIG, 100); // 한 번에 가져올 최대 레코드 수
        // 5단계: 설정을 사용하여 컴슈머 팩토리 생성
        return new DefaultKafkaConsumerFactory<>(configProps);
    }

    @Bean
    public ConcurrentKafkaListenerContainerFactory<String, Object> kafkaListenerContainerFactory() {
        ConcurrentKafkaListenerContainerFactory<String, Object> factory = new ConcurrentKafkaListenerContainerFactory<>();
        factory.setConsumerFactory(consumerFactory());
        factory.setConcurrency(3);
        factory.getContainerProperties().setAckMode(org.springframework.kafka.listener.ContainerProperties.AckMode.MANUAL_IMMEDIATE);
        return factory;
    }
}