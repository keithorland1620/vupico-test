
FROM maven:3.8.4-openjdk-11 AS builder

WORKDIR /usr/src/app

COPY . .

RUN mvn clean package

FROM openjdk:11-jre-slim

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/target/dependency/webapp-runner.jar .

COPY --from=builder /usr/src/app/target/onlinebookstore.war .

EXPOSE 8080

CMD ["java", "-jar", "webapp-runner.jar", "onlinebookstore.war"]