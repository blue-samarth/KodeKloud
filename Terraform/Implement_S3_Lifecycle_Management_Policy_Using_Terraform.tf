resource "aws_s3_bucket" "datacenter_lifecycle_28878_s3_bucket" {
  bucket = "datacenter-lifecycle-28878"
}
resource "aws_s3_bucket_versioning" "datacenter_lifecycle_28878_versioning" {
  bucket = aws_s3_bucket.datacenter_lifecycle_28878_s3_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "datacenter_lifecycle_28878_s3_bucket_lifecycle" {
  bucket = aws_s3_bucket.datacenter_lifecycle_28878_s3_bucket.id

  rule {
    id     = "datacenter-lifecycle-rule"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    expiration {
      days = 365
    }
  }

  depends_on = [aws_s3_bucket_versioning.datacenter_lifecycle_28878_versioning]
}

output "KKE_bucket_name" {
  value = aws_s3_bucket.datacenter_lifecycle_28878_s3_bucket.bucket
}