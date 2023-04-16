# Create Internet-Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = var.tag
  }
}

# Create Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = var.tag
  }
}

# Associate Public Route Table with Public Subnets
resource "aws_route_table_association" "publicRouteAssociation" {
  subnet_id      = aws_subnet.publicSubnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "publicRouteAssociation2" {
  subnet_id     = aws_subnet.publicSubnet2.id
  route_table_id = aws_route_table.public_route_table.id
}
