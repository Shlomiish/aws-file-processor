# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code and .env file into the container
COPY . .

# Expose the port the app will run on
EXPOSE 5000

# Run the Flask app (this will use the .env file for configuration)
CMD ["python", "app.py"]

