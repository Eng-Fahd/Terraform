output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.my_vpc.cidr_block
}

output "pub_subnet1" {
  value = aws_subnet.publicSubnet1.id
}

output "pub_subnet2" {
  value = aws_subnet.publicSubnet2.id
}

output "prv_subnet1" {
  value = aws_subnet.privateSubnet1.id
}

output "prv_subnet2" {
  value = aws_subnet.privateSubnet2.id
}