# Create Internet Gateway to attach to public route table
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.project-vpc.id

  tags = {
    Name = "internet-gateway"
  }
}

