resource "aws_iam_policy" "iampolicy_ammar" {
  name        = "iampolicy_ammar"
  description = "A custom IAM policy created using Terraform"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = [
          "ec2:Describe*",
          "ec2:Get*",
          "ec2:List*"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}