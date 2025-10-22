resource "aws_s3_bucket" "public_bucket" {
  bucket = "nautilus-s3-797"
  tags = {
    Name        = "Public S3 Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = aws_s3_bucket.public_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "public_bucket_ownership" {
  bucket = aws_s3_bucket.public_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "public_bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.public_bucket_ownership,
    aws_s3_bucket_public_access_block.public_access_block,
  ]

  bucket = aws_s3_bucket.public_bucket.id
  acl    = "public-read"
}