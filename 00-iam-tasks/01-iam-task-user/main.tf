provider "aws" {
  region = "eu-north-1"
}

resource "aws_iam_user" "oren_user" {
  name = "oren-user"
}
