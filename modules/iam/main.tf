module "s3_iam" {
  source = "./s3"
  bucket_name = var.bucket_name
  exist_iam_user_name = var.exist_iam_user_name
  role_name = var.role_name
}

module "lambda_iam" {
  source = "./lambda"
  queue_message_from_s3_to_lambda_arn = var.queue_message_from_s3_to_lambda_arn
  dynamo_db_arn = var.dynamo_db_arn
}

module "sqs_iam" {
  source = "./sqs"
  s3_bucket_arn = var.s3_bucket_arn
  account_id = var.account_id
  queue_message_from_s3_to_lambda_url = var.queue_message_from_s3_to_lambda_url
  queue_message_from_s3_to_lambda_arn = var.queue_message_from_s3_to_lambda_arn
}