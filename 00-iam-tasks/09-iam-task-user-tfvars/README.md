# 09 - IAM Task - User with .tfvars Override

## 🎯 Task Objective
Create an IAM User using a variable, and override the default value using a `.tfvars` file.

## 📄 Terraform Files

### variables.tf
```hcl
variable "user_name" {
  default = "default-name"
}

terraform.tfvars:
user_name = "melina-from-tfvars"

main.tf:
provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "user" {
  name = var.user_name
}

🛠️  Commands Used

terraform init
terraform plan
terraform apply

✅ Result
IAM User named melina-from-tfvars was successfully created using override from .tfvars.

