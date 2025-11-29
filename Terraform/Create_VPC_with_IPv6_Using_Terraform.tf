resource "aws_vpc" "nautilus-vpc" {
  cidr_block                       = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true
  enable_dns_hostnames             = true
  enable_dns_support               = true
  tags = {
    Name       = "nautilus-vpc"
    Project    = "nautilus-devops"
    managed_by = "Terraform"
  }
}
