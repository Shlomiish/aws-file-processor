provider "aws" {
  region = var.region
}

terraform {
  required_providers {
     helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12.1"
    }
  }
}


module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  az                  = var.az
}

module "s3" {
  source = "./modules/s3"
  bucket_name = var.bucket_name
  s3_access = var.s3_access
  exist_iam_user_arn = var.exist_iam_user_arn
  queue_message_from_s3_to_lambda_arn = module.sqs.queue_message_from_s3_to_lambda_arn
}


module "iam" {
 source = "./modules/iam"
 bucket_name = var.bucket_name
 exist_iam_user_name = var.exist_iam_user_name
 role_name = var.role_name
 s3_bucket_arn = module.s3.s3_bucket_arn
 account_id = var.account_id  
 queue_message_from_s3_to_lambda_arn = module.sqs.queue_message_from_s3_to_lambda_arn
 queue_message_from_s3_to_lambda_url = module.sqs.queue_message_from_s3_to_lambda_url
 dynamo_db_arn = module.dynamo_db.dynamo_db_arn
}

module "sqs" {
  source = "./modules/sqs"
  sqs_resource_name = var.sqs_resource_name
}

module "lambda" {
  source = "./modules/lambda"
  queue_message_from_s3_to_lambda_arn = module.sqs.queue_message_from_s3_to_lambda_arn
  lambda_role_arn = module.iam.lambda_role_arn
}

module "dynamo_db" {
  source = "./modules/dynamo_db"
}