variable "KKE_vpc" {
  description = "The name of the VPC"
  type        = string
  default     = "nautilus-vpc"
}



resource "aws_vpc" "nautilus_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.KKE_vpc
  }
}