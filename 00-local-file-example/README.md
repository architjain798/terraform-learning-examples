# Local File Example

This is the simplest Terraform example that demonstrates basic concepts without requiring cloud resources.

## What This Example Does

Creates a local text file on your machine using Terraform's `local` provider.

## Files

- `main.tf` - Defines the local file resource
- `variables.tf` - Input variables for customization
- `outputs.tf` - Output values after resource creation
- `provider.tf` - Provider configuration

## How to Run

1. Navigate to this directory:
   ```bash
   cd 00-local-file-example
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Review the plan:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

5. Check the created file:
   ```bash
   cat automate.txt
   ```

6. Clean up when done:
   ```bash
   terraform destroy
   ```

## Customization

You can customize the file creation by creating a `terraform.tfvars` file:

```hcl
filename = "my-custom-file.txt"
file_content = "This is my custom content!"
file_permission = "0755"
```

## Learning Points

- Basic Terraform workflow (init, plan, apply, destroy)
- Resource definition and configuration
- Using variables for customization
- Understanding outputs
- Provider configuration
- Lifecycle management
