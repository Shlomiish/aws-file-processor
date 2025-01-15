variable "queue_message_from_s3_to_lambda_arn" {
  description = "The arn of the SQS queue that get message from the s3"
  type = string
}

variable "lambda_role_arn" {
  description = "The arn of the lambda role thats give access to lambda to interact with AWS services"
  type = string
}