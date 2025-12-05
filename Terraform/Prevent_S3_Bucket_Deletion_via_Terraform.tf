variable "KKE_BUCKET_NAME" {
  description = "The name of the S3 bucket to prevent deletion"
  type        = string
  default     = "datacenter-s3-28750"
}

resource "aws_s3_bucket" "datacenter_s3_bucket" {
  bucket = var.KKE_BUCKET_NAME

  lifecycle {
    prevent_destroy = true
  }
}

output "s3_bucket_name" {
  value = aws_s3_bucket.datacenter_s3_bucket.bucket
}