resource "aws_cloudformation_stack" "aws_cloudformation_stack_nautilus" {
  name          = "nautilus-stack"
  template_body = <<STACKEOF
{
  "AWSTemplateFormatVersion": "2010-09-09",
  "Description": "CloudFormation Template to create an S3 Bucket with versioning",
  "Resources": {
    "NautilusS3Bucket": {
      "Type": "AWS::S3::Bucket",
      "Properties": {
        "BucketName": "nautilus-bucket-13020",
        "VersioningConfiguration": {
          "Status": "Enabled"
        }
      }
    }
  }
}
STACKEOF
}