FROM tomcat:8
ADD ./target/addressbook.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]

