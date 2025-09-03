# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-fbc0d64ab63b63828"
  ]

  tags = {
    Name = "datacenter-ec2"
  }
}

resource "aws_ami_from_instance" "datacenter_ec2_ami" {
  name               = "datacenter-ec2-ami"
  source_instance_id = aws_instance.ec2.id

  tags = {
    Name = "datacenter-ec2-ami"
  }
}
