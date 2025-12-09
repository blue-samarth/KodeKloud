variable "KKE_ROLE_NAME" {
  description = "The name of the IAM role"
  type        = string
}

variable "KKE_POLICY_NAME" {
  description = "The name of the IAM policy"
  type        = string
}

# -------------------------
# IAM Role
# -------------------------
resource "aws_iam_role" "nautilus_iam_role" {
  name = var.KKE_ROLE_NAME

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# -------------------------
# IAM Policy (List EC2 Instances)
# -------------------------
resource "aws_iam_policy" "nautilus_policy" {
  name = var.KKE_POLICY_NAME

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:DescribeInstances"
        ]
        Resource = "*"
      }
    ]
  })
}

# -------------------------
# Attach Policy to Role
# -------------------------
resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.nautilus_iam_role.name
  policy_arn = aws_iam_policy.nautilus_policy.arn
}

output "kke_iam_role_name" {
  value = aws_iam_role.nautilus_iam_role.name
}

output "kke_iam_policy_name" {
  value = aws_iam_policy.nautilus_policy.name
}
