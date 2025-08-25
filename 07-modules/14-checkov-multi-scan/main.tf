provider "aws" {
  region = "us-east-1"
}

# Intentionally missing backend and versions blocks for simplicity in the demo.

# Example insecure resource (no encryption at rest)
resource "aws_s3_bucket" "no_encrypt_bucket" {
  bucket = "no-encrypt-bucket-checkov-demo"
  acl    = "private"
}

# Missing bucket encryption and versioning on purpose
