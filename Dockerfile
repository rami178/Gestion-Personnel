From tomcat:8-jre8
LABEL MAINTAINER "Rami Khemiri"
COPY /target/Gestion-Personnel-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
