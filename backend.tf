terraform {
  backend "s3" {
    bucket = "terraform-dev-stat"
    dynamodb_table = "terraform-stat-table"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
