# Etapa 1: Construir o JAR usando Maven
FROM eclipse-temurin:21-jre-alpine 
COPY target/*.jar app.jar 
EXPOSE 8761 
ENTRYPOINT [ "java", "-jar", "/app.jar" ]