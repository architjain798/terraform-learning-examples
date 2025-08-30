# Create a local file using Terraform
# This is a simple example to demonstrate Terraform basics
resource "local_file" "example_file" {
  filename        = var.filename
  content         = var.file_content
  file_permission = var.file_permission

  # This will recreate the file if content changes
  lifecycle {
    create_before_destroy = true
  }
}
