resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = var.my_dynamoDb
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  # Attribute for state lock
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = var.my_dynamoDb
    Environment = var.environment
  }

  # This table is used for Terraform state locking to prevent concurrent changes
}
