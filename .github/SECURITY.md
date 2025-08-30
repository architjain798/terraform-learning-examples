# Security Policy

## Supported Versions

This repository contains educational Terraform examples. We provide security updates for:

| Version | Supported          |
| ------- | ------------------ |
| Latest  | :white_check_mark: |

## Reporting a Security Vulnerability

If you discover a security vulnerability in our Terraform examples, please help us by:

### 🔒 For Security Issues:
- **DO NOT** open a public GitHub issue
- Send an email to [your-email@domain.com] with:
  - Description of the vulnerability
  - Steps to reproduce
  - Potential impact
  - Suggested fix (if any)

### 📋 For General Issues:
- Open a GitHub issue using our bug report template
- Include all relevant details and environment information

## Security Considerations

### 🎓 Educational vs Production
**Important**: These examples are designed for learning and may not follow all production security best practices. Always review and harden configurations before using in production environments.

### 🔐 Common Security Notes:
- Examples may use `0.0.0.0/0` CIDR blocks for simplicity
- SSH keys and secrets should never be committed
- AWS resources may incur costs - always clean up after learning
- Review IAM policies before applying in production

### 🛡️ Best Practices Demonstrated:
- S3 bucket encryption and public access blocking
- Security group rule documentation
- Resource tagging for organization
- Proper variable usage instead of hardcoded values

## Response Timeline

- **Security vulnerabilities**: We aim to respond within 48 hours
- **General issues**: We aim to respond within 1 week
- **Feature requests**: We review monthly for educational value

Thank you for helping keep our learning resources safe and educational!
