FROM openjdk:8-jre-slim
WORKDIR /app
COPY /application.properties /app/application.properties
COPY /target/embedash-1.1-SNAPSHOT.jar /app/target/embedash-1.1-SNAPSHOT.jar
CMD ["java", "-jar", "/app/target/embedash-1.1-SNAPSHOT.jar", "--spring.config.location=/app/application.properties"]
