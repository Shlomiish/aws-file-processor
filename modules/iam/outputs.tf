output "aws_iam_role_arn" {
  value = module.s3_iam.aws_iam_role_arn
}

output "lambda_role_arn" {
  value = module.lambda_iam.lambda_role_arn
}