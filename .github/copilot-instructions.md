# GitHub Copilot Instructions for Terraform Learning Repository

## Project Context

This is a **Terraform learning repository** focused on educational examples and AWS infrastructure management. The primary goal is to teach Infrastructure as Code (IaC) concepts through practical, well-documented examples.

## Code Generation Guidelines

### Terraform Best Practices

- Always use **meaningful resource names** that clearly describe their purpose
- Include **comprehensive comments** explaining complex configurations
- Use **variables** instead of hardcoded values for all configurable options
- Add **proper resource tags** for organization and cost tracking
- Follow **security best practices** (encryption, least privilege, etc.)
- Use **provider version constraints** in all configurations
- Include **lifecycle management** rules where appropriate

### File Structure Standards

- Each example should have: `main.tf`, `variables.tf`, `outputs.tf`, `provider.tf`, and `README.md`
- Use **descriptive variable names** with clear descriptions
- Include **useful outputs** that provide important resource information
- Add **default values** for variables where sensible
- Group **related resources** logically in the same file

### Documentation Requirements

- Write **clear, beginner-friendly explanations** for all concepts
- Include **step-by-step setup instructions** in README files
- Add **security warnings** where configurations are educational but not production-ready
- Provide **troubleshooting tips** for common issues
- Include **learning objectives** for each example

### AWS Resource Guidelines

- Use **security groups** with descriptive rules and comments
- Enable **encryption** on all storage resources
- Use **IAM best practices** with least privilege principles
- Add **proper vpc and subnet configurations** where needed
- Include **cost optimization** considerations in comments

### Code Style

- Use `terraform fmt` formatting standards
- Add **inline comments** for complex expressions
- Use **consistent naming conventions** across all resources
- Prefer **explicit configurations** over implicit defaults for clarity
- Include **example terraform.tfvars** in documentation

### Learning Focus

- Prioritize **educational value** over production complexity
- Show **multiple approaches** to solving the same problem when helpful
- Explain **Terraform concepts** like state, plan, apply, destroy
- Demonstrate **meta-arguments** like for_each, count, depends_on
- Include **common patterns** and their use cases

### Error Handling

- Add **validation rules** for variables where appropriate
- Include **descriptive error messages** in validation
- Use **precondition and postcondition blocks** for complex scenarios
- Provide **clear troubleshooting steps** in documentation

## Chat Interaction Guidelines

- When explaining Terraform concepts, use **simple analogies** suitable for beginners
- Always provide **complete, working examples** rather than snippets
- Include **commands to test** the suggested configurations
- Suggest **improvements** for existing code while explaining the benefits
- Reference **official Terraform and AWS documentation** when helpful

## Repository Standards

- Maintain **consistent folder naming** with numbered prefixes (00-, 01-, 02-)
- Each example should **build upon previous concepts**
- Include **cross-references** between related examples
- Keep **examples focused** on specific learning objectives
- Ensure all code is **tested and functional**
