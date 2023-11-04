variable "aws_region" {
  description = "The AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "sub_public" {
  description = "CIDR blocks for the public subnets"
  type        = list(any)
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = list(any)
}

variable "sub_private" {
  description = "CIDR blocks for the private subnets"
  type        = list(any)
}



