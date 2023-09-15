Demo project to run a springboot app in container

commands used:

Change the java version for the current session
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home

maven command to run the spring boot app
./mvnw spring-boot:run

Docker Commands

docker build --tag java-docker-demo . #taggedby default as latest
docker build --tag java-docker-demo:v1.0.0 . # docker build with tag
docker images
docker tag java-docker-demo:latest java-docker-demo:v-1.0.0 # tag a image using the image name and tag as source
docker tag 9b9f99d85573 java-docker-demo:v1.0.0 # tag a image using the image id as source
docker rmi java-docker-demo:v-1.0.0


docker run --publish 8080:8080 java-docker-demo
docker run -d --publish 8080:8080 java-docker-demo # run container in detached mode
docker run -d --publish 8080:8080 --name java-docker-demo java-docker-demo

docker ps # shows running containers
docker ps -a  # shows running and stopped containers