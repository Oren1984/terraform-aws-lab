# Task 3 – Create a Custom IAM Policy with Terraform

This task demonstrates how to create a custom IAM policy using Terraform with limited permissions (least privilege), focusing on allowing S3 bucket listing only.

## 🎯 Objective

- Learn how to define IAM policies using `aws_iam_policy`
- Use `jsonencode()` to embed JSON policy structure in Terraform
- Follow best practices by granting limited access

## 📄 main.tf

```hcl
provider "aws" {
  region = "eu-north-1"
}

resource "aws_iam_policy" "example_policy" {
  name        = "CustomS3ReadOnlyPolicy"
  description = "Custom policy that allows listing S3 buckets only"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListAllMyBuckets"
        ]
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
IAM policy CustomS3ReadOnlyPolicy was successfully created.

Verified in:
AWS Console → IAM → Policies → CustomS3ReadOnlyPolicy

