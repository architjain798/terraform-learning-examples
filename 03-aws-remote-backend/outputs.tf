output "state_bucket_name" {
  description = "Name of the S3 bucket used for remote state."
  value       = aws_s3_bucket.example-archit.id
}

output "state_lock_table_name" {
  description = "Name of the DynamoDB table used for state locking."
  value       = aws_dynamodb_table.basic-dynamodb-table.id
}
