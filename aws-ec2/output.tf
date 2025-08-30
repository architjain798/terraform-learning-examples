# Output the public IP addresses of all EC2 instances
output "ec2_public_ips" {
  description = "Public IP addresses of EC2 instances"
  value = {
    for name, instance in aws_instance.web_servers : name => instance.public_ip
  }
}

# Output the public DNS names of all EC2 instances
output "ec2_public_dns" {
  description = "Public DNS names of EC2 instances"
  value = {
    for name, instance in aws_instance.web_servers : name => instance.public_dns
  }
}

# Output the private IP addresses of all EC2 instances
output "ec2_private_ips" {
  description = "Private IP addresses of EC2 instances"
  value = {
    for name, instance in aws_instance.web_servers : name => instance.private_ip
  }
}

# Output the instance IDs
output "ec2_instance_ids" {
  description = "Instance IDs of EC2 instances"
  value = {
    for name, instance in aws_instance.web_servers : name => instance.id
  }
}

# Output the security group ID
output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.web_ssh.id
}

# Output the key pair name
output "key_pair_name" {
  description = "Name of the key pair"
  value       = aws_key_pair.deployer.key_name
}
