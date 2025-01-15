output "dynamo_db_arn" {
  value = aws_dynamodb_table.processed_files.arn
}