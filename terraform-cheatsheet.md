# Terraform Quick Reference Cheatsheet

A handy reference for common Terraform commands, concepts, and best practices. Use this as a fast lookup while working on your projects!

---

## 🛠️ Common Commands

| Command | Description |
|---------|-------------|
| `terraform init` | Initialize a Terraform working directory |
| `terraform plan` | Show execution plan (preview changes) |
| `terraform apply` | Apply changes to reach desired state |
| `terraform destroy` | Destroy all managed resources |
| `terraform validate` | Validate configuration files |
| `terraform fmt` | Format configuration files |
| `terraform state list` | List all resources in state |
| `terraform state show <resource>` | Show details for a resource |
| `terraform state rm <resource>` | Remove resource from state (does not delete in cloud) |
| `terraform import <address> <id>` | Import existing resource into state |
| `terraform output` | Show output values |
| `terraform workspace list` | List workspaces |
| `terraform workspace select <name>` | Switch workspace |
| `terraform refresh` | Update state file with real resource data |

---

## 🧩 File Structure

- `main.tf` – Main resources
- `variables.tf` – Input variables
- `outputs.tf` – Output values
- `provider.tf` – Provider configuration
- `terraform.tfvars` – Variable values (not committed)

---

## 🔑 Core Concepts

- **Resource**: Block that defines an infrastructure object (e.g., `aws_instance`)
- **Data Source**: Read-only information from provider (e.g., `data.aws_ami`)
- **Variable**: Input value for configuration
- **Output**: Value shown after apply (useful for IDs, endpoints)
- **Provider**: Plugin for a specific platform (e.g., AWS, Azure)
- **Module**: Reusable group of resources
- **State**: File tracking real infrastructure (never commit `.tfstate`)
- **Backend**: Where state is stored (local, S3, etc.)
- **Meta-arguments**: `count`, `for_each`, `depends_on`, `lifecycle`

---

## 📝 Resource Block Example

```hcl
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "example-instance"
  }
}
```

---

## ⚙️ Variable Example

```hcl
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
```

---

## 📤 Output Example

```hcl
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.example.id
}
```

---

## 🔒 Security Best Practices

- Never commit secrets or `.tfstate` files
- Use remote backend (S3 + DynamoDB) for team state
- Enable encryption and block public access on S3 buckets
- Use least privilege IAM policies
- Restrict SSH access in security groups

---

## 🧠 Tips & Tricks

- Use `terraform console` for interactive evaluation
- Use `terraform taint <resource>` to force recreation
- Use `terraform graph | dot -Tpng > graph.png` to visualize dependencies
- Use `terraform providers` to see loaded providers
- Use `terraform show` to inspect current state

---

## 📚 Useful Links

- [Terraform Docs](https://developer.hashicorp.com/terraform/docs)
- [AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Registry](https://registry.terraform.io/)
- [Best Practices](https://developer.hashicorp.com/terraform/tutorials/aws/aws-best-practices)

---

Keep this cheatsheet handy for fast reference while working with Terraform!
