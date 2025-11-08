resource "aws_secretsmanager_secret" "secret_manager_datacenter_secret" {
  name        = "datacenter-secret"
  description = "Datacenter secret for sensitive information"
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id = aws_secretsmanager_secret.secret_manager_datacenter_secret.id
  secret_string = jsonencode({
    username = "admin"
    password = "Namin123"
  })
}