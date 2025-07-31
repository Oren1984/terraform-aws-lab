provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_group" "group" {
  count = var.create_group ? 1 : 0
  name  = "optional-group"
}
