# Define the DynamoDB table
resource "aws_dynamodb_table" "processed_files" {
  name           = "processed_files"
  hash_key       = "shlomi_key"
  attribute {
    name = "shlomi_key"
    type = "S"  # 'S' stands for string
  }
  billing_mode   = "PAY_PER_REQUEST"
}
