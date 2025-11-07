FROM eclipse-temurin:21-alpine

LABEL maintainer="jgomez560@soyudemedellin.edu.co"

COPY target/*.jar /home/spring-petclinic.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/home/spring-petclinic.jar"]
