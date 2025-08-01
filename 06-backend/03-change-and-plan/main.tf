resource "aws_s3_bucket" "backend_bucket" {
  bucket = "oren-tf-plan-demo-bucket-changed"
}

resource "aws_s3_bucket_acl" "backend_bucket_acl" {
  bucket = aws_s3_bucket.backend_bucket.id
  acl    = "private"
}
