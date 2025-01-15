resource "aws_lambda_function" "process_file_lambda" {
  filename      = "${path.module}/src/lambda_function.zip"
  function_name = "process_file_function"
  role         = var.lambda_role_arn
  handler      = "lambda_function.lambda_handler"  # Python file name . function name
  runtime      = "python3.9"               # Or your preferred Python version
}


# Add this new resource to create the trigger
resource "aws_lambda_event_source_mapping" "sqs_lambda_trigger" {
  event_source_arn = var.queue_message_from_s3_to_lambda_arn
  function_name    = aws_lambda_function.process_file_lambda.arn
  batch_size       = 5
  enabled          = true
}




