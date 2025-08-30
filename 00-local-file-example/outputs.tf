# Output the file path
output "file_path" {
  description = "Path to the created file"
  value       = local_file.example_file.filename
}

# Output the file content
output "file_content" {
  description = "Content of the created file"
  value       = local_file.example_file.content
}

# Output the file ID
output "file_id" {
  description = "ID of the created file resource"
  value       = local_file.example_file.id
}
