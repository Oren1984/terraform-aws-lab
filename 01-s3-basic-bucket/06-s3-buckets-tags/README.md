# Task 30 – S3 Buckets with Purpose Tags

This Terraform module creates S3 buckets based on a map of names and their purposes.

## Inputs
- `tagged_buckets`: A map where the key is the bucket suffix, and the value is the purpose tag.

## Outputs
- Bucket names and their associated `purpose` tag.

## Commands
```bash
terraform init
terraform plan
terraform apply
