# Random suffix to avoid global S3 bucket name collisions
# S3 bucket names are global across all AWS accounts/regions.
resource "random_id" "suffix" {
  byte_length = 2
}

# Minimal S3 bucket for the Jenkins Terraform demo
# The random suffix ensures uniqueness when multiple students run the same code.
resource "aws_s3_bucket" "example" {
  bucket = "jenkins-tf-demo-${random_id.suffix.hex}"
  acl    = "private"  # keep the bucket private
}

# Output the final bucket name so the pipeline can show what was created
output "bucket_name" {
  value       = aws_s3_bucket.example.id
  description = "Provisioned S3 bucket name"
}
