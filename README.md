# ProblemService

A Java Spring Boot microservice for managing language learning quiz questions and learning sessions.

## Overview

ProblemService provides CRUD operations for language learning questions, manages learning sessions, and integrates with external systems through Kafka messaging and OpenAI API for AI-powered features.

## Features

- **Question Management**: CRUD operations with filtering by category, difficulty, and type
- **Learning Sessions**: Session lifecycle management with multiple types (practice, review, wrong-answer)
- **Progress Tracking**: Monitor user progress and session completion
- **AI Integration**: OpenAI API integration for enhanced features
- **Event Streaming**: Kafka messaging for session completion events
- **Comprehensive Logging**: API request/response tracking and AOP-based method logging

## Tech Stack

- **Java 17**
- **Spring Boot 3.x**
- **Spring Data JPA**
- **MySQL 8.0** (Production) / **H2** (Development)
- **Kafka** for event streaming
- **OpenAI API** integration
- **Docker & Docker Compose**
- **Gradle** build system

## Quick Start

### Prerequisites
- Java 17
- Docker and Docker Compose

### Development Setup

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd ProblemService
   ```

2. **Run with Docker Compose** (recommended)
   ```bash
   docker-compose up --build
   ```

3. **Or run locally with H2 database**
   ```bash
   ./gradlew bootRun
   ```

### Build Commands

```bash
# Build the project
./gradlew build

# Clean build
./gradlew clean build

# Run application
./gradlew bootRun
```

## API Endpoints

### Questions
- `GET /api/questions` - List questions with filtering
- `POST /api/questions` - Create new question
- `GET /api/questions/{id}` - Get question by ID
- `PUT /api/questions/{id}` - Update question
- `DELETE /api/questions/{id}` - Delete question

### Learning Sessions
- `POST /api/learning-sessions` - Create new session
- `GET /api/learning-sessions/{id}` - Get session details
- `PUT /api/learning-sessions/{id}` - Update session
- `POST /api/learning-sessions/{id}/complete` - Complete session

## Data Structure

### Question Categories
- 학업 (Academic)
- 비즈니스 (Business)
- 여행 (Travel)
- 일상생활 (Daily Life)

### Difficulty Levels
- **A**: Beginner
- **B**: Intermediate
- **C**: Advanced

### Question Types
- **Word**: Fill-in-the-blank questions
- **Sentence**: Synonym matching questions

## Database

### Development
- **H2 in-memory database**
- Console: http://localhost:8080/h2-console

### Production
- **MySQL 8.0** with Docker
- Initialization scripts in `init-scripts/` directory

## Configuration

Key configuration files:
- `src/main/resources/application.properties` - Main configuration
- `docker-compose.yml` - Docker services setup
- `init-scripts/question_data.sql` - Database initialization

## Architecture

### Core Entities
- **Question**: Quiz questions with categories and difficulty
- **LearningSession**: User learning sessions with progress tracking
- **SessionQuestion**: Links sessions to questions with ordering
- **QuestionAnswer**: User responses and answer tracking

### Services
- **QuestionService**: Question CRUD operations
- **LearningSessionService**: Session management
- **OpenAIService**: AI integration
- **EventPublisherService**: Kafka event publishing

## Health Check

Application health status: http://localhost:8080/actuator/health

## Development Notes

- Uses Lombok for code reduction
- Bean Validation for input validation
- Global exception handling with `@ControllerAdvice`
- Event-driven architecture with Kafka
- Comprehensive API logging with request/response tracking
- RESTful API design principles