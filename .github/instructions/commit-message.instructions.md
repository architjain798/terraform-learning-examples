# Terraform Learning Repository - Commit Message Guidelines

## Commit Message Format

Use conventional commit format with the following structure:
```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

## Types
- **feat**: A new feature or example
- **fix**: A bug fix in configuration or code
- **docs**: Documentation changes only
- **style**: Formatting, missing semicolons, etc. (no code changes)
- **refactor**: Code restructuring without changing functionality
- **test**: Adding missing tests or correcting existing tests
- **chore**: Build tasks, package manager configs, etc.
- **infra**: Infrastructure-related changes (Terraform configurations)

## Scopes for This Project
- **aws-ec2**: EC2 instance configurations and examples
- **aws-s3**: S3 bucket configurations and examples
- **local**: Local provider examples
- **variables**: Variable definitions and configurations
- **security**: Security group, IAM, and security-related changes
- **scripts**: User data scripts and shell scripts
- **docs**: Documentation and README updates
- **examples**: New learning examples or tutorials

## Guidelines

### Description (Subject Line)
- Use imperative mood ("add feature" not "added feature")
- Start with lowercase letter
- No period at the end
- Maximum 72 characters
- Be specific about what changed

### Body (Optional)
- Use when the commit needs more explanation
- Explain the "why" not the "what"
- Wrap at 72 characters
- Include any breaking changes

### Examples

**Good commit messages:**
```
feat(aws-ec2): add dynamic storage configuration based on environment

infra(security): restrict SSH access to specific CIDR blocks

docs(examples): add comprehensive variable validation examples

fix(aws-ec2): resolve terraform validation errors in main.tf

refactor(variables): migrate instance config to locals for environment-based logic
```

**For learning-focused changes:**
```
feat(examples): add new EC2 instance example with nginx setup

docs(aws-ec2): explain lifecycle management in terraform configuration

chore(scripts): update ubuntu user data script with better error handling
```

## Special Considerations

### Infrastructure Changes
- Always mention if the change affects resource creation/destruction
- Include cost implications if significant
- Mention any new AWS services or resources introduced

### Educational Content
- Emphasize learning objectives in commit messages
- Mention if examples demonstrate new Terraform concepts
- Include any prerequisites or setup requirements in body

### Security Changes
- Clearly state security improvements or modifications
- Mention any changes to access controls or permissions
- Include validation steps if applicable

## Breaking Changes
If a commit introduces breaking changes:
- Include "BREAKING CHANGE:" in the footer
- Explain what breaks and how to migrate
- Example:
```
feat(variables): restructure instance configuration format

BREAKING CHANGE: instance_types variable replaced with instance_configurations.
Update your terraform.tfvars to use the new object format with detailed settings.
```
