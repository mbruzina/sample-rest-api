FROM --platform=linux/amd64 eclipse-temurin:17-jdk-alpine
VOLUME /tmp
COPY build/libs/spring-boot-rest.jar app.jar
ADD ./newrelic/newrelic.jar /tmp/newrelic/newrelic.jar
ADD ./newrelic/newrelic.yml /tmp/newrelic/newrelic.yml
ENTRYPOINT ["java","-javaagent:/tmp/newrelic/newrelic.jar","-jar","/app.jar"]
