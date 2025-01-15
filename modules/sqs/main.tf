//// create SQS resource ////
resource "aws_sqs_queue" "queue_message_from_s3_to_lambda" {
  name                      = var.sqs_resource_name
  max_message_size          = 256000              # Maximum message size of 256KB
  message_retention_seconds = 86400               # Messages are kept for 1 day
  receive_wait_time_seconds = 10                  # Long polling waits up to 10 seconds for messages
}

