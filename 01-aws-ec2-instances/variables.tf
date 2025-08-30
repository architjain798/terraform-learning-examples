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

# EC2 Instance Configuration
variable "ec2_ami_id" {
  description = "AMI ID for EC2 instances (Ubuntu 22.04 LTS recommended)"
  type        = string
  default     = "ami-046c2381f11878233" # Ubuntu 22.04 LTS in eu-west-2

  validation {
    condition     = can(regex("^ami-[a-f0-9]{8,17}$", var.ec2_ami_id))
    error_message = "AMI ID must be in the format ami-xxxxxxxx."
  }
}

# SSH Key Configuration
variable "key_pair_name" {
  description = "Name for the AWS key pair used for SSH access"
  type        = string
  default     = "terraform-web-server-key"

  validation {
    condition     = length(var.key_pair_name) > 0 && length(var.key_pair_name) <= 255
    error_message = "Key pair name must be between 1 and 255 characters."
  }
}

# Security Configuration
variable "ssh_cidr_blocks" {
  description = "List of CIDR blocks allowed for SSH access (restrict for production)"
  type        = list(string)
  default     = ["0.0.0.0/0"] # WARNING: Open to all IPs - restrict in production

  validation {
    condition     = length(var.ssh_cidr_blocks) > 0
    error_message = "At least one CIDR block must be specified for SSH access."
  }
}

# Instance Configuration Map
variable "instance_configurations" {
  description = "Map of instance configurations with detailed settings"
  type = map(object({
    instance_type    = string
    root_volume_size = number
    throughput       = number
    iops             = number
    purpose          = string
    backup_required  = string
  }))
  default = {
    MY_EC2_1 = {
      instance_type    = "t2.micro" # Back to original t2.micro
      root_volume_size = 20
      throughput       = 125
      iops             = 3000
      purpose          = "Primary web server"
      backup_required  = "daily"
    }
    MY_EC2_2 = {
      instance_type    = "t2.small" # Restored your original t2.small
      root_volume_size = 30
      throughput       = 125
      iops             = 3000
      purpose          = "Secondary web server"
      backup_required  = "weekly"
    }
  }

  validation {
    condition = alltrue([
      for config in var.instance_configurations :
      config.root_volume_size >= 8 && config.root_volume_size <= 1000
    ])
    error_message = "Root volume size must be between 8 and 1000 GB."
  }
}

# Monitoring Configuration
variable "enable_detailed_monitoring" {
  description = "Enable detailed CloudWatch monitoring for instances"
  type        = bool
  default     = false
}

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

variable "project_name" {
  description = "Project name used for resource naming and tagging"
  type        = string
  default     = "terraform-practice"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project_name))
    error_message = "Project name must contain only lowercase letters, numbers, and hyphens."
  }
}

# Common Tags
variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    Project    = "terraform-practice"
    ManagedBy  = "terraform"
    CreatedBy  = "learning-environment"
    CostCenter = "education"
  }
}
