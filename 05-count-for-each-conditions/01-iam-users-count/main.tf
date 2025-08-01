provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "users" {
  count = 3
  name  = "student-${count.index}"
}
