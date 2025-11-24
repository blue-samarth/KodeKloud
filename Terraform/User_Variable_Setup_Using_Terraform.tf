variable "KKE_user" {
    description = "The name of the user"
    type        = string
    default     = "iamuser_ravi"
}

resource "aws_iam_user" "iamuser_ravi" {
    name = var.KKE_user
}
