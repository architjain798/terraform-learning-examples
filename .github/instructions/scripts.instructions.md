---
description: "Shell script standards for Terraform examples"
applyTo: "**/*.sh"
---

# Shell Script Guidelines

## Script Standards

- Always start with proper shebang: `#!/bin/bash`
- Include set -e for error handling in setup scripts
- Add comments explaining each significant step
- Use descriptive variable names
- Include error checking for critical operations

## User Data Scripts

- Focus on automation and reproducibility
- Include package updates before installations
- Use systemctl for service management
- Add logging for troubleshooting
- Keep scripts simple and focused on single purposes

## Security Practices

- Avoid hardcoded credentials or sensitive data
- Use secure methods for downloading software
- Verify package signatures when possible
- Run services with appropriate user permissions
- Include firewall configurations if needed

## Documentation

- Comment each section explaining its purpose
- Include prerequisites and assumptions
- Add troubleshooting information
- Explain any non-standard configurations
- Reference official installation guides

## Error Handling

- Check if services started successfully
- Validate installations completed correctly
- Include fallback options for common failures
- Log errors to appropriate locations
- Provide clear error messages
