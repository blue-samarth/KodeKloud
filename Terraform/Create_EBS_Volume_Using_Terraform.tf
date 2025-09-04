resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = "us-east-1a"
  size              = 2
  type             = "gp3"

  tags = {
    Name = "nautilus-volume"
  }
}