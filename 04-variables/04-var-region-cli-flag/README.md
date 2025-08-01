# Task 15 – Passing Variable via CLI Flag

This exercise demonstrates how to pass a variable (`aws_region`) using the Terraform `-var` CLI flag, instead of using default values or `terraform.tfvars`.

---

## 🧱 File Structure

04-var-region-cli-flag/
├── main.tf
├── outputs.tf
└── variables.tf

---

## 📄 File Descriptions

### `variables.tf`
Declares the variable without a default:
```hcl
variable "aws_region" {
  description = "AWS region passed via CLI flag"
  type        = string
}


main.tf
Uses the variable in the provider:
provider "aws" {
  region = var.aws_region
}


outputs.tf
Displays the region passed:
output "cli_flag_region_output" {
  value = var.aws_region
}

** How to Run
Step 1: Initialize Terraform
terraform init

Step 2: Apply with CLI flag
terraform apply -var="aws_region=eu-west-1"


✅ Output Example
Outputs:
cli_flag_region_output = "eu-west-1"


🧼 Cleanup
As this exercise doesn't create any AWS resources, no cleanup is required.
