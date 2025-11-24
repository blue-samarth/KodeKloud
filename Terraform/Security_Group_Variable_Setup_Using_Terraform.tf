variable "KKE_sg" {
    description = "The name of the Security Group"
    type        = string
    default     = "nautilus-sg"
}

resource "aws_security_group" "nautilus_sg" {
    name        = var.KKE_sg
}