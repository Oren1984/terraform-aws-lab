## Task 23 – Create 2 S3 Buckets using count

### Objective
Provision two S3 buckets using Terraform's `count` meta-argument.

### Resource Definition
```hcl
resource "aws_s3_bucket" "buckets" {
  count  = 2
  bucket = "oren-counted-bucket-${count.index}-2025"
}

Output:
output "bucket_names" {
  value = [for b in aws_s3_bucket.buckets : b.bucket]
}

Expected Bucket Names:
* oren-counted-bucket-0-2025
* oren-counted-bucket-1-2025


