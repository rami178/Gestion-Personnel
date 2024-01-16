FROM tomcat:jre8-alpine
LABEL MAINTAINER "Rami Khemiri"
ADD Gestion-Personnel.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]