resource "aws_vpc" "devops-vpc" {
  region     = "us-east-1"
  cidr_block = "10.0.0.0/16"
  tags = {
    Name       = "devops-vpc"
    Project    = "nautilus-devops"
    managed_by = "Terraform"
  }
}
