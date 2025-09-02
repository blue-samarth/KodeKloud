resource "tls_private_key" "datacenter_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "datacenter_kp" {
  key_name   = "datacenter-kp"
  public_key = tls_private_key.datacenter_key.public_key_openssh
}

resource "aws_instance" "datacenter-ec2" {
  ami           = "ami-0c101f26f147fa7fd" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  key_name      = aws_key_pair.datacenter_kp.key_name

  tags = {
    Name        = "datacenter-ec2"
    Environment = "migration"
    Team        = "DevOps"
    Purpose     = "AWS Infrastructure Migration"
  }
}