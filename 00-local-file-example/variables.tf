variable "filename" {
  description = "Name of the file to create"
  type        = string
  default     = "automate.txt"
}

variable "file_content" {
  description = "Content to write to the file"
  type        = string
  default     = "Hello from Terraform! This file was created automatically."
}

variable "file_permission" {
  description = "File permissions"
  type        = string
  default     = "0644"
}
