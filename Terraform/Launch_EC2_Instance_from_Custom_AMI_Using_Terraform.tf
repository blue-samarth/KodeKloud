# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-999307c25b17b39df"
  ]

  tags = {
    Name = "nautilus-ec2"
  }
}

resource "aws_ami_from_instance" "nautilus_ami" {
  source_instance_id = aws_instance.ec2.id
  name               = "nautilus-ec2-ami"
  depends_on         = [aws_instance.ec2]
}

resource "aws_instance" "nautilus_ec2_new" {
  ami           = aws_ami_from_instance.nautilus_ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-999307c25b17b39df"
  ]

  tags = {
    Name = "nautilus-ec2-new"
  }

  depends_on = [aws_ami_from_instance.nautilus_ami]
}

output "KKE_ami_id" {
  value = aws_ami_from_instance.nautilus_ami.id
}

output "KKE_new_instance_id" {
  value = aws_instance.nautilus_ec2_new.id
}
