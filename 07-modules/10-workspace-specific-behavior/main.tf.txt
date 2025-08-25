provider "aws" {
  region = "us-east-1"
}

locals {
  # Change ACL based on workspace:
  # - prod  -> private
  # - other -> public-read
  acl_setting = terraform.workspace == "prod" ? "private" : "public-read"
}

resource "aws_s3_bucket" "example" {
  bucket = "tf-demo-${terraform.workspace}"
  acl    = local.acl_setting
}
