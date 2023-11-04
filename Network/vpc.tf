# Create VPC
resource "aws_vpc" "main" {
  cidr_block = var.cidr

  tags = {
    Name = "vpc"
  }
}