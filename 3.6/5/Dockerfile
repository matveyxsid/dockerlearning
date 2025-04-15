FROM openjdk:17-jdk
LABEL maintainer="1" \
      version="1.0.0" \
      description="Test ONBUILD"
ENV SPRING_PROFILES_ACTIVE=default
ENV SERVER_PORT=8080
ONBUILD COPY target/*.jar /app/app.jar
ONBUILD EXPOSE 8080
CMD ["java", "-jar", "/app/app.jar"]

