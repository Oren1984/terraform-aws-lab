# Random suffix to avoid S3 global name collisions
resource "random_id" "suffix" {
  byte_length = 2
}

resource "aws_s3_bucket" "example" {
  bucket = "gha-oidc-demo-${random_id.suffix.hex}"
  acl    = "private"

  tags = {
    ManagedBy = "GitHubActionsOIDC"
  }
}

output "bucket_name" {
  value       = aws_s3_bucket.example.id
  description = "Provisioned S3 bucket name"
}
