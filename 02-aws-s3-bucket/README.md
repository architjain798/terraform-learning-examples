# AWS S3 Bucket Example

This example demonstrates creating a secure S3 bucket with best practices for versioning, encryption, and access control.

## What This Example Creates

- S3 bucket with a globally unique name
- Versioning enabled for object history
- Server-side encryption (AES256)
- Public access blocked for security
- Proper resource tagging

## Prerequisites

- AWS CLI configured with appropriate credentials
- Permissions to create S3 buckets

## Files

- `s3.tf` - S3 bucket and related security configurations
- `variables.tf` - Input variables for customization
- `outputs.tf` - Output values (bucket name, ARN, etc.)
- `provider.tf` - AWS provider configuration

## Setup Instructions

1. Navigate to this directory:
   ```bash
   cd 02-aws-s3-bucket
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

5. Verify bucket creation:
   ```bash
   # List the bucket
   aws s3 ls

   # Get bucket info
   terraform output bucket_name
   terraform output bucket_arn
   ```

6. Test bucket functionality:
   ```bash
   # Upload a test file
   echo "Hello from Terraform!" > test.txt
   aws s3 cp test.txt s3://$(terraform output -raw bucket_name)/

   # List bucket contents
   aws s3 ls s3://$(terraform output -raw bucket_name)/

   # Download the file
   aws s3 cp s3://$(terraform output -raw bucket_name)/test.txt downloaded.txt
   cat downloaded.txt
   ```

7. Clean up when done:
   ```bash
   # Remove all objects first
   aws s3 rm s3://$(terraform output -raw bucket_name)/ --recursive

   # Then destroy the bucket
   terraform destroy
   ```

## Customization

Create a `terraform.tfvars` file to customize the bucket:

```hcl
bucket_name = "my-company-data-bucket-12345"
aws_region = "us-west-2"
environment = "production"
project_name = "data-lake"
```

## Security Features

✅ **Security Best Practices Implemented:**

- **Public Access Blocked**: Prevents accidental public exposure
- **Versioning Enabled**: Maintains object history and protects against accidental deletion
- **Server-Side Encryption**: All objects encrypted at rest
- **Resource Tagging**: Proper organization and cost tracking

## Learning Points

- S3 bucket creation and configuration
- Bucket versioning for data protection
- Server-side encryption configuration
- Public access block for security
- Resource tagging for organization
- Output values for bucket information
- Variable usage for customization
- AWS provider configuration with default tags
- Understanding bucket naming requirements (globally unique)

## Common Issues

**Bucket Name Conflicts**: S3 bucket names must be globally unique. If you get an error about the bucket already existing, change the `bucket_name` variable to something unique.

**Deletion Issues**: If `terraform destroy` fails, ensure all objects are removed from the bucket first using the AWS CLI as shown in the cleanup steps above.
