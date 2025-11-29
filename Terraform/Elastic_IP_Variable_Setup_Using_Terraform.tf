variable "KKE_eip" {
  description = "The name of the Elastic IP"
  type        = string
  default     = "xfusion-eip"
}

resource "aws_eip" "xfusion_eip" {
  domain = "vpc"
  tags = {
    Name = var.KKE_eip
  }
}