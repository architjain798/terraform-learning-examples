resource "aws_s3_bucket" "example-archit" {
  bucket = var.my_bucket

  tags = {
    Name        = var.my_bucket
    Environment = var.environment
  }
}
