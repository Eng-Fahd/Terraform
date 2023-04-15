 # Create EC2 for Bastion Host
resource "aws_instance" "bastion" {
  ami           = "ami-0c94855ba95c71c99"  # Amazon Linux 2
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_az1.id
  key_name      = aws_key_pair.ec2.id       # key
  vpc_security_group_ids = [aws_security_group.public_ssh.id]
  
  # Enable the associate_public_ip
  associate_public_ip_address = true
  
  tags = {
    Name = "Bastion Host"
  }
}

# Create EC2 for Application
resource "aws_instance" "application" {
  ami           = "ami-0c94855ba95c71c99"  # Amazon Linux 2
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet_az1.id
  key_name      = aws_key_pair.ec2.id      # key
  vpc_security_group_ids = [aws_security_group.private_ssh_3000.id]
  
  tags = {
    Name = "Application"
  }
}