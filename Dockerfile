FROM openjdk:8-jdk-alpine
VOLUME /tmp
WORKDIR /root
RUN mkdir logs
ARG JAR_FILE
ADD ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-XX:+PrintGCDetails", "-Xloggc:logs/gc.log", "-XX:+PrintGCTimeStamps", "-jar","app.jar", ">","logs/startup.log", "2>&1"]
#ENTRYPOINT ["sh"]
# java  -Xms512m -Xmx1024m  -XX:+PrintGCDetails -Xloggc:logs/gc.log -XX:+PrintGCTimeStamps -jar app.jar > logs/startup.log 2>&1
