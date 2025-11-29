variable "KKE_VPC_CIDR" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "KKE_SUBNET_CIDR" {
  description = "CIDR block for the Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

resource "aws_vpc" "KKE_VPC" {
  cidr_block = var.KKE_VPC_CIDR
  tags = {
    Name = "datacenter-priv-vpc"
  }
}

resource "aws_subnet" "KKE_Subnet" {
  vpc_id                  = aws_vpc.KKE_VPC.id
  cidr_block              = var.KKE_SUBNET_CIDR
  map_public_ip_on_launch = false

  tags = {
    Name = "datacenter-priv-subnet"
  }
}

resource "aws_security_group" "KKE_SG" {
  name        = "datacenter-priv-sg"
  description = "Security group allowing access only from within VPC"
  vpc_id      = aws_vpc.KKE_VPC.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.KKE_VPC_CIDR]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "datacenter-priv-sg"
  }
}

resource "aws_instance" "KKE_EC2_Private" {
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.KKE_Subnet.id
  vpc_security_group_ids = [aws_security_group.KKE_SG.id]

  tags = {
    Name = "datacenter-priv-ec2"
  }

  depends_on = [aws_subnet.KKE_Subnet]
}


output "KKE_vpc_name" {
  value = aws_vpc.KKE_VPC.tags["Name"]
}

output "KKE_subnet_name" {
  value = aws_subnet.KKE_Subnet.tags["Name"]
}

output "KKE_ec2_private" {
  value = aws_instance.KKE_EC2_Private.tags["Name"]
}