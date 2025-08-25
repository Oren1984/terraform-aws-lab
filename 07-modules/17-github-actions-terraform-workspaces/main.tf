# Random suffix to avoid S3 global name collisions
resource "random_id" "suffix" {
  byte_length = 2
}

# Bucket name includes current terraform.workspace for environment isolation
resource "aws_s3_bucket" "example" {
  bucket = "gha-ws-demo-${terraform.workspace}-${random_id.suffix.hex}"
  acl    = "private"

  tags = {
    Environment = var.environment
    ManagedBy   = "GitHubActions"
  }
}

output "bucket_name" {
  value       = aws_s3_bucket.example.id
  description = "Provisioned S3 bucket name"
}

output "workspace" {
  value       = terraform.workspace
  description = "Active Terraform workspace"
}
