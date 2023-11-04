# Create NAT Gateway to attach to private route table
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = {
    Name = "nat-gw"
  }

  depends_on = [aws_internet_gateway.igw]

}

# Creating the EIP for the NAT Gateway
resource "aws_eip" "my_eip" {
  tags = {
    Name = "eip"
  }
}
