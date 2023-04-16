# Create EC2 for Bastion Host
resource "aws_instance" "bastion" {
  ami                    = var.AMI_ID
  instance_type          = var.INSTANCE_TYPE
  subnet_id              = module.network.pub_subnet1
  key_name               = var.KEY_NAME # key
  vpc_security_group_ids = [aws_security_group.public_ssh.id]

  # Enable the associate_public_ip
  associate_public_ip_address = true

  tags = {
    Name = "Bastion Host"
  }

  user_data = <<-EOF
   #!/bin/bash
   echo '${local.private_key}' > /home/ec2-user/${var.RSA_FILE_NAME}
   chmod 400 /home/ec2-user/TF-key.pem
   sudo yum update
   sudo yum install mariadb
   EOF
}


# Create EC2 for Application
resource "aws_instance" "application" {
  ami                    = var.AMI_ID # Amazon Linux 2
  instance_type          = var.INSTANCE_TYPE
  subnet_id              = module.network.prv_subnet1
  key_name               = var.KEY_NAME # key
  vpc_security_group_ids = [aws_security_group.private_ssh_3000.id]

  tags = {
    Name = "Application"
  }
  user_data = <<-EOF
    #!/bin/bash
    curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
    sudo yum update
    sudo yum install -y nodejs npm
    sudo yum install -y coreutils
    sudo systemctl enable nodejs
    sudo systemctl start nodejs

    mkdir myapp
    cd myapp
    npm init -y
    npm install express --save

    echo "const express = require('express');
    const app = express();
    const port = 3000;

    app.get('/', (req, res) => {
      res.send('\n \n Hello Eng Fahd this is Your First DevOps Project\n \n');
    });

    app.listen(port, () => {
      console.log('Server listening on port ' + port);
    });" > index.js
    echo '${local.private_key}' > /home/ec2-user/TF-key.pem

    echo "Starting the Node.js app..."
    sudo nohup node index.js &
    echo "Node.js app started with process PID $!"

    EOF
}

resource "null_resource" "get_instance_ip" {
  depends_on = [
    aws_instance.bastion
  ]
  provisioner "local-exec" {
    command = "echo ${aws_instance.bastion.public_ip} >> public_ips.txt"
  }
}

# echo "Node.js app started with process ID $!"
# echo "<html><body><div>Public $(hostname -f)</div></body></html>" > app.js
# sudo nohup node /home/ec2-user/app.js > app.log 2>&1 &


#!/bin/bash

# Install Node.js and npm
# curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
# sudo yum install -y nodejs npm
# sudo yum install -y coreutils

# mkdir myapp
# cd myapp
# npm init -y
# npm install express --save

# echo "const express = require('express');
# const app = express();
# const port = 3000;

# app.get('/', (req, res) => {
#   res.send('Hello, world!');
# });

# app.listen(port, () => {
#   console.log('Server listening on port ' + port);
# });" > index.js


############################################
# curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
#               sudo yum update -y
#               sudo yum install -y nodejs npm coreutils
#               sudo systemctl enable nodejs
#               sudo systemctl start nodejs
#               sudo mkdir /home/ec2-user/node-app
#               sudo cd /home/ec2-user/node-app
#               sudo npm init -y
#               sudo npm install express --save
#               echo "const express = require('express');
#               const app = express();
#               const port = 3000;
#               app.get('/', (req, res) => {res.send('\n \n Hello Eng Fahd this is Your First DevOps Project\n \n'); });
#               app.listen(port, () => {console.log('Server Listening on port ' + port); });" > /home/ec2-user/app.js


