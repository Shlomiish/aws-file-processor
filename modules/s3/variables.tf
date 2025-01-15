variable "bucket_name" {
  description = "The name of the S3 Bucket"
  type        = string
}

variable "s3_access" {
  description = "The access to the S3 Bucket"
  type = list(string)
}

variable "exist_iam_user_arn" {
  description = "The IAM user arn that has access to upload to the S3 Bucket"
  type = list(string)
}



variable "queue_message_from_s3_to_lambda_arn" {
  type = string
}