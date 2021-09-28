FROM openjdk:8
EXPOSE 8080
ADD target/app-1-1.0-SNAPSHOT.jar app-1-1.0-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/dapp-1-1.0-SNAPSHOT.jar"]
