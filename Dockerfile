FROM tomcat:latest

ADD *.war /usr/local/tomcat/webapps/

EXPOSE 8080 9090

CMD ["catalina.sh", "run"]
