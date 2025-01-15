variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "List of public subnet CIDR"
  type        = string
}


variable "az" {
  description = "availability zone"
  type        = string
}

