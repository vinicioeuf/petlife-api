# syntax=docker/dockerfile:1.7
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /workspace
COPY pom.xml ./
RUN mvn -B dependency:go-offline
COPY src ./src
RUN mvn -B package -DskipTests

FROM eclipse-temurin:17-jre AS runtime
WORKDIR /app
COPY --from=builder /workspace/target/petlife-api-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENV DB_HOST=petlife_db-petlife \
    DB_PORT=3306 \
    DB_NAME=petlife \
    DB_USER=petlife_user \
    DB_PASSWORD=8-A&RL4jTSVfhDi56G
ENTRYPOINT ["java","-jar","/app/app.jar"]
