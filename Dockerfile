FROM java:8
COPY ./target/Gestion-Personnel-0.0.1-SNAPSHOT.war Gestion-Personnel-0.0.1-SNAPSHOT.war
ENTRYPOINT ["java", "-jar", "Gestion-Personnel-0.0.1-SNAPSHOT.war"]
