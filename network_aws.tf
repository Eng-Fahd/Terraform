# Configure AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create Internet-Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# Create Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

# Create Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id
}

# Create Public Subnet for A-Z 1
resource "aws_subnet" "public_subnet_az1" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public Subnet - Availability Zone 1"
  }
  map_public_ip_on_launch = true
}

# Create Public Subnet for A-Z 2
resource "aws_subnet" "public_subnet_az2" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Public Subnet - Availability Zone 2"
  }
  map_public_ip_on_launch = true
}

# Associate Public Route Table with Public Subnets
resource "aws_route_table_association" "public_subnet_az1_association" {
  subnet_id = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_az2_association" {
  subnet_id = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public_route_table.id
}

# Create Private Subnet for A-Z 1
resource "aws_subnet" "private_subnet_az1" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private Subnet - Availability Zone 1"
  }
}

# Create Private Subnet for A-Z 2
resource "aws_subnet" "private_subnet_az2" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private Subnet - Availability Zone 2"
  }
}

# Associate Private Route Table with Private Subnets
resource "aws_route_table_association" "private_subnet_az1_association" {
  subnet_id = aws_subnet.private_subnet_az1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet_az2_association" {
  subnet_id = aws_subnet.private_subnet_az2.id
  route_table_id = aws_route_table.private_route_table.id
}

# Create Security Group for SSH Access from Anywhere open to all
resource "aws_security_group" "public_ssh" {
  name_prefix = "public_ssh"
  description = "Allow SSH Access from Anywhere"
  vpc_id = aws_vpc.my_vpc.id
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create Security Group for SSH and Port 3000 from VPC CIDR
resource "aws_security_group" "private_ssh_3000" {
  name_prefix = "private_ssh_3000"
  description = "Allow SSH and Port 3000 from VPC CIDR"
  vpc_id = aws_vpc.my_vpc.id
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.my_vpc.cidr_block]
  }
  
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.my_vpc.cidr_block]
  }
}
