# AWS EC2 Instances Example

This example demonstrates creating EC2 instances with proper security groups, SSH access, and automated software installation.


## Command to do ssh

```
ssh -i ~/.ssh/terraform-key-ec2 ubuntu@public_ip
```


## What This Example Creates

- 2 EC2 instances (configurable via variables)
- Security group allowing SSH, HTTP, and HTTPS access
- SSH key pair for secure access
- Automated Nginx installation via user data script

## Prerequisites

1. AWS CLI configured with appropriate credentials
2. SSH key pair generated for instance access

## Files

- `main.tf` - EC2 instances, security groups, and key pair resources
- `variables.tf` - Input variables for customization
- `outputs.tf` - Output values (IPs, DNS names, etc.)
- `provider.tf` - AWS provider configuration
- `script.sh` - User data script for Nginx installation
- `terra-key.pub` - SSH public key (you need to create this)

## Setup Instructions

1. Generate SSH key pair:
   ```bash
   ssh-keygen -t rsa -b 2048 -f terra-key
   # Copy the public key to this directory
   cp terra-key.pub 01-aws-ec2-instances/
   ```

2. Navigate to this directory:
   ```bash
   cd 01-aws-ec2-instances
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Review the plan:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```

6. Connect to your instances:
   ```bash
   # Get the public IP from terraform output
   terraform output ec2_public_ips

   # SSH to an instance
   ssh -i ../terra-key ubuntu@<public-ip>
   ```

7. Test Nginx installation:
   ```bash
   # Visit http://<public-ip> in your browser
   # You should see "Hello from Terraform on Ubuntu!"
   ```

8. Clean up when done:
   ```bash
   terraform destroy
   ```

## Customization

Create a `terraform.tfvars` file to customize the deployment:

```hcl
aws_region = "us-west-2"
instance_types = {
  "web-server-1" = "t3.micro"
  "api-server-1" = "t3.small"
}
ec2_root_storage_size = 10
environment = "development"
```

## Security Notes

⚠️ **Important**: This configuration allows SSH access from anywhere (0.0.0.0/0) for learning purposes. In production environments, restrict SSH access to specific IP ranges.

## Learning Points

- EC2 instance creation and configuration
- Security group rules and network access
- SSH key pair management
- User data scripts for instance initialization
- Resource dependencies with `depends_on`
- Using `for_each` for multiple similar resources
- Output values for accessing resource information
- Default tags for resource organization
- Variable usage and customization
