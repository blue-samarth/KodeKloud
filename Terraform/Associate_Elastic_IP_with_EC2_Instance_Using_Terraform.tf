variable "KKE_eip" {
  description = "The name of the Elastic IP"
  type        = string
  default     = "xfusion-eip"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  tags = {
    Name = "xfusion-ec2"
  }
}

resource "aws_eip" "xfusion_eip" {
  domain = "vpc"
  tags = {
    Name = var.KKE_eip
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.xfusion_eip.id
}

output "KKE_instance_name" {
  description = "Name of the EC2 instance"
  value       = aws_instance.ec2.tags["Name"]
}

output "KKE_eip" {
  description = "The Elastic IP address"
  value       = aws_eip.xfusion_eip.public_ip
}