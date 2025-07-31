## Task 18 – Output S3 Bucket ARN

### Objective
Create an S3 bucket and output its Amazon Resource Name (ARN).

### Output
```hcl
output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

Example Output:
bucket_arn = "arn:aws:s3:::oren-s3-output-bucket-2025"
