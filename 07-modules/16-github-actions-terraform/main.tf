# Random suffix to avoid global S3 bucket name collisions
resource "random_id" "suffix" {
  byte_length = 2
}

resource "aws_s3_bucket" "example" {
  bucket = "gha-tf-demo-${random_id.suffix.hex}"
  acl    = "private"
}

output "bucket_name" {
  value       = aws_s3_bucket.example.id
  description = "Provisioned S3 bucket name"
}
