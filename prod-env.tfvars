REGION             = "us-east-1"
KEY_NAME           = "Prod-key"
RSA_FILE_NAME      = "Prod-key.pem"
TAG                = "Terraform-Development"
VPC_CIDR           = "172.0.0.0/16"
PUBLIC_SUBNET1     = "172.0.1.0/24"
PUBLIC_SUBNET2     = "172.0.2.0/24"
PRIVATE_SUBNET1    = "172.0.3.0/24"
PRIVATE_SUBNET2    = "172.0.4.0/24"
PUBLIC_SUBNET1_AZ  = "us-east-1a"
PUBLIC_SUBNET2_AZ  = "us-east-1b"
PRIVATE_SUBNET1_AZ = "us-east-1a"
PRIVATE_SUBNET2_AZ = "us-east-1b"
AMI_ID             = "ami-0c94855ba95c71c99" # Amazon Linux 2
INSTANCE_TYPE      = "t2.micro"              # Amazon EC2 free teir  
ENVIRONMENT_EC     = "prod"
NODE_COUNT         = 1
NODE_TYPE          = "cache.t3.micro"
AVAILABILITY_ZONES = ["us-east-1a", "us-east-1b"]

# # ElasticSearch
# DOMAIN             = "proddomain"
# TAG_DOMAIN         = "ProdDomain"
# INSTANCE_TYPE_ES   = "r4.large.elasticsearch"
# VOLUME_TYPE_ES     = "gp2"
# EBS_VOLUME_SIZE    = 10