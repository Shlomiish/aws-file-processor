import boto3
from flask import Flask, render_template, request, redirect, url_for, flash
from dotenv import load_dotenv
import os
import uuid

# Load environment variables from .env file
load_dotenv()

# Create a Flask app instance
app = Flask(__name__)
app.secret_key = os.urandom(24)  # Required for flashing messages

# Define the allowed file extensions for upload
app.config['ALLOWED_EXTENSIONS'] = {'png', 'jpg', 'jpeg', 'gif', 'txt'}

# AWS S3 Configuration
AWS_S3_BUCKET_NAME = os.getenv('AWS_S3_BUCKET_NAME')
AWS_REGION = os.getenv('AWS_REGION')
AWS_ACCESS_KEY = os.getenv('AWS_ACCESS_KEY')
AWS_SECRET_KEY = os.getenv('AWS_SECRET_KEY')

# Function to check if the uploaded file has an allowed extension
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in app.config['ALLOWED_EXTENSIONS']

# Function to generate a unique filename by appending UUID
def generate_unique_filename(filename):
    base, ext = os.path.splitext(filename)
    unique_id = str(uuid.uuid4())[:8]  # Generate a short UUID (8 characters)
    return f"{base}_{unique_id}{ext}"

# Function to upload file to S3
def upload_to_s3(file_obj, original_file_name):
    s3_client = boto3.client(
        service_name='s3',
        region_name=AWS_REGION,
        aws_access_key_id=AWS_ACCESS_KEY,
        aws_secret_access_key=AWS_SECRET_KEY
    )
    
    try:
        unique_file_name = generate_unique_filename(original_file_name)
        s3_client.upload_fileobj(file_obj, AWS_S3_BUCKET_NAME, unique_file_name)
        return f"File {unique_file_name} uploaded successfully to S3 bucket {AWS_S3_BUCKET_NAME}."
    except Exception as e:
        return f"Error uploading file to S3: {str(e)}"

# Route for the homepage, displays the upload form
@app.route('/')
def home():
    return render_template('upload.html')

# Route to handle file upload
@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        flash("No file part")
        return redirect(url_for('home'))
    
    file = request.files['file']
    if file.filename == '':
        flash("No selected file")
        return redirect(url_for('home'))
        
    if file and allowed_file(file.filename):
        result = upload_to_s3(file, file.filename)
        flash(result)
        return redirect(url_for('home'))
    else:
        flash("File type not allowed.")
        return redirect(url_for('home'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

