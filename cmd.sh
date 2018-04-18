# build image & dockerfile build
./mvnw install dockerfile:build
docker run -e "SPRING_PROFILES_ACTIVE=prod" -p 8080:8080 -t zpng/demo2:latest