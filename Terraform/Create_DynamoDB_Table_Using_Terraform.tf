resource "aws_dynamodb_table" "dynamodb_table_xfusion_users" {
  name         = "xfusion-users"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "xfusion_id"

  attribute {
    name = "xfusion_id"
    type = "S"
  }

}