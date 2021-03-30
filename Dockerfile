FROM openjdk:8-alpine

RUN mkdir -p /usr/src/wiremock/mappings

COPY wiremock-standalone-2.26.0.jar /usr/src/wiremock

COPY wiremock-date-request-matching.jar /usr/src/wiremock

COPY health.json /usr/src/wiremock/mappings

WORKDIR /usr/src/wiremock

CMD ["java", "-cp", "wiremock-date-request-matching.jar:wiremock-standalone-2.26.0.jar", "com.github.tomakehurst.wiremock.standalone.WireMockServerRunner", "--global-response-templating", "--extensions", "github.dionefc.wiremock.extentions.matchers.QueryParamLocalDateMatcher" ]