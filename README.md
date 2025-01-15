# File Upload Application

A Python Flask application that enables file uploads to AWS S3 with automated metadata extraction and storage using AWS services (S3, SQS, Lambda, and DynamoDB).


## Architecture Flow

1. User uploads file through web interface
2. File is stored in AWS S3 bucket
3. S3 bucket triggers an SQS message
4. SQS message triggers Lambda function
5. Lambda function extracts metadata and stores it in DynamoDB

## Prerequisites

- Docker installed on your machine
- AWS account with necessary services configured:
  - S3 bucket
  - SQS queue configured to listen for S3 events
  - Lambda function for metadata processing (The function inside modules/lambda/src)
  - DynamoDB table for metadata storage
- AWS credentials (Access Key & Secret Key)

## Docker Setup

### 1. Create Environment File

Create a `.env` file in the folder where the Dockerfile is, with your AWS configuration:

```
# AWS S3 Configuration
AWS_S3_BUCKET_NAME=your-s3-bucket-name
AWS_REGION=your-aws-region
AWS_ACCESS_KEY=your-aws-access-key
AWS_SECRET_KEY=your-aws-secret-key
```

### 2. Build Docker Image

Navigate to the project directory and build the Docker image:

```bash
docker build -t file-upload-app .
```

### 3. Run Docker Container

Start the container:

```bash
docker run -p 5000:5000 file-upload-app
```

