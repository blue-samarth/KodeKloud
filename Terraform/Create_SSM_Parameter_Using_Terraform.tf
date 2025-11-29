resource "aws_ssm_parameter" "ssm_parameter_devops" {
  name        = "devops-ssm-parameter"
  description = "A custom SSM parameter created using Terraform"
  type        = "String"
  value       = "devops-value"
}