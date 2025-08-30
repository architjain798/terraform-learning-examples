variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "eu-west-2"
}

variable "bucket_name" {
  description = "Name of the S3 bucket (must be globally unique)"
  type        = string
  default     = "my-tf-practice-bucket-archit"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "learning"
}

variable "project_name" {
  description = "Project name for resource tagging"
  type        = string
  default     = "terraform-practice"
}
