variable "account_id" {
  description = "The AWS account ID for SQS and S3 configurations."
  type        = string
}


variable "s3_bucket_arn" {
  description = "The s3 bucket arn"
  type = string
}

variable "queue_message_from_s3_to_lambda_url" {
  description = "The url of the sqs"
  type = string
}

variable "queue_message_from_s3_to_lambda_arn" {
  description = "The arn of the sqs"
  type = string
}