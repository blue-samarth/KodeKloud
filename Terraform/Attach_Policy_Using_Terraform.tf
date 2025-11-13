# Create IAM user
resource "aws_iam_user" "user" {
  name = "iamuser_kareem"

  tags = {
    Name = "iamuser_kareem"
  }
}

# Create IAM Policy
resource "aws_iam_policy" "policy" {
  name        = "iampolicy_kareem"
  description = "IAM policy allowing EC2 read actions for kareem"

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

# Attach Policy to User
resource "aws_iam_user_policy_attachment" "user_policy_attach" {
  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.policy.arn
}