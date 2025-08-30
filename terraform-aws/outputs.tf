# Output the S3 bucket name
output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.learning_bucket.bucket
}

# Output the S3 bucket ARN
output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.learning_bucket.arn
}

# Output the S3 bucket domain name
output "bucket_domain_name" {
  description = "Domain name of the S3 bucket"
  value       = aws_s3_bucket.learning_bucket.bucket_domain_name
}

# Output the S3 bucket region
output "bucket_region" {
  description = "Region of the S3 bucket"
  value       = aws_s3_bucket.learning_bucket.region
}
