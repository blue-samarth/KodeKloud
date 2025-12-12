variable "KKE_TABLE_NAME" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "devops-table"
}
variable "KKE_ROLE_NAME" {
  description = "The name of the IAM role to attach the policy"
  type        = string
  default     = "devops-role"
}
variable "KKE_POLICY_NAME" {
  description = "The name of the IAM policy to be created"
  type        = string
  default     = "devops-readonly-policy"
}
data "aws_caller_identity" "current" {}

resource "aws_dynamodb_table" "devops_dynamodb_table" {
  name         = var.KKE_TABLE_NAME
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_iam_policy" "devops_dynamodb_readonly_policy" {
  name = var.KKE_POLICY_NAME

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:GetItem",
          "dynamodb:Scan",
          "dynamodb:Query",
          "dynamodb:DescribeTable"
        ]
        Resource = "arn:aws:dynamodb:us-east-1:${data.aws_caller_identity.current.account_id}:table/${var.KKE_TABLE_NAME}"
      }
    ]
  })
}

resource "aws_iam_role" "devops_iam_role" {
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

resource "aws_iam_role_policy_attachment" "devops_attach_dynamodb_policy" {
  role       = aws_iam_role.devops_iam_role.name
  policy_arn = aws_iam_policy.devops_dynamodb_readonly_policy.arn
}

output "kke_dynamodb_table" {
  value = aws_dynamodb_table.devops_dynamodb_table.name
}

output "kke_iam_role_name" {
  value = aws_iam_role.devops_iam_role.name
}

output "kke_iam_policy_name" {
  value = aws_iam_policy.devops_dynamodb_readonly_policy.name
}