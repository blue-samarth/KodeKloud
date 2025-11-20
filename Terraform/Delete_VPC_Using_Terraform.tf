resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "devops-vpc"
  }
}

resource "null_resource" "deleting_vpc_devops" {
  provisioner "local-exec" {
    command = "aws ec2 delete-vpc --vpc-id ${aws_vpc.this.id}"
  } 
}