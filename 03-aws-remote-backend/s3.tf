resource "aws_s3_bucket" "example-archit" {
  bucket = var.my_bucket

  tags = {
    Name        = var.my_bucket
    Environment = var.environment
  }

  # This bucket is used for storing Terraform remote state securely.
}

# Enable versioning for state file history and recovery
resource "aws_s3_bucket_versioning" "example-archit_versioning" {
  bucket = aws_s3_bucket.example-archit.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption for security
resource "aws_s3_bucket_server_side_encryption_configuration" "example-archit_encryption" {
  bucket = aws_s3_bucket.example-archit.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
