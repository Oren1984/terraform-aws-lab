# 08 - IAM Task - User with Variable

## 🎯 Task Objective
Create an IAM User where the name is passed using a Terraform variable.

## 📄 Terraform Files

### variables.tf
```hcl
variable "user_name" {
  default = "dynamic-user"
}
main.tf
hcl
Copy
Edit
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
IAM User named dynamic-user was successfully created using a variable.

🔍 Verification
Checked via AWS Console → IAM → Users → dynamic-user
