# Create VPC
resource "aws_vpc" "project-vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "infrastructure-vpc"
  }
}