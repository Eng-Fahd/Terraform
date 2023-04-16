

# Create Elasticache subnet group
resource "aws_elasticache_subnet_group" "example_elasticache_subnet_group" {
  name       = "example-elasticache-subnet-group"
  subnet_ids = [module.network.prv_subnet1]
}


# Create Elasticache instance
resource "aws_elasticache_cluster" "example_elasticache" {
  cluster_id           = "mycluster"
  engine               = "redis"
  engine_version       = "6.x"
  node_type            = "cache.t4g.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
  port                 = 6379
  security_group_ids   = [aws_security_group.elasticache_security_group.id]
  subnet_group_name    = aws_elasticache_subnet_group.example_elasticache_subnet_group.id
}

