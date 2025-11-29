variable "KKE_iampolicy" {
  description = "The name of the IAM Policy"
  type        = string
  default     = "iampolicy_siva"
}

resource "aws_iam_policy" "policy" {
  name        = var.KKE_iampolicy
  description = "IAM policy allowing EC2 read actions for Siva"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ec2:Read*"]
        Resource = "*"
      }
    ]
  })
}
