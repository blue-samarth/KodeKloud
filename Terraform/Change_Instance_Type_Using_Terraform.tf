# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.nano" # Change instance type as needed
  subnet_id     = ""
  vpc_security_group_ids = [
    "sg-36db4894cb25c068c"
  ]

  tags = {
    Name = "datacenter-ec2"
  }
}