resource "aws_vpc" "eks_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "eks_subnet_a" {
  vpc_id     = aws_vpc.eks_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a" # Adjust as needed
}

resource "aws_subnet" "eks_subnet_b" {
  vpc_id     = aws_vpc.eks_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2b"
}

resource "aws_internet_gateway" "eks_internet_gateway" {
  vpc_id = aws_vpc.eks_vpc.id
}

resource "aws_route_table" "eks_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_internet_gateway.id
  }
}

resource "aws_route_table_association" "eks_route_table_assoc_a" {
  subnet_id      = aws_subnet.eks_subnet_a.id
  route_table_id = aws_route_table.eks_route_table.id
}

resource "aws_route_table_association" "eks_route_table_assoc_b" {
  subnet_id      = aws_subnet.eks_subnet_b.id
  route_table_id = aws_route_table.eks_route_table.id
}
