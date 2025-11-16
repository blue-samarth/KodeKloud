resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-841afae7226a40f0c"
  ]

  tags = {
    Name = "devops-ec2"
  }
}

resource "null_resource" "delete_ec2_instance" {
  provisioner "local-exec" {
    command = "aws ec2 terminate-instances --instance-ids ${aws_instance.ec2.id}"
  }
}