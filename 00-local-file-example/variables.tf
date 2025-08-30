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
  description = "File permissions (0644=normal file, 0755=executable, 0600=secret)"
  type        = string
  default     = "0644"

  # Permission Quick Reference:
  # 0644 = rw-r--r-- (normal files - owner can edit, others can read)
  # 0755 = rwxr-xr-x (scripts - owner full access, others read+execute)
  # 0600 = rw------- (secrets - owner only)
  # 0777 = rwxrwxrwx (everything - AVOID! Security risk)

  validation {
    condition = contains([
      "0644", "0755", "0600", "0640", "0664", "0700", "0750"
    ], var.file_permission)
    error_message = "Use common secure permissions: 0644 (normal), 0755 (script), 0600 (secret)."
  }
}
