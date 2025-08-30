---
description: "Terraform configuration best practices"
applyTo: "**/*.tf"
---

# Terraform Configuration Guidelines

## General Standards

- Use descriptive resource names that indicate purpose and environment
- Always include provider version constraints for reproducibility
- Add comprehensive comments explaining complex logic
- Use variables for all configurable values
- Include proper resource tagging strategy

## Resource Naming

- Use kebab-case for resource names: `aws_instance.web-server`
- Include environment/purpose in names: `security-group-web`, `bucket-logs`
- Be consistent across all resources in the same configuration

## Variable Practices

- Provide meaningful descriptions for all variables
- Include type constraints: `type = string`, `type = number`, etc.
- Set sensible default values where appropriate
- Use validation rules for input constraints
- Group related variables logically

## Security Requirements

- Enable encryption on all storage resources
- Use security groups with minimal required access
- Avoid hardcoded secrets (use variables or external sources)
- Include public access blocks for S3 buckets
- Add security-related comments explaining choices

## Output Guidelines

- Include useful outputs like IDs, ARNs, and endpoints
- Add descriptions explaining what each output provides
- Use maps for outputs when working with multiple similar resources
- Consider what information would be useful for other configurations

## Code Organization

- Keep main.tf focused on primary resources
- Use separate files for complex nested resources if needed
- Group related resources together logically
- Order resources by dependencies when possible
