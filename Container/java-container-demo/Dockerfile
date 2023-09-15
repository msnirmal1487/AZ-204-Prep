# https://docs.docker.com/language/java/build-images/
FROM eclipse-temurin:17
RUN echo hello from demo container app
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve
RUN ls
COPY src ./src
CMD ["ls"]
CMD ["./mvnw", "spring-boot:run"]