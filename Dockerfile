FROM maven:3.9.9-eclipse-temurin-21 AS builder

WORKDIR /build
COPY ./spring-framework-petclinic .
RUN mvn package

FROM tomcat:9

COPY --from=builder /build/target/petclinic.war /usr/local/tomcat/webapps/
