FROM eclipse-temurin:17-jre

WORKDIR /app

# Elastic APM Agent
ADD https://repo1.maven.org/maven2/co/elastic/apm/elastic-apm-agent/1.47.0/elastic-apm-agent-1.47.0.jar /elastic-apm-agent.jar

COPY build/libs/*.jar app.jar

ENTRYPOINT ["java", \
  "-javaagent:/elastic-apm-agent.jar", \
  "-Delastic.apm.service_name=${APP_NAME}", \
  "-Delastic.apm.environment=${APP_ENV}", \
  "-Delastic.apm.server_urls=${ELASTIC_APM_SERVER_URL}", \
  "-Delastic.apm.secret_token=${ELASTIC_APM_SECRET_TOKEN}", \
  "-Delastic.apm.application_packages=${ELASTIC_APM_APPLICATION_PACKAGES}", \
  "-jar", "/app/app.jar"]
