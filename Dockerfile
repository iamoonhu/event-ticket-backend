# Stage 1: Build the JAR
FROM eclipse-temurin:21-jdk AS builder
WORKDIR /app

# Copy Maven wrapper and pom.xml first (for layer caching)
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Download dependencies
RUN ./mvnw dependency:go-offline -B

# Copy source and build
COPY src ./src
RUN ./mvnw clean package -DskipTests

# Stage 2: Run the JAR
FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=builder /app/target/backend-event.jar backend-event.jar
EXPOSE 5000
ENTRYPOINT ["java", "-jar", "backend-event.jar"]
