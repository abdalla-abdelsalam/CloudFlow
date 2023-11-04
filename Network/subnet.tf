# Create Public Subnets
resource "aws_subnet" "public_subnet" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  availability_zone       = var.azs[count.index]
  cidr_block              = var.sub_pub[count.index]
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public-subnet"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/eks-cluster" = "owned" // shared
  }
}

# Create Private Subnets
resource "aws_subnet" "private_subnet" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  availability_zone = var.azs[count.index]
  cidr_block        = var.sub_priv[count.index]

  tags = {
    Name = "private_subnet"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/eks-cluster"      = "owned"
  }
}



