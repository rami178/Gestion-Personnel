FROM tomcat:jre8-alpine
LABEL MAINTAINER "Rami Khemiri"
ADD .target/Gestion-Personnel-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
