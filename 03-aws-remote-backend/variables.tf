# Project Information
# Consider renaming variables like my_bucket/my_dynamoDb to state_bucket/state_lock_table for clarity

variable "environment" {
  description = "Environment name (dev, staging, prod, learning). Used for tagging and resource separation."
  type        = string
  default     = "learning"

  validation {
    condition     = contains(["dev", "staging", "prod", "learning"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod, learning."
  }
}

# AWS Provider Configuration
variable "aws_region" {
  description = "AWS region for deploying resources (e.g., eu-west-2)"
  type        = string
  default     = "eu-west-2"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.aws_region))
    error_message = "AWS region must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "project_name" {
  description = "Project name used for resource naming and tagging. Helps with cost tracking."
  type        = string
  default     = "terraform-remote-backedn"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project_name))
    error_message = "Project name must contain only lowercase letters, numbers, and hyphens."
  }
}

# S3 bucket for remote state storage
variable "my_bucket" {
  description = "S3 bucket name for storing Terraform remote state. Must be globally unique."
  type        = string
  default     = "my-lock-bucket-archit-20250905"
}

# DynamoDB table for state locking
variable "my_dynamoDb" {
  description = "DynamoDB table name for Terraform state locking."
  type        = string
  default     = "my-lock-table-archit-20250905"
}

variable "my_dynamoDb" {
  description = "Name of dyanamodb table"
  type        = string
  default     = "my-state-table"
}
