provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "plan_demo" {
  bucket = "oren-tf-plan-demo-bucket"
  tags = {
    Name        = "PlanExample"
    Environment = "dev"
  }
}

