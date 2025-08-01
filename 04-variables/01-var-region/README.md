# Task 12 – Using a Default Variable for AWS Region

This exercise demonstrates how to define and use a simple variable (`aws_region`) with a default value inside `variables.tf`.  
Terraform will automatically use the default value unless overridden.

---

## 🧱 File Structure

01-var-region/
├── main.tf
├── outputs.tf
└── variables.tf

---

## 📄 File Descriptions

### `variables.tf`
Defines a variable with a default value:
```hcl
variable "aws_region" {
  description = "Default AWS region"
  type        = string
  default     = "us-east-1"
}

main.tf
Uses the variable in the provider configuration:
provider "aws" {
  region = var.aws_region
}

outputs.tf
Prints the selected region:
output "selected_region" {
  value = var.aws_region
}


** How to Run
Step 1: Initialize Terraform
terraform init

Step 2: Apply without any input (uses default)
terraform apply
You'll see Terraform use the default region (us-east-1).


**✅ Output Example
Outputs:

selected_region = "us-east-1"


🧼 Cleanup
As no AWS resources are created in this exercise, no cleanup is needed.
