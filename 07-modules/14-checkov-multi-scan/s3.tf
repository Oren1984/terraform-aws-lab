# Public S3 bucket (insecure on purpose)
resource "aws_s3_bucket" "public_bucket" {
  bucket = "public-bucket-checkov-demo"
  acl    = "public-read" # insecure
}

# Also missing:
# - server_side_encryption_configuration
# - versioning
# - block public access
