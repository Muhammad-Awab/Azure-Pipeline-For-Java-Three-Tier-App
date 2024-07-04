FROM openjdk:17-alpine
WORKDIR /app
COPY target/spring-boot-docker-complete-0.0.1-SNAPSHOT.jar /app/spring-boot-docker-complete-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/spring-boot-docker-complete-0.0.1-SNAPSHOT.jar"]