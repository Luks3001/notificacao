FROM gradle:8.7-jdk17 AS BUILD
WORKDIR /app
COPY . .
RUN gradle build --no-daemon


FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY --from=build /app/build/libs/*.jar /app/notificacao.jar

EXPOSE 8084

CMD ["java", "-jar", "/app/notificacao.jar"]
