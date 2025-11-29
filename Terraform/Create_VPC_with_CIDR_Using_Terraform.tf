resource "aws_vpc" "datacenter-vpc" {
  cidr_block = "192.168.0.0/24"
  tags = {
    Name       = "datacenter-vpc"
    Project    = "nautilus-devops"
    managed_by = "Terraform"
  }
}