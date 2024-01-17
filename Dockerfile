FROM tomcat:jre8-alpine
LABEL MAINTAINER "Rami Khemiri"
EXPOSE 8080
CMD ["catalina.sh", "run"]
