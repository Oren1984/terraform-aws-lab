provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "basic" {
  bucket = var.bucket_name
}
