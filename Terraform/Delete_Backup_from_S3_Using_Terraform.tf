# Existing bucket datacenter-bck-10454
# Step 1: data resource to reference the existing S3 bucket
# step 2: Copy all the contetnts of the bucket to null resource to `/opt/s3-backup/`
# step 3: delete the bucket

resource "null_resource" "run_aws_cli" {
  provisioner "local-exec" {
    command = "aws s3 cp s3://datacenter-bck-512 /opt/s3-backup/ --recursive && aws s3 rb s3://datacenter-bck-512 --force"
  }
}

# import {
#     to = aws_s3_bucket.datacenter_bucket
#     id = "xfusion-bck-22253"
# }

# resource "aws_s3_bucket" "datacenter_bucket" {
#   bucket = "xfusion-bck-22253"
#   force_destroy = true
# }

# resource "null_resource" "backup_s3_contents" {
#   provisioner "local-exec" {
#     command = "aws s3 sync s3://${aws_s3_bucket.datacenter_bucket.bucket} /opt/s3-backup/"
#   }

#   triggers = {
#     bucket_id = aws_s3_bucket.datacenter_bucket.id
#   }
# }

# resource "null_resource" "empty_bucket" {
#   provisioner "local-exec" {
#     command = "aws s3 rm s3://${aws_s3_bucket.datacenter_bucket.bucket} --recursive"
#   }

#   depends_on = [null_resource.backup_s3_contents]

#   triggers = {
#     bucket_id = aws_s3_bucket.datacenter_bucket.id
#   }
# }
