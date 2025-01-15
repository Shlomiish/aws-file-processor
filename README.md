# File Upload Application

A Python Flask application that enables file uploads to AWS S3 with automated metadata extraction and storage using AWS services (S3, SQS, Lambda, and DynamoDB).

## Features

- File upload to AWS S3 using Boto3
- AWS Lambda integration to extract metadata from files
- Automatic storage of metadata in DynamoDB
- Fully containerized Docker application

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
  - Lambda function for metadata processing
  - DynamoDB table for metadata storage
- AWS credentials (Access Key & Secret Key)

## Docker Setup

### 1. Create Environment File

Create a `.env` file in the project root directory with your AWS configuration:

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

The application will be accessible at `http://localhost:5000`

## AWS Service Configuration Requirements

### S3 Bucket
- Create a new S3 bucket
- Configure appropriate permissions
- Update bucket name in `.env` file

### SQS Queue
- Set up queue to receive S3 events
- Configure necessary IAM roles and policies

### Lambda Function
- Create function to process metadata
- Configure SQS trigger
- Set up appropriate IAM roles

### DynamoDB
- Create table for metadata storage
- Configure appropriate access permissions

## Notes

- All required dependencies are included in the Docker container
- No local installation required beyond Docker
- Ensure proper AWS credentials are set in the `.env` file
- Make sure all AWS services are properly configured before running the application

## Security Considerations

- Keep your AWS credentials secure and never commit them to version control
- Use appropriate IAM roles and permissions
- Regularly rotate AWS access keys
- Implement proper error handling for failed uploads

## Support

For issues and feature requests, please create an issue in the repository.
