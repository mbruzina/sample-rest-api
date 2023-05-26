FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
COPY build/libs/spring-boot-rest.jar app.jar
ADD ./newrelic/newrelic.jar /tmp/newrelic/newrelic.jar
ADD ./newrelic/newrelic.yml /tmp/newrelic/newrelic.yml
#ENV JAVA_OPTS="$JAVA_OPTS -javaagent:/tmp/newrelic/newrelic.jar"
ENTRYPOINT ["java","-javaagent:/tmp/newrelic/newrelic.jar","-jar","/app.jar"]