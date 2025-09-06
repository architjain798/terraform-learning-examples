# Project Information
variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "learning"

  validation {
    condition     = contains(["dev", "staging", "prod", "learning"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod, learning."
  }
}

# AWS Provider Configuration
variable "aws_region" {
  description = "AWS region for deploying resources"
  type        = string
  default     = "eu-west-2"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.aws_region))
    error_message = "AWS region must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "project_name" {
  description = "Project name used for resource naming and tagging"
  type        = string
  default     = "terraform-remote-backedn"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project_name))
    error_message = "Project name must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "my_bucket" {
  description = "S3 bucket name"
  type        = string
  default     = "my-lock-bucket-archit-20250905"
}

variable "my_dynamoDb" {
  description = "Name of dyanamodb table"
  type        = string
  default     = "my-state-table"
}
