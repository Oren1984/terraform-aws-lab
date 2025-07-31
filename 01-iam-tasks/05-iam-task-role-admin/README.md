# 🎯 Task 5 - Create an IAM Role with Admin Access

## 📁 Directory
`iam-task-05-role-admin`

## 📝 Description
This task creates an IAM Role named `oren-admin-role` with a trust policy for EC2, and attaches a custom inline policy that allows **full administrative access** (`Action: "*", Resource: "*"`).

## 📄 main.tf
```hcl
provider "aws" {
  region = "eu-north-1"
}

resource "aws_iam_role" "admin_role" {
  name = "oren-admin-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "admin_policy" {
  name = "oren-admin-policy"
  role = aws_iam_role.admin_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "*"
        Effect = "Allow"
        Resource = "*"
      }
    ]
  })
}

🛠️  Commands Used
terraform init
terraform plan
terraform apply

✅ Result
IAM Role oren-admin-role was successfully created.

A custom inline policy oren-admin-policy with full access was attached.

🧪 Verified via AWS Console → IAM → Roles → oren-admin-role
