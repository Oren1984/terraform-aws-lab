provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "backend_bucket" {
  bucket = "oren-terraform-state-bucket"
  force_destroy = true

  tags = {
    Name        = "Terraform Backend Bucket"
    Environment = "dev"
  }
}
