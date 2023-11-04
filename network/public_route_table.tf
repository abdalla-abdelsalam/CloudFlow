# Create Public Route Table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.project-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "pub-route-table"
  }

}

# Associate Public Subnets with Public Route Table
resource "aws_route_table_association" "routeToSubnet-pubconnection" {
  count          = 2
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public-route-table.id
}


