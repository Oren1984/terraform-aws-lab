# Task 27 – Create S3 Buckets from List

This Terraform configuration creates three S3 buckets using a list and `for_each`.

## Bucket Names:
- my-backup-bucket
- my-logs-bucket
- my-media-bucket

## Files
- `main.tf`: Uses `for_each` to create a bucket per list item
- `variables.tf`: Holds the list of suffixes
- `outputs.tf`: Displays the names of the created buckets

## Commands
```bash
terraform init
terraform plan
terraform apply


outputs.tf:
output "bucket_names" {
  value = [for b in aws_s3_bucket.buckets : b.bucket]
}
