//// create S3 bucket resource ////
resource "aws_s3_bucket" "my_bucket" {
  bucket        = var.bucket_name
  acl           = var.s3_access[0]

  versioning {
    enabled = false
  }

  lifecycle {
    prevent_destroy = false
  }
}


 //// Attach bucket policy to S3 bucket ////
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id
  
  policy = <<EOT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "${var.exist_iam_user_arn[0]}"
            },
            "Action": "s3:PutObject",
            "Resource": [
                "${aws_s3_bucket.my_bucket.arn}",
                "${aws_s3_bucket.my_bucket.arn}/*"
            ]
        }
    ]
}
EOT
}


//// Create S3 Event Notification ////
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.my_bucket.id

  queue {
    queue_arn     = var.queue_message_from_s3_to_lambda_arn
    events        = ["s3:ObjectCreated:*"]
  }

  depends_on = [var.queue_message_from_s3_to_lambda_arn]
}


