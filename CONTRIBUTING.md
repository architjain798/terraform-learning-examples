# Contributing to Terraform Practice

Thank you for your interest in contributing to this Terraform learning repository! This guide will help you understand how to contribute effectively.

## 🎯 Purpose

This repository is designed for learning Terraform concepts and AWS resource management. Contributions should focus on:

- Educational value
- Best practices demonstration
- Clear documentation
- Beginner-friendly examples

## 🤝 How to Contribute

### Adding New Examples

1. **Create a new numbered directory** following the naming convention:
   ```
   XX-service-description/
   ```
   Example: `03-aws-lambda-function/`

2. **Include all required files**:
   - `main.tf` - Main resource definitions
   - `variables.tf` - Input variables
   - `outputs.tf` - Output values
   - `provider.tf` - Provider configuration
   - `README.md` - Detailed example documentation

3. **Follow the example structure**:
   - Use descriptive resource names
   - Include proper comments
   - Use variables for customization
   - Include security best practices
   - Add appropriate tags

### Improving Existing Examples

1. **Documentation improvements**
2. **Code optimization**
3. **Security enhancements**
4. **Additional features**
5. **Bug fixes**

### Code Standards

- **Formatting**: Use `terraform fmt` to format all `.tf` files
- **Validation**: Ensure `terraform validate` passes
- **Comments**: Add clear comments explaining complex configurations
- **Variables**: Use meaningful variable names with descriptions
- **Outputs**: Include useful outputs with descriptions

### Documentation Standards

- **README files**: Each example must have a comprehensive README
- **Code comments**: Explain complex Terraform concepts
- **Security notes**: Highlight security considerations
- **Prerequisites**: List all requirements clearly

## 📝 Pull Request Process

1. **Fork the repository**
2. **Create a feature branch**:
   ```bash
   git checkout -b feature/new-example-name
   ```
3. **Make your changes**
4. **Test your changes**:
   ```bash
   terraform fmt
   terraform validate
   terraform plan
   ```
5. **Update documentation** as needed
6. **Commit with clear messages**:
   ```bash
   git commit -m "Add: AWS Lambda function example with API Gateway"
   ```
7. **Push to your fork**
8. **Create a Pull Request**

### Pull Request Template

```markdown
## Description
Brief description of what this PR adds or changes.

## Type of Change
- [ ] New example
- [ ] Bug fix
- [ ] Documentation update
- [ ] Code improvement

## Checklist
- [ ] Code follows the style guidelines
- [ ] Self-review completed
- [ ] Comments added for complex code
- [ ] Documentation updated
- [ ] terraform fmt applied
- [ ] terraform validate passes
- [ ] Tested locally
```

## 🔍 Review Process

All submissions will be reviewed for:

1. **Educational value**
2. **Code quality**
3. **Security best practices**
4. **Documentation completeness**
5. **Terraform best practices**

## 🛡️ Security Guidelines

- **No sensitive data**: Never commit secrets, keys, or credentials
- **Security comments**: Highlight security considerations
- **Best practices**: Follow AWS and Terraform security best practices
- **Access control**: Use least privilege principles

## 📚 Resources

- [Terraform Documentation](https://terraform.io/docs)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)

## 🆘 Getting Help

- **Issues**: Open an issue for bugs or feature requests
- **Discussions**: Use discussions for questions
- **Documentation**: Check existing README files

## 📄 License

By contributing, you agree that your contributions will be licensed under the same license as this project.

---

Happy learning and contributing! 🚀
