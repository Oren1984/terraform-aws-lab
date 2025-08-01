# Task 14 – Passing Variable via CLI (Manual Input)

This exercise demonstrates how to pass a variable (`aws_region`) manually during Terraform execution via the CLI prompt.  
No default value or `terraform.tfvars` is used.

---

## 🧱 File Structure

03-var-region-cli/
├── main.tf
├── outputs.tf
└── variables.tf

---

## 📄 File Descriptions

### `variables.tf`
Declares the variable `aws_region` without a default:
```hcl
variable "aws_region" {
  description = "AWS region passed via CLI"
  type        = string
}

main.tf
Uses the variable in the AWS provider configuration:
provider "aws" {
  region = var.aws_region
}

outputs.tf
Prints the selected region after applying:
output "cli_region_output" {
  value = var.aws_region
}


** How to Run
Step 1: Initialize Terraform
terraform init

Step 2: Run and input value manually
terraform apply

You'll be prompted to enter a value:
var.aws_region
  AWS region passed via CLI

  Enter a value: eu-west-1


**⚠️  Important Note
If you enter an invalid value (e.g., "yes"), Terraform will still apply if no real AWS resources are being created.
However, using invalid regions will cause errors or failed deployments if any AWS infrastructure is involved.


** ✅ Example Output
Outputs:

cli_region_output = "eu-west-1"


** 🧼 Cleanup
No resources are created in this exercise, so no cleanup is required.
