terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.12.0" # Version pinning ensures reproducible builds and avoids breaking changes
    }
  }
}

# AWS provider configuration
provider "aws" {
  region = var.aws_region

  # Default tags help with cost tracking and resource identification
  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}
