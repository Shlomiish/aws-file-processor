variable "queue_message_from_s3_to_lambda_arn" {
  description = "The arn of the SQS queue that get message from the s3"
  type = string
}

variable "dynamo_db_arn" {
  description = "The arn of the dynamo_db"
  type = string
}