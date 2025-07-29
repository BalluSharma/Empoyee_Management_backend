FROM maven:3.9.5-openjdk-22 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk-22.0.1-slim
COPY --from=build /target/ems-backend-0.0.1-SNAPSHOT.jar ems-backend.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","ems-backend.jar"]

