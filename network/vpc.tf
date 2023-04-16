# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.tag
  }
}

# Create Public Subnet for A-Z 1
resource "aws_subnet" "publicSubnet1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnet1
  availability_zone = var.public_subnet1_az
  tags = {
    Name = var.tag
  }

  map_public_ip_on_launch = "true" 
}

# Create Public Subnet for A-Z 2
resource "aws_subnet" "publicSubnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnet2
  availability_zone = var.public_subnet2_az
  tags = {
    Name = var.tag
  }

  map_public_ip_on_launch = "true"
}

# Create Private Subnet for A-Z 1
resource "aws_subnet" "privateSubnet1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet1
  availability_zone = var.private_subnet1_az

  tags = {
    Name = var.tag
  }
}

# Create Private Subnet for A-Z 2
resource "aws_subnet" "privateSubnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet2
  availability_zone = var.private_subnet2_az

  tags = {
    Name = var.tag
  }
}

