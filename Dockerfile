FROM openjdk:8-alpine

RUN mkdir -p /usr/src/wiremock/mappings

COPY wiremock-standalone-2.26.0.jar /usr/src/wiremock

COPY health.json /usr/src/wiremock/mappings

WORKDIR /usr/src/wiremock

CMD ["java", "-jar", "wiremock-standalone-2.26.0.jar"]