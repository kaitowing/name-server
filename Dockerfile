FROM eclipse-temurin:21-jdk-alpine AS build

WORKDIR /app

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .

RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline

COPY src src
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:21-jre-alpine AS final

WORKDIR /app

COPY --from=build /app/target/*.jar /app/app.jar

EXPOSE 8761

ENTRYPOINT [ "java", "-jar", "/app/app.jar" ]