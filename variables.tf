////////// Provider //////////
variable "region" {
  description = "The region of AWS"
  type        = string
  default     = "eu-north-1"
}

variable "account_id" {
  description = "The AWS account ID for SQS and S3 configurations."
  type        = string
}


////////// VPC variables //////////

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "az" {
  description = "The availability zone for the VPC"
  type        = string
  default     = "eu-north-1a"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}


////////// S3 variables //////////

variable "bucket_name" {
  description = "The name of the S3 Bucket"
  type        = string
}

variable "s3_access" {
  description = "The access to the S3 Bucket"
  type = list(string)
  default = ["private", "public"]
}


////////// Existing Users //////////

variable "exist_iam_user_arn" {
  description = "The existing users arn list"
  type = list(string)
}

variable "exist_iam_user_name" {
  description = "The existing users names list"
  type = list(string)
}


////////// IAM's and Roles //////////

variable "role_name" {
  description = "The name of the role for let access for the user to upload files to s3"
  type = string
  default = "user_access_s3_role"
}




////////// SQS //////////

variable "sqs_resource_name" {
  description = "The name of the SQS resource"
  type = string
  default = "queue_message_from_s3_to_lambda"
}