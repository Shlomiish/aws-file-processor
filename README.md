File Upload Application
This project provides a simple Python Flask application that allows users to upload files to an AWS S3 bucket. Upon upload, AWS services trigger a series of events:

The file is uploaded to an S3 bucket.
The S3 bucket triggers an SQS message.
The SQS message triggers a Lambda function.
The Lambda function extracts metadata from the file and stores it in DynamoDB.
Features
File upload to AWS S3 using Boto3.
AWS Lambda integration to extract metadata from files.
Automatic storage of metadata in DynamoDB.
Fully containerized Docker application.
Docker Setup
To get the application running with Docker, follow these steps:

1. Create a .env File
Create a .env file in the project root directory and add the following AWS configuration. Replace the values with your own AWS credentials.

env
Copy code
# AWS S3 Configuration
AWS_S3_BUCKET_NAME = 'your-s3-bucket-name'
AWS_REGION = 'your-aws-region'
AWS_ACCESS_KEY = 'your-aws-access-key'
AWS_SECRET_KEY = 'your-aws-secret-key'
2. Build the Docker Image
In the terminal, navigate to the project directory where the Dockerfile is located and run the following command to build the Docker image:

bash
Copy code
docker build -t file-upload-app .
3. Run the Docker Container
After building the Docker image, run the container using this command:

bash
Copy code
docker run -p 5000:5000 file-upload-app
The application will now be accessible at http://localhost:5000 in your browser.

How It Works
The user selects a file to upload via the web interface.
The file is uploaded to the specified S3 bucket.
An SQS message is triggered by the S3 upload event.
The SQS message is received by a Lambda function.
The Lambda function extracts metadata from the uploaded file and stores it in DynamoDB.
AWS Configuration
Ensure the following AWS services are properly configured in your AWS account:

S3 Bucket: Create an S3 bucket and specify the name in your .env file.
SQS Queue: Set up an SQS queue to listen for S3 events.
Lambda Function: Create a Lambda function to process the file metadata.
DynamoDB: Create a DynamoDB table to store the metadata.
Notes
Make sure you have your AWS credentials (Access Key & Secret Key) correctly set up in the .env file.
The Docker container includes all dependencies for running the Flask app, so no need to install anything locally.

