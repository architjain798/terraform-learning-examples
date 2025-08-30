
# S3 bucket for learning purposes
resource "aws_s3_bucket" "learning_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Purpose     = "Learning Terraform"
    Environment = var.environment
  }
}

# S3 bucket versioning configuration
resource "aws_s3_bucket_versioning" "learning_bucket_versioning" {
  bucket = aws_s3_bucket.learning_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# S3 bucket public access block (security best practice)
resource "aws_s3_bucket_public_access_block" "learning_bucket_pab" {
  bucket = aws_s3_bucket.learning_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# S3 bucket server-side encryption configuration
resource "aws_s3_bucket_server_side_encryption_configuration" "learning_bucket_encryption" {
  bucket = aws_s3_bucket.learning_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
