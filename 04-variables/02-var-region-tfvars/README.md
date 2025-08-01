# Task 13 – Using `terraform.tfvars` for Variable Input

This exercise demonstrates how to assign a value to a variable (`aws_region`) using the `terraform.tfvars` file instead of a default value.

---

## 🧱 File Structure

02-var-region-tfvars/
├── main.tf
├── outputs.tf
├── terraform.tfvars
└── variables.tf

---

## 📄 File Descriptions

### `variables.tf`
Declares a variable with no default value:
```hcl
variable "aws_region" {
  description = "AWS region defined via tfvars"
  type        = string
}

terraform.tfvars
Provides the value for the variable:
aws_region = "eu-north-1"

main.tf
Uses the variable in the provider block:y
provider "aws" {
  region = var.aws_region
}

outputs.tf
Prints the selected region:
output "region_in_use" {
  value = var.aws_region
}


** How to Run
Step 1: Initialize Terraform
terraform init

Step 2: Apply (Terraform will auto-detect terraform.tfvars)
terraform apply


**✅ Output Example
Outputs:
region_in_use = "eu-north-1"


**🧼 Cleanup
No AWS resources are created in this exercise, so cleanup is not required.
