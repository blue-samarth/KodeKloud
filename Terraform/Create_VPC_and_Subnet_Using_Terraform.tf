variable "KKE_VPC_NAME" {
  description = "The name of the VPC"
  type        = string
  default     = "datacenter-vpc"
}

variable "KKE_SUBNET_NAME" {
  description = "The name of the Subnet"
  type        = string
  default     = "datacenter-subnet"
}

resource "aws_vpc" "datacenter_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.KKE_VPC_NAME
  }
}
resource "aws_subnet" "datacenter_subnet" {
  vpc_id     = aws_vpc.datacenter_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = var.KKE_SUBNET_NAME
  }
  depends_on = [aws_vpc.datacenter_vpc]
}

output "kke_vpc_name" {
  value = aws_vpc.datacenter_vpc.tags["Name"]
}

output "kke_subnet_name" {
  value = aws_subnet.datacenter_subnet.tags["Name"]
}