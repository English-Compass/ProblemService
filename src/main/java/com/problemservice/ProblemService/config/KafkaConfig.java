package com.problemservice.ProblemService.config;

import org.apache.kafka.clients.admin.NewTopic;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.apache.kafka.common.serialization.StringSerializer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.annotation.EnableKafka;
import org.springframework.kafka.config.ConcurrentKafkaListenerContainerFactory;
import org.springframework.kafka.config.TopicBuilder;
import org.springframework.kafka.core.*;
import org.springframework.kafka.listener.DefaultErrorHandler;
import org.springframework.kafka.support.serializer.JsonSerializer;
import org.springframework.util.backoff.FixedBackOff;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.Map;
import org.springframework.context.annotation.Profile;

/**
 * Kafka 메시징 시스템 설정
 * 프로듀서, 컨슈머, 토픽 구성
 */
@Slf4j
@Configuration
@EnableKafka
@Profile("!local")
public class KafkaConfig {

    @Value("${spring.kafka.bootstrap-servers}")
    private String bootstrapServers;

    @Value("${spring.kafka.consumer.group-id}")
    private String groupId;

    /**
     * 메시지 전송용 프로듀서 팩토리 구성
     */
    @Bean
    @ConditionalOnProperty(name = "spring.kafka.bootstrap-servers")
    public ProducerFactory<String, Object> producerFactory() {
        Map<String, Object> configProps = new HashMap<>();
        configProps.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
        configProps.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class);
        configProps.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, JsonSerializer.class);
        configProps.put(ProducerConfig.ACKS_CONFIG, "all");
        configProps.put(ProducerConfig.RETRIES_CONFIG, 3);
        configProps.put(ProducerConfig.ENABLE_IDEMPOTENCE_CONFIG, true);
        configProps.put(ProducerConfig.COMPRESSION_TYPE_CONFIG, "lz4");
        configProps.put(ProducerConfig.BATCH_SIZE_CONFIG, 16384);
        configProps.put(ProducerConfig.LINGER_MS_CONFIG, 5);
        configProps.put(ProducerConfig.BUFFER_MEMORY_CONFIG, 33554432L);
        return new DefaultKafkaProducerFactory<>(configProps);
    }

    /**
     * 메시지 전송용 Kafka 템플릿
     */
    @Bean
    @ConditionalOnProperty(name = "spring.kafka.bootstrap-servers")
    public KafkaTemplate<String, Object> kafkaTemplate() {
        return new KafkaTemplate<>(producerFactory());
    }

    /**
     * 메시지 수신용 컨슈머 팩토리 구성
     */
    @Bean
    @ConditionalOnProperty(name = "spring.kafka.bootstrap-servers")
    public ConsumerFactory<String, Object> consumerFactory() {
        Map<String, Object> configProps = new HashMap<>();
        configProps.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
        configProps.put(ConsumerConfig.GROUP_ID_CONFIG, groupId);
        configProps.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        // UserService가 StringSerializer로 JSON 문자열을 보내므로, StringDeserializer 사용 후 Consumer에서 수동 파싱
        // JsonDeserializer는 StringSerializer와 호환성 문제가 있을 수 있음
        configProps.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        configProps.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");
        configProps.put(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, false);
        configProps.put(ConsumerConfig.MAX_POLL_RECORDS_CONFIG, 100);
        configProps.put(ConsumerConfig.SESSION_TIMEOUT_MS_CONFIG, 30000);
        configProps.put(ConsumerConfig.HEARTBEAT_INTERVAL_MS_CONFIG, 10000);
        return new DefaultKafkaConsumerFactory<>(configProps);
    }

    /**
     * Kafka 리스너 컨테이너 팩토리 구성
     */
    @Bean
    @ConditionalOnProperty(name = "spring.kafka.bootstrap-servers")
    public ConcurrentKafkaListenerContainerFactory<String, Object> kafkaListenerContainerFactory() {
        ConcurrentKafkaListenerContainerFactory<String, Object> factory = new ConcurrentKafkaListenerContainerFactory<>();
        factory.setConsumerFactory(consumerFactory());
        factory.setConcurrency(3);
        factory.getContainerProperties().setAckMode(org.springframework.kafka.listener.ContainerProperties.AckMode.MANUAL_IMMEDIATE);
        factory.getContainerProperties().setPollTimeout(3000L);
        factory.setCommonErrorHandler(kafkaErrorHandler());
        
        log.info("KafkaListenerContainerFactory configured - groupId: {}, bootstrapServers: {}", groupId, bootstrapServers);
        
        return factory;
    }
    
    /**
     * Kafka 오류 처리기 구성
     */
    @Bean
    public DefaultErrorHandler kafkaErrorHandler() {
        DefaultErrorHandler errorHandler = new DefaultErrorHandler(
            (record, exception) -> {
                // Log the error and continue processing
                log.error("Error processing Kafka record: {}", record, exception);
            },
            new FixedBackOff(1000L, 3L) // Retry 3 times with 1 second delay
        );
        errorHandler.addNotRetryableExceptions(
            org.springframework.kafka.support.serializer.DeserializationException.class,
            org.apache.kafka.common.errors.SerializationException.class
        );
        return errorHandler;
    }

    @Bean
    @ConditionalOnProperty(name = "spring.kafka.bootstrap-servers")
    public NewTopic learningSessionCompletedTopic() {
        return TopicBuilder.name("learning-session-completed")
                .partitions(3)
                .replicas(1)
                .config("retention.ms", "2592000000") // 30 days
                .config("compression.type", "lz4")
                .build();
    }

    @Bean
    @ConditionalOnProperty(name = "spring.kafka.bootstrap-servers")
    public NewTopic learningAnalysisCompletedTopic() {
        return TopicBuilder.name("learning-analysis-completed")
                .partitions(3)
                .replicas(1)
                .config("retention.ms", "2592000000") // 30 days
                .config("compression.type", "lz4")
                .build();
    }

    @Bean
    @ConditionalOnProperty(name = "spring.kafka.bootstrap-servers")
    public NewTopic userProfileEventsTopic() {
        return TopicBuilder.name("user-profile-events")
                .partitions(3)
                .replicas(1)
                .config("retention.ms", "2592000000") // 30 days
                .config("compression.type", "lz4")
                .build();
    }
}