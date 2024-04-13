FROM maven AS builder 
COPY . .
RUN mvn install

FROM tomcat
COPY --from=builder /target/Hello.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]