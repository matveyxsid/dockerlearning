FROM maven:3.8-openjdk-17 AS builder
WORKDIR /build
COPY pom.xml ./
RUN mvn dependency:go-offline
COPY src ./src/
RUN mvn package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /build/target/app.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
