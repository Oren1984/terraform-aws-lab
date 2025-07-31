# Task 2 – Create a Second IAM User with Terraform

This exercise demonstrates how to reuse and modify Terraform code to create a second IAM user with a different name.

## 🎯 Objective

- Practice reusing Terraform configurations
- Create a second IAM user named `dev-user` using the same structure as in Task 1

## 📄 main.tf

```hcl
provider "aws" {
  region = "eu-north-1"
}

resource "aws_iam_user" "dev_user" {
  name = "dev-user"
}


🛠️  Commands Used
terraform init
terraform plan
terraform apply

✅ Result
User dev-user was successfully created

Verified via:
AWS Console → IAM → Users → dev-user

