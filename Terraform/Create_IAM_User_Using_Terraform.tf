resource "aws_iam_user" "iamuser_ravi" {
  name = "iamuser_ravi"
  
  tags = {
    Name        = "iamuser_ravi"
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}