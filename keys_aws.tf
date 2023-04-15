resource "tls_private_key" "privatekey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "ec2" {
  key_name   = "mykey"
  public_key = tls_private_key.privatekey.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.privatekey.private_key_openssh}' > ~/key.openssh"
  }
}

