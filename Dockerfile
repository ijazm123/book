FROM tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT
ADD ./target/addressbook.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]

