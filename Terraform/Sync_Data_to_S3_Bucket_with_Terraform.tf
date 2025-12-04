variable "KKE_BUCKET" {
  description = "The name of the S3 bucket to sync data to"
  type        = string
  default     = "datacenter-sync-19779"
}

resource "aws_s3_bucket" "wordpress_bucket" {
  bucket = "datacenter-s3-17997"
}

resource "aws_s3_bucket_acl" "wordpress_bucket_acl" {
  bucket = aws_s3_bucket.wordpress_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket" "datacenter_sync_bucket" {
    bucket = var.KKE_BUCKET
}

resource "aws_s3_bucket_acl" "datacenter_sync_bucket_acl" {
    bucket = aws_s3_bucket.datacenter_sync_bucket.id
    acl    = "private"

    depends_on = [ aws_s3_bucket.datacenter_sync_bucket ]
}

resource "null_resource" "s3_migration" {
  provisioner "local-exec" {
    command = "aws s3 sync s3://${aws_s3_bucket.wordpress_bucket.bucket} s3://${aws_s3_bucket.datacenter_sync_bucket.bucket}"
  }

    depends_on = [ aws_s3_bucket_acl.datacenter_sync_bucket_acl ]
}

output "new_kke_bucket_name" {
  value = aws_s3_bucket.datacenter_sync_bucket.bucket
}

output "new_kke_bucket_acl" {
  value = aws_s3_bucket_acl.datacenter_sync_bucket_acl.acl
}