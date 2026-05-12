FROM eclipse-temurin:21-jdk
COPY target/backend-event.jar backend-event.jar
EXPOSE 5000
ENTRYPOINT ["java","-jar","/backend-event.jar"]