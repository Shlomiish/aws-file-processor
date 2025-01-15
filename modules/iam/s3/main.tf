# Get current AWS account ID
data "aws_caller_identity" "current" {}

# Create IAM role with S3 access
resource "aws_iam_role" "s3_role" {
  name     = "upload_file_s3_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = {
         Service = "s3.amazonaws.com"
        }
    }]
  })
}

# Attach the S3 access policy to IAM role
resource "aws_iam_role_policy_attachment" "s3_access_policy" {
  role       = aws_iam_role.s3_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# Create policy for user to assume role
resource "aws_iam_user_policy" "assume_role_policy" {
  name = var.role_name
  user = var.exist_iam_user_name[0]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = "sts:AssumeRole"
      Resource = aws_iam_role.s3_role.arn
    }]
  })
}