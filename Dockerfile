FROM tomcat:9.0-jdk21

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/*.war /usr/local/tomcat/webapps/LoginWebApp.war

EXPOSE 8081

CMD ["catalina.sh", "run"]
