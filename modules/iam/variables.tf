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


variable "account_id" {
  description = "The AWS account ID for SQS and S3 configurations."
  type        = string
}


variable "s3_bucket_arn" {
  description = "The s3 bucket arn"
  type = string
}

variable "queue_message_from_s3_to_lambda_arn" {
  description = "The arn of the SQS queue that get message from the s3"
  type = string
}

variable "queue_message_from_s3_to_lambda_url" {
  description = "The url of the sqs"
  type = string
}

variable "dynamo_db_arn" {
  description = "The arn of the dynamo_db"
  type = string
}

