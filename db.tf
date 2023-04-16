# Create RDS subnet group
resource "aws_db_subnet_group" "example_rds_subnet_group" {
  name       = "example-rds-subnet-group"
  subnet_ids = [module.network.prv_subnet1, module.network.prv_subnet2]
}

# Create RDS instance
resource "aws_db_instance" "example_rds" {
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  db_name                = "rdsTerraform"
  username               = "admin"
  password               = "password"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  db_subnet_group_name   = aws_db_subnet_group.example_rds_subnet_group.id
}

# db Connect mysql -h DB-ARN -P 3306 -u USER -p