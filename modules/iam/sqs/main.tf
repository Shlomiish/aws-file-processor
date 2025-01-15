//// create SQS queue policy resource ////
resource "aws_sqs_queue_policy" "s3_to_sqs_policy" {
  queue_url = var.queue_message_from_s3_to_lambda_url

  policy = jsonencode({
    Version = "2012-10-17",
    Statement: [
      {
        Sid: "AllowS3ToSendMessages",
        Effect: "Allow",
        Principal: {
          Service: "s3.amazonaws.com"
        },
        Action: "sqs:SendMessage",
        Resource: var.queue_message_from_s3_to_lambda_arn,
        Condition: {
          StringEquals: {
            "aws:SourceAccount": var.account_id
          },
          ArnLike: {
            "aws:SourceArn": var.s3_bucket_arn
          }
        }
      }
    ]
  })
}
