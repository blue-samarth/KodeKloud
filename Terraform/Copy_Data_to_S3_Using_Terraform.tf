resource "aws_s3_bucket" "my_bucket" {
  bucket = "nautilus-cp-9061"
  acl    = "private"

  tags = {
    Name = "nautilus-cp-9061"
  }
}

# cat /tmp/nautilus.txt 
# Welcome to KKE Cloud Labs!

resource "aws_s3_bucket_object" "my_object" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "nautilus.txt"
  source = "/tmp/nautilus.txt"
  acl    = "private"
}