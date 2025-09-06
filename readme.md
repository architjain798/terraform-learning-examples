# Terraform Learning and Practice Repository

This repository contains various Terraform configurations for learning Infrastructure as Code (IaC) concepts and AWS resource ## 🔧 Development Setup

### Git Hooks for Quality Assurance

This repository includes automated Git hooks to maintain code quality:

**Setup the hooks:**
```bash
./.githooks/setup-hooks.sh
```

**What the hooks do:**
- **Pre-commit**: Validates code before each commit
  - 🔒 Checks for secrets and sensitive data
  - 🧹 Validates Terraform formatting (`terraform fmt`)
  - ✅ Runs Terraform validation
  - 📝 Checks documentation quality
  - 🐚 Validates shell scripts
  - 📁 Ensures proper example structure

- **Commit-msg**: Validates commit message format
  - Enforces minimum message length
  - Suggests conventional commit format
  - Provides helpful tips

**Manual validation:**
```bash
# Run pre-commit checks manually
./.githooks/pre-commit

# Format all Terraform files
find . -name "*.tf" -exec terraform fmt {} \;
```

**Recommended tools** (optional but helpful):
```bash
# TFLint for Terraform best practices
brew install tflint

# Markdown linting for documentation
npm install -g markdownlint-cli

# Shell script analysis
brew install shellcheck
```

## 🤖 GitHub Copilot Integrationanagement.

## 📁 Repository Structure

```
terraform-practice/
├── README.md                           # This file
├── 00-local-file-example/              # Simple local file creation
│   ├── main.tf                         # Local file resource
│   ├── variables.tf                    # Input variables
│   ├── outputs.tf                      # Output values
│   └── provider.tf                     # Provider configuration
├── 01-aws-ec2-instances/               # EC2 instances with security groups
│   ├── main.tf                         # EC2 resources definition
│   ├── variables.tf                    # Input variables
│   ├── outputs.tf                      # Output values
│   ├── provider.tf                     # Provider configuration
│   ├── script.sh                       # User data script for EC2
│   └── terra-key.pub                   # SSH public key
└── 02-aws-s3-bucket/                   # S3 bucket example
    ├── s3.tf                           # S3 bucket resources
    ├── variables.tf                    # Input variables
    ├── outputs.tf                      # Output values
    └── provider.tf                     # Provider configuration
```

## 🚀 Getting Started

### Prerequisites

1. **Terraform Installation**: Install Terraform from [terraform.io](https://terraform.io)
2. **AWS CLI**: Configure AWS credentials using `aws configure`
3. **SSH Key Pair**: Generate SSH key pair for EC2 access (for aws-ec2 example)

### Basic Terraform Commands

| Command | Description |
|---------|-------------|
| `terraform init` | Initialize Terraform working directory (run once) |
| `terraform validate` | Validate configuration files |
| `terraform fmt` | Format configuration files |
| `terraform plan` | Show execution plan |
| `terraform apply` | Apply configuration changes |
| `terraform destroy` | Destroy all resources |
| `terraform state list` | List all resources in state |

## 📚 Examples

### 0. Local File Example (`00-local-file-example/`)

Simple example that creates a local file. Perfect for understanding Terraform basics without cloud resources.

```bash
cd 00-local-file-example
terraform init
terraform plan
terraform apply
```

**Features demonstrated:**
- Basic resource creation
- Variables and outputs
- File permissions
- Lifecycle management

### 1. AWS EC2 Instances (`01-aws-ec2-instances/`)

Creates EC2 instances with:

- Security groups (SSH, HTTP, HTTPS access)
- Key pair for SSH access
- User data script for Nginx installation
- Multiple instances using `for_each`

**Setup:**

1. Generate SSH key pair:

   ```bash
   ssh-keygen -t rsa -b 2048 -f terra-key
   cp terra-key.pub 01-aws-ec2-instances/
   ```

2. Navigate to the directory and run:

   ```bash
   cd 01-aws-ec2-instances
   terraform init
   terraform plan
   terraform apply
   ```

**Features demonstrated:**

- Resource dependencies
- Variables and outputs
- Security groups
- User data scripts
- for_each meta-argument
- Default tags

### 2. AWS S3 Bucket (`02-aws-s3-bucket/`)

Creates an S3 bucket with:

- Versioning enabled
- Server-side encryption
- Public access blocked (security best practice)

```bash
cd 02-aws-s3-bucket
terraform init
terraform plan
terraform apply
```

## 🔧 Configuration

### Customizing Variables

Each example includes a `variables.tf` file with configurable options:

**00-local-file-example variables:**
- `filename`: Name of the file to create
- `file_content`: Content to write to the file
- `file_permission`: File permissions (default: 0644)

**01-aws-ec2-instances variables:**
- `aws_region`: AWS region (default: eu-west-2)
- `instance_types`: Map of instance names to types
- `ec2_ami_id`: AMI ID for instances
- `ec2_root_storage_size`: Root volume size in GB

**02-aws-s3-bucket variables:**
- `bucket_name`: S3 bucket name (must be globally unique)
- `aws_region`: AWS region

### Example: Custom Variables

Create a `terraform.tfvars` file:

```hcl
aws_region = "us-west-2"
instance_types = {
  "web-server-1" = "t3.micro"
  "web-server-2" = "t3.small"
}
bucket_name = "my-unique-bucket-name-12345"
```

## 🛡️ Security Notes

- **SSH Access**: The security groups allow SSH from anywhere (0.0.0.0/0) for learning purposes. In production, restrict to specific IP ranges.
- **S3 Security**: S3 buckets are configured with public access blocked and encryption enabled.
- **Key Management**: Never commit private keys to version control.

## 🧹 Cleanup

Always destroy resources when done learning to avoid AWS charges:

```bash
terraform destroy -auto-approve
```

## 📖 Learning Resources

- [Terraform Documentation](https://terraform.io/docs)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)

## � GitHub Copilot Integration

This repository includes custom GitHub Copilot instructions to enhance your coding experience:

- **`.github/copilot-instructions.md`**: Main instructions for Terraform best practices and educational focus
- **`.github/instructions/`**: Specific instructions for different file types (`.tf`, `.md`, `.sh`)

To enable these instructions in VS Code:
1. Enable the `github.copilot.chat.codeGeneration.useInstructionFiles` setting
2. GitHub Copilot will automatically apply these instructions when working in this repository

The instructions ensure that Copilot suggestions follow Terraform best practices, security guidelines, and educational standards.

## �🤝 Contributing

This is a learning repository. Feel free to:
- Add new examples
- Improve existing configurations
- Add documentation
- Report issues

## 📝 Notes

- State files (`.tfstate`) are gitignored for security
- This repository is for learning purposes only
- Always review `terraform plan` output before applying changes
- Use `terraform fmt` to maintain consistent formatting


block parameter {
    arguments --> before execution
    attributes --> after execution
}

## Important Commands

1. To refresh terraform states

    ```
    terraform refresh
    ```

2. To see all list of states/ resources created

    ```
    terraform state list
    ```


    if the output is

    ```
    data.aws_vpc.default
    aws_instance.web-servers["MY_EC2_1"]
    aws_instance.web-servers["MY_EC2_2"]
    aws_key_pair.web-server-key
    ```

3. To see particular state / resource

    ```
    terraform state show aws_key_pair.web-server-key
    ```


    ```
    terraform state show 'aws_instance.web-servers["MY_EC2_1"]'
    ```

4. To remove / delete the state
    - this means it will onlt delete the links between aws and terraform
    - it will not delete the resoiurce from aws console

    ```
    terraform state rm aws_key_pair.web-server-key
    ```

5. to import the exisiting aws resouce that was not manageed by terraform earlier

    ```
    terraform import aws_instance.my_new_instance i-wqe1231sadas
    ```




<!-- # local_file.my_file will be created
+ resource "local_file" "my_file" {
    + content              = "lorem epsum"
    + content_base64sha256 = (known after apply) attributes
    + content_base64sha512 = (known after apply) attributes
    + content_md5          = (known after apply) attributes
    + content_sha1         = (known after apply)
    + content_sha256       = (known after apply)
    + content_sha512       = (known after apply)
    + directory_permission = "0777"
    + file_permission      = "0777"
    + filename             = "automate.txt". arguments
    + id                   = (known after apply)
} -->
