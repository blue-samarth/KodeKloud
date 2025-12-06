variable "KKE_BUCKET_NAME" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "devops-logs-32711"
}
variable "KKE_POLICY_NAME" {
  description = "The name of the IAM policy"
  type        = string
  default     = "devops-access-policy"
}
variable "KKE_ROLE_NAME" {
  description = "The name of the IAM role"
  type        = string
  default     = "devops-role"
}

data "aws_ami" "latest_amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_s3_bucket" "devops_s3_bucket" {
  bucket = var.KKE_BUCKET_NAME
}

resource "aws_iam_role" "devops_iam_role" {
  name = var.KKE_ROLE_NAME

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "devops_access_policy" {
  name = var.KKE_POLICY_NAME

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject"
        ]
        Resource = "${aws_s3_bucket.devops_s3_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "devops_attach_policy" {
  role       = aws_iam_role.devops_iam_role.name
  policy_arn = aws_iam_policy.devops_access_policy.arn
}
resource "aws_iam_instance_profile" "devops_instance_profile" {
  name = "devops-instance-profile"
  role = aws_iam_role.devops_iam_role.name
}

resource "aws_instance" "devops_ec2" {
  ami           = data.aws_ami.latest_amazon_linux_2.id
  instance_type = "t2.micro"
  tags = {
    Name = "devops-ec2"
  }
  iam_instance_profile = aws_iam_instance_profile.devops_instance_profile.name
}