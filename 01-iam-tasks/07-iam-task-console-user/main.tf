provider "aws" {
  region = "eu-north-1"
}

resource "aws_iam_user" "console_user" {
  name = "oren-console"
}

resource "aws_iam_user_login_profile" "console_user_password" {
  user                    = aws_iam_user.console_user.name
  password_reset_required = true
}
