variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "eu-west-2"
}

variable "ec2_ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-046c2381f11878233" # Ubuntu 22.04 LTS in eu-west-2
}

variable "ec2_root_storage_size" {
  description = "Root storage size for EC2 instances in GB"
  type        = number
  default     = 8
}

variable "key_pair_name" {
  description = "Name for the AWS key pair"
  type        = string
  default     = "my-vm-key"
}

variable "security_group_name" {
  description = "Name for the security group"
  type        = string
  default     = "allow-web-ssh"
}

variable "instance_types" {
  description = "Map of instance names to their types"
  type        = map(string)
  default = {
    MY_EC2_1 = "t2.micro"
    MY_EC2_2 = "t2.small"
  }
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
