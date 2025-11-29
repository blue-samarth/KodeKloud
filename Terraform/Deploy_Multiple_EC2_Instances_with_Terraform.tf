variable "KKE_INSTANCE_COUNT" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 3
}

variable "KKE_INSTANCE_TYPE" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "KKE_KEY_NAME" {
  description = "Key pair name for EC2 instances"
  type        = string
}

variable "KKE_INSTANCE_PREFIX" {
  description = "Prefix for EC2 instance names"
  type        = string
}


data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
locals {
  AMI_ID = data.aws_ami.amazon_linux_2.id
}


resource "tls_private_key" "datacenter_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "datacenter_kp" {
  key_name   = var.KKE_KEY_NAME
  public_key = tls_private_key.datacenter_key.public_key_openssh
}

resource "aws_instance" "KKE_EC2_Instances" {
  count         = var.KKE_INSTANCE_COUNT
  ami           = local.AMI_ID
  instance_type = var.KKE_INSTANCE_TYPE
  key_name      = aws_key_pair.datacenter_kp.key_name

  tags = {
    Name = "${var.KKE_INSTANCE_PREFIX}-${count.index + 1}"
  }

  depends_on = [aws_key_pair.datacenter_kp]
}

output "kke_instance_names" {
  description = "Names of the launched EC2 instances"
  value       = [for instance in aws_instance.KKE_EC2_Instances : instance.tags["Name"]]
}