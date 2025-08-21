# Use a maintained JDK base with Alpine
FROM eclipse-temurin:17-jre-alpine

# Expose app port
EXPOSE 8080

# Set app home
ENV APP_HOME=/usr/src/app

# Copy jar into container
COPY target/*.jar $APP_HOME/app.jar

# Set working directory
WORKDIR $APP_HOME

# Run application
CMD ["java", "-jar", "app.jar"]
