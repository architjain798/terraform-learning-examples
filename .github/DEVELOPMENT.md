# Development Workflow Guide

This guide explains the development workflow and quality assurance measures for the Terraform learning repository.

## 🚀 Quick Start

1. **Clone the repository**
2. **Setup development environment:**
   ```bash
   ./.githooks/setup-hooks.sh
   ```
3. **Start developing with automated quality checks!**

## 🔧 Git Hooks System

### Overview
The repository uses Git hooks to automatically validate code quality before commits. This ensures:
- ✅ Consistent code formatting
- 🔒 No secrets accidentally committed
- 📝 High-quality documentation
- 🧪 Valid Terraform configurations

### Hook Types

#### Pre-commit Hook (`.githooks/pre-commit`)
Runs before every commit to validate:

**🔍 Security Checks:**
- Scans for AWS credentials, passwords, tokens
- Prevents committing `terraform.tfvars` files
- Blocks private key files (`.key`, `.pem`)

**🧹 Terraform Validation:**
- Checks formatting with `terraform fmt`
- Validates syntax with `terraform validate`
- Runs TFLint for best practices (if installed)
- Ensures provider version constraints

**📚 Documentation Quality:**
- Validates Markdown with markdownlint
- Checks for required README sections
- Ensures example directories have proper documentation

**🐚 Shell Script Validation:**
- Verifies shebang lines
- Checks executable permissions
- Runs syntax validation
- Optional ShellCheck integration

**📁 Structure Validation:**
- Ensures example directories have required files
- Validates consistent naming conventions
- Checks for complete Terraform modules

#### Commit Message Hook (`.githooks/commit-msg`)
Validates commit messages for:
- Minimum length requirements
- Encouraging conventional commit format
- Providing helpful formatting tips

### Manual Hook Execution

Test hooks without committing:
```bash
# Run all pre-commit checks
./.githooks/pre-commit

# Test commit message format
echo "your commit message" | ./.githooks/commit-msg /dev/stdin
```

## 🛠️ Development Tools

### Required Tools
- **Terraform** (>= 1.0): Infrastructure as Code
- **Git**: Version control

### Recommended Tools
- **TFLint**: Terraform linting and best practices
  ```bash
  brew install tflint
  ```
- **markdownlint**: Documentation quality
  ```bash
  npm install -g markdownlint-cli
  ```
- **ShellCheck**: Shell script analysis
  ```bash
  brew install shellcheck
  ```

### Configuration Files

**`.tflint.hcl`**: TFLint configuration
- Terraform best practices
- AWS-specific rules
- Educational-focused settings

**`.markdownlint.json`**: Markdown linting rules
- Consistent documentation formatting
- Learning-friendly settings

## 📝 Code Standards

### Terraform Files
```hcl
# Use descriptive resource names
resource "aws_instance" "web_server" {
  # Include comments explaining choices
  ami           = var.ami_id  # Use variables, not hardcoded values
  instance_type = var.instance_type

  # Add comprehensive tags
  tags = {
    Name        = "web-server"
    Environment = var.environment
    Project     = var.project_name
  }
}
```

### Variable Definitions
```hcl
variable "instance_type" {
  description = "EC2 instance type for the web server"
  type        = string
  default     = "t2.micro"

  validation {
    condition     = contains(["t2.micro", "t2.small", "t2.medium"], var.instance_type)
    error_message = "Instance type must be t2.micro, t2.small, or t2.medium."
  }
}
```

### Documentation Structure
```markdown
# Example Title

## What This Example Does
Brief description of the infrastructure created.

## Prerequisites
- AWS CLI configured
- Terraform installed

## How to Run
Step-by-step instructions...

## Customization
How to modify the example...

## Learning Points
What concepts this demonstrates...
```

## 🔄 Development Workflow

### Adding a New Example

1. **Create directory with numbering:**
   ```bash
   mkdir 03-new-example
   cd 03-new-example
   ```

2. **Create required files:**
   ```bash
   touch main.tf variables.tf outputs.tf provider.tf README.md
   ```

3. **Develop the example:**
   - Write Terraform configurations
   - Add comprehensive documentation
   - Include learning objectives

4. **Test locally:**
   ```bash
   terraform init
   terraform validate
   terraform plan
   ```

5. **Commit with quality checks:**
   ```bash
   git add .
   git commit -m "feat: add new example for [service/concept]"
   ```

### Updating Existing Examples

1. **Make changes** to Terraform files or documentation
2. **Test changes:**
   ```bash
   terraform fmt
   terraform validate
   ```
3. **Commit with descriptive message:**
   ```bash
   git commit -m "fix(ec2): improve security group documentation"
   ```

### Pre-commit Checklist

Before committing, ensure:
- [ ] Terraform files are formatted (`terraform fmt`)
- [ ] Configurations validate (`terraform validate`)
- [ ] Documentation is complete and clear
- [ ] No sensitive information included
- [ ] Shell scripts have proper permissions
- [ ] Commit message is descriptive

## 🚨 Bypassing Hooks

**Only when absolutely necessary:**
```bash
git commit --no-verify -m "emergency fix"
```

**When to bypass:**
- Emergency hotfixes
- Documentation-only changes that fail formatting
- Temporary commits during development

**Best practice:** Fix issues instead of bypassing hooks.

## 🐛 Troubleshooting

### Common Issues

**"Terraform not found"**
```bash
# Install Terraform
brew install terraform
# or download from https://terraform.io/downloads
```

**"Permission denied" on hooks**
```bash
chmod +x .githooks/*
```

**"TFLint failed"**
```bash
# Install TFLint
brew install tflint

# Initialize in example directory
cd 01-aws-ec2-instances
tflint --init
```

**Markdown linting errors:**
```bash
# Install markdownlint
npm install -g markdownlint-cli

# Fix automatically where possible
markdownlint --fix **/*.md
```

### Getting Help

1. **Check this guide** for common solutions
2. **Review hook output** for specific error messages
3. **Run hooks manually** to debug issues
4. **Open an issue** if problems persist

## 🎯 Benefits

### For Developers
- **Catch issues early** before they reach the repository
- **Maintain consistent quality** across all examples
- **Learn best practices** through automated feedback
- **Save time** on code reviews

### For Learners
- **High-quality examples** that follow best practices
- **Consistent formatting** for easier reading
- **Secure configurations** without accidental secrets
- **Comprehensive documentation** for better learning

---

**Happy coding!** 🚀 The automated quality checks are here to help maintain the educational value and security of this repository.
