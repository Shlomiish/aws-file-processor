variable "bucket_name" {
  description = "The name of the S3 Bucket"
  type        = string
}

variable "exist_iam_user_name" {
  description = "The existing users names list"
  type = list(string)
}

variable "role_name" {
  description = "The name of the role for let access for the user to upload files to s3"
  type = string
}