resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  subnet_id     = "subnet-24de82ca9b6247035"
  vpc_security_group_ids = [
    "sg-9a94bd7b26c2d6053"
  ]

  tags = {
    Name = "datacenter-ec2"
  }
}

resource "aws_eip" "ec2_eip" {
  tags = {
    Name = "datacenter-ec2-eip"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.ec2_eip.id
}