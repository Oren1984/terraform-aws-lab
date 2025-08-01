# Terraform – Variable Management Examples

This directory demonstrates four different ways to manage and pass variables in Terraform.  
Each subfolder includes a separate use case for handling the `aws_region` variable.

---

## 📁 Folder Overview

| Folder | Description | Variable Input Method |
|--------|-------------|------------------------|
| `01-var-region` | Using a variable with a default value | `default` in `variables.tf` |
| `02-var-region-tfvars` | Providing variable values via file | `terraform.tfvars` |
| `03-var-region-cli` | Providing value manually via CLI prompt | Manual input |
| `04-var-region-cli-flag` | Providing value via CLI flag | `-var="..."` argument |

---

## ✅ Summary of Techniques

### 1. **Default Value**
- Variable has a default value in `variables.tf`
- No need for user input or tfvars

### 2. **terraform.tfvars**
- Declares variable in `variables.tf` without default
- Uses `terraform.tfvars` to assign a value

### 3. **Manual CLI Input**
- Declares variable with no default
- Terraform prompts user to enter the value during `apply`

### 4. **CLI Flag Input**
- Declares variable with no default
- Value passed directly using the `-var="..."` flag in the command

---

## 📌 Important Notes

- All examples use the same variable: `aws_region`
- No AWS resources are created in these exercises — only provider configuration and output
- If an invalid value is passed (e.g., `"yes"`), Terraform will not fail unless an actual AWS resource is being created
- These techniques are essential for building reusable and flexible Terraform modules

---

## 🧪 Sample Command Examples

```bash
terraform apply                        # for default or tfvars
terraform apply -var="aws_region=us-east-1"   # for CLI flag input


**🧼 Cleanup
Since no infrastructure is created, there's no need to run terraform destroy.

