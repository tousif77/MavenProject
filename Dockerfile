FROM java
ADD target/MavenProject-0.0.1-SNAPSHOT.jar //
ENTRYPOINT ["java", "-jar", "/MavenProject-0.0.1-SNAPSHOT.jar"]
