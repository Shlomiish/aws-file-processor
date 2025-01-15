output "queue_message_from_s3_to_lambda_arn" {
  value = aws_sqs_queue.queue_message_from_s3_to_lambda.arn
}

output "queue_message_from_s3_to_lambda_url" {
  value = aws_sqs_queue.queue_message_from_s3_to_lambda.url
}