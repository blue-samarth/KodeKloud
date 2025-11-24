variable "KKE_iamrole" {
    description = "The name of the IAM Role"
    type        = string
    default     = "iamrole_mariyam"
}

resource "aws_iam_role" "iamrole_mariyam" {
    name = var.KKE_iamrole
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}