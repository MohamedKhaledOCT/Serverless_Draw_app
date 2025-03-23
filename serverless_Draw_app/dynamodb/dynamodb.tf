resource "aws_dynamodb_table" "draw_table" {
  name           = "draw"
  billing_mode   = "PAY_PER_REQUEST"
  table_class    = "STANDARD_INFREQUENT_ACCESS"
  hash_key       = "email"

  attribute {
    name = "email"
    type = "S"
  }

  tags = {
    Environment = "Production"
    Project     = "DrawApp"
  }
}
