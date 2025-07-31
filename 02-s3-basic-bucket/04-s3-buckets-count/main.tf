provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "buckets" {
  count  = 2
  bucket = "oren-counted-bucket-${count.index}-2025"
}
