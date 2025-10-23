resource "aws_s3_bucket" "private_bucket" {
  bucket = "datacenter-s3-22485"
  tags = {
    Name        = "datacenter-s3-22485"
    Environment = "migration"
  }
}

resource "aws_s3_bucket_public_access_block" "private_access_block" {
  bucket                  = aws_s3_bucket.private_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
