# Task 1 – Create IAM User with Terraform

In this exercise, an IAM user named `oren-user` was created using Terraform as part of an AWS Infrastructure-as-Code (IaC) practice.

## 🎯 Objective

- Define an AWS provider using `provider` block
- Create an IAM user using the `aws_iam_user` resource
- Connect Terraform to AWS using proper credentials
- Apply the configuration to create the user
- Verify the result using the AWS Console

## 📄 main.tf

```hcl
provider "aws" {
  region = "eu-north-1"
}

resource "aws_iam_user" "oren_user" {
  name = "oren-user"
}


🛠️ Commands Used:
terraform init
terraform plan
terraform apply


✅ Result
User oren-user was successfully created


Verified via:
AWS Console → IAM → Users → oren-user
