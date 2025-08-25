output "bucket_name" {
  value       = aws_s3_bucket.example.id
  description = "The created S3 bucket name"
}

output "bucket_acl" {
  value       = aws_s3_bucket.example.acl
  description = "The ACL applied to the bucket"
}
