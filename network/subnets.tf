# Create Public Subnets
resource "aws_subnet" "public_subnet" {
  count                   = 2
  vpc_id                  = aws_vpc.project-vpc.id
  availability_zone       = var.availability_zones[count.index]
  cidr_block              = var.pub_subnet[count.index]
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public-subnet"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/goviolin-eks" = "owned" 
  }
}

# Create Private Subnets
resource "aws_subnet" "private_subnet" {
  count             = 2
  vpc_id            = aws_vpc.project-vpc.id
  availability_zone = var.availability_zones[count.index]
  cidr_block        = var.priv_subnet[count.index]

  tags = {
    Name = "private_subnet"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/goviolin-eks"      = "owned"
  }
}



