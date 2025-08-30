# Create a key pair for SSH access to EC2 instances
# This key pair will be used for secure shell access to all instances
resource "aws_key_pair" "web-server-key" {
  key_name   = var.key_pair_name
  public_key = file("${path.module}/terra-key.pub")

  tags = merge(var.common_tags, {
    Name        = "${var.project_name}-web-server-key-pair"
    Purpose     = "SSH access for web servers"
    Environment = var.environment
  })
}

# Use the default VPC for this learning example
# In production, you would typically create a custom VPC
data "aws_vpc" "default" {
  default = true
}

# Security group for web servers with SSH, HTTP, and HTTPS access
# Follows principle of least privilege with specific port access
resource "aws_security_group" "web-server-sg" {
  name_prefix = "${var.project_name}-web-server-sg-"
  description = "Security group for web servers allowing SSH, HTTP, and HTTPS traffic"
  vpc_id      = data.aws_vpc.default.id

  # SSH access - restricted to specific CIDR blocks for security
  ingress {
    description = "SSH access for administration"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_blocks # More secure than 0.0.0.0/0
  }

  # HTTP access for web traffic
  ingress {
    description = "HTTP web traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS access for secure web traffic
  ingress {
    description = "HTTPS secure web traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound traffic - allow all for package updates and external API calls
  egress {
    description = "All outbound traffic for updates and external communication"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Lifecycle management to prevent accidental destruction
  lifecycle {
    create_before_destroy = true
  }

  tags = merge(var.common_tags, {
    Name        = "${var.project_name}-web-server-security-group"
    Purpose     = "Web server security rules"
    Environment = var.environment
  })
}

# EC2 instances for web servers using for_each for multiple instance types
# This demonstrates Infrastructure as Code scalability and consistency
resource "aws_instance" "web-servers" {
  for_each = var.instance_configurations

  # Explicit dependency to ensure security group exists first
  depends_on = [aws_security_group.web-server-sg]

  ami           = var.ec2_ami_id
  instance_type = each.value.instance_type
  key_name      = aws_key_pair.web-server-key.key_name

  # Associate with our security group for proper network access
  vpc_security_group_ids = [aws_security_group.web-server-sg.id]

  # User data script for initial server configuration
  user_data = file("${path.module}/script.sh")

  # Encrypted root volume with proper sizing
  root_block_device {
    volume_size = each.value.root_volume_size
    volume_type = "gp3" # Latest generation for better performance
    encrypted   = true  # Encryption at rest for security compliance

    # Performance settings for gp3 volumes
    throughput = each.value.throughput
    iops       = each.value.iops

    tags = merge(var.common_tags, {
      Name        = "${each.key}-root-volume"
      Purpose     = "Root filesystem for ${each.key}"
      Environment = var.environment
    })
  }

  # Instance monitoring for operational visibility
  monitoring = var.enable_detailed_monitoring

  # Metadata service configuration for security
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required" # Require IMDSv2 for enhanced security
  }

  # Comprehensive tagging strategy for resource management
  tags = merge(var.common_tags, {
    Name         = each.key
    InstanceType = each.value.instance_type
    Purpose      = each.value.purpose
    Environment  = var.environment
    Backup       = each.value.backup_required
  })

  # Lifecycle management to prevent accidental termination
  lifecycle {
    ignore_changes = [
      ami, # Ignore AMI changes to prevent unwanted replacements
    ]
  }
}
