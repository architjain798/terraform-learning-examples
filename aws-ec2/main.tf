# Create a key pair for SSH access
resource "aws_key_pair" "deployer" {
  key_name   = var.key_pair_name
  public_key = file("${path.module}/terra-key.pub")

  tags = {
    Name = "${var.project_name}-key-pair"
  }
}

# Use the default VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Security group allowing SSH, HTTP, and HTTPS access
resource "aws_security_group" "web_ssh" {
  name_prefix = "${var.security_group_name}-"
  description = "Allow SSH, HTTP, and HTTPS traffic"
  vpc_id      = aws_default_vpc.default.id

  # SSH access
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Note: In production, restrict this to specific IPs
  }

  # HTTP access
  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS access
  ingress {
    description = "HTTPS access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-security-group"
  }
}

# EC2 instances with for_each loop
resource "aws_instance" "web_servers" {
  for_each = var.instance_types

  depends_on = [aws_security_group.web_ssh]

  ami                    = var.ec2_ami_id
  instance_type          = each.value
  key_name              = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.web_ssh.id]
  user_data             = file("${path.module}/script.sh")

  root_block_device {
    volume_size = var.ec2_root_storage_size
    volume_type = "gp3"
    encrypted   = true

    tags = {
      Name = "${each.key}-root-volume"
    }
  }

  tags = {
    Name = each.key
    Type = each.value
  }
}
