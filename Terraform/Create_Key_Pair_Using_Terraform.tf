resource "tls_private_key" "datacenter_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "datacenter_kp" {
  key_name   = "datacenter-kp"
  public_key = tls_private_key.datacenter_key.public_key_openssh

  tags = {
    Name        = "datacenter-kp"
    Environment = "migration"
    Team        = "Nautilus DevOps"
  }
}

resource "local_file" "private_key" {
  content  = tls_private_key.datacenter_key.private_key_pem
  filename = "/home/bob/datacenter-kp.pem"

  file_permission = "0600"
}

