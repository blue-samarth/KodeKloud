data "aws_instance" "datacenter_ec2" {
  filter {
    name   = "tag:Name"
    values = ["datacenter-ec2"]
  }
}

resource "aws_ami_from_instance" "datacenter_ec2_ami" {
  name               = "datacenter-ec2-ami"
  source_instance_id = data.aws_instance.datacenter_ec2.id
  
  tags = {
    Name = "datacenter-ec2-ami"
  }
}
