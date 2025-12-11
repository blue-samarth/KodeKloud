variable "KKE_USER_NAME" {
  description = "The name of the IAM user"
  type        = string
  default     = "iamuser_kareem"
}
resource "aws_iam_user" "kareem_iam_user" {
  name = var.KKE_USER_NAME
}

resource "null_resource" "print_iam_user_name" {
  provisioner "local-exec" {
    command = "echo 'KKE iamuser_kareem has been created successfully!' > /home/bob/terraform/KKE_user_created.log"
  }
  depends_on = [aws_iam_user.kareem_iam_user]
}

output "kke_iam_user_name" {
  value = aws_iam_user.kareem_iam_user.name
}