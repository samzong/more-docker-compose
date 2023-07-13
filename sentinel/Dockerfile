FROM openjdk:8u332-jdk-oraclelinux7

WORKDIR /data

EXPOSE 8080

CMD ["java","-Dserver.port=8080", "-Dcsp.sentinel.dashboard.server=localhost:8080", "-Dproject.name=sentinel-dashboard", "-jar", "/data/sentinel-dashboard.jar"]
