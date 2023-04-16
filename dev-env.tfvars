REGION             = "us-east-1"
KEY_NAME           = "Dev-key"
RSA_FILE_NAME      = "Dev-key.pem"
TAG                = "Development-Workspace"
VPC_CIDR           = "10.0.0.0/16"
PUBLIC_SUBNET1     = "10.0.1.0/24"
PUBLIC_SUBNET2     = "10.0.2.0/24"
PRIVATE_SUBNET1    = "10.0.3.0/24"
PRIVATE_SUBNET2    = "10.0.4.0/24"
PUBLIC_SUBNET1_AZ  = "us-east-1a"
PUBLIC_SUBNET2_AZ  = "us-east-1b"
PRIVATE_SUBNET1_AZ = "us-east-1a"
PRIVATE_SUBNET2_AZ = "us-east-1b"
AMI_ID             = "ami-0c94855ba95c71c99" # Amazon Linux 2
INSTANCE_TYPE      = "t2.micro"              # Amazon EC2 free teir  
ENVIRONMENT_EC     = "dev"
NODE_COUNT         = 1
NODE_TYPE          = "cache.t3.micro"
AVAILABILITY_ZONES = ["us-east-1a", "us-east-1b"]

# # For ElasticSearch
# DOMAIN             = "devdomain"
# TAG_DOMAIN         = "TestDomain"
# INSTANCE_TYPE_ES   = "r4.large.elasticsearch"
# VOLUME_TYPE_ES     = "gp2"
# EBS_VOLUME_SIZE    = 10