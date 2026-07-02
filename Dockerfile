FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /app
COPY . .
RUN ./mvnw -Dmaven.test.skip=true package

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
ENV PORT=8080
COPY --from=build /app/structurizr-application/target/structurizr-1.0.0.war /app/structurizr.war
EXPOSE 8080
CMD ["java", "-jar", "/app/structurizr.war"]
