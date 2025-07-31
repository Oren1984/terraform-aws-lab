provider "aws" {
  region = "eu-north-1"
}

resource "aws_iam_user" "dev_user" {
  name = "dev-user"
}
