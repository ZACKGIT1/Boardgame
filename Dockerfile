# Use a maintained JDK base with Alpine
FROM eclipse-temurin:17-jre-alpine

# Expose app port
EXPOSE 8080

# Set app home
ENV APP_HOME=/usr/src/app

# Create non-root user and group
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser

# Create app directory with correct ownership
RUN mkdir -p $APP_HOME && chown -R appuser:appgroup $APP_HOME

# Copy jar into container
COPY target/*.jar $APP_HOME/app.jar

# Change working directory
WORKDIR $APP_HOME

# Switch to non-root user
USER appuser

# Run application
CMD ["java", "-jar", "app.jar"]
