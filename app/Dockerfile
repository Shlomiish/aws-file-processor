# Use the official Python base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the application files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the .env file to the container (optional if users will provide it directly)
COPY .env /app/.env

# Expose port
EXPOSE 5000

# Run the Flask app
CMD ["python", "upload-s3.py"]

