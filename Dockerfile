
FROM maven:3.9.9-eclipse-temurin-17

# Install Chromium and ChromeDriver
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy Maven configuration
COPY pom.xml .

# Copy TestNG configuration
COPY testng.xml .

# Copy source code and webpage
COPY src ./src
COPY webpage ./webpage

# Run Selenium TestNG tests
CMD ["mvn", "clean", "test"]
