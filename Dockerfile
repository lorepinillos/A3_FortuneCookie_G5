# Stage 1: Development stage
FROM python:3.9 AS development

# Set working directory
WORKDIR /app

# Install necessary tools
RUN apt-get update && apt-get install -y git openssh-client libssl-dev

# Copy the SSH deploy key into the container securely
COPY deploy_key /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

# Add GitHub to known_hosts to avoid SSH prompt
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Clone the private repository
RUN git clone git@github.com:lorepinillos/A3_FortuneCookie_G5.git .

# Remove the SSH key for security
RUN rm -rf /root/.ssh

# Copy only requirements to install dependencies (cache optimization)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

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
