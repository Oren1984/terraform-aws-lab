# 🎯 Task 5 - Create an IAM Role with S3 ReadOnly Policy

## 📁 Directory
`iam-task-05-role-s3readonly`

## 📝 Description
This task creates an IAM Role named `oren-s3readonly-role` with a trust policy for EC2, and attaches a custom inline policy that allows **read-only access to all S3 buckets** (`Get*`, `List*`).

## 📄 main.tf
```hcl
provider "aws" {
  region = "eu-north-1"
}

resource "aws_iam_role" "s3readonly_role" {
  name = "oren-s3readonly-role"

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

resource "aws_iam_role_policy" "s3readonly_policy" {
  name = "oren-s3readonly-policy"
  role = aws_iam_role.s3readonly_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:Get*",
          "s3:List*"
        ]
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
IAM Role oren-s3readonly-role was successfully created.

A custom inline policy oren-s3readonly-policy with S3 read-only permissions was attached.

🧪 Verified via AWS Console → IAM → Roles → oren-s3readonly-role
