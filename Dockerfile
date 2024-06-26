# Etapa 1: Construir o JAR usando Maven
FROM maven:3.8.6-openjdk-8 AS build
WORKDIR /app
COPY . /app
RUN mvn clean package

# Etapa 2: Criar a imagem final
FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/name-server-0.0.1-SNAPSHOT.jar /app/name-server.jar
EXPOSE 8761
ENTRYPOINT ["java", "-jar", "/app/name-server.jar"]
