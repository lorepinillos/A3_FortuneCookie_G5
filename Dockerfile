# Stage 1: Development stage
FROM python:3.9 AS development

# Set working directory
WORKDIR /app

# Copy only requirements to install dependencies (cache optimization)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files, including templates
COPY . .

# Expose Flask development port
EXPOSE 5000

# Run the application in development mode
CMD ["python", "app.py"]

# Stage 2: Production stage
FROM python:3.9-slim AS production

# Set working directory
WORKDIR /app

# Copy dependencies from the development stage
COPY --from=development /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages

# Copy only the necessary application files, including templates
COPY app.py .
COPY requirements.txt .
COPY templates ./templates

# Install only production dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose Flask production port
EXPOSE 5000

# Run the application in production mode
CMD ["python", "app.py"]
