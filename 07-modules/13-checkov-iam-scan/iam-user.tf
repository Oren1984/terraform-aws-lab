provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "admin" {
  name = "admin-user"
}

resource "aws_iam_user_policy" "admin_policy" {
  name = "admin-policy"
  user = aws_iam_user.admin.name

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Action"   : "*",
      "Effect"   : "Allow",
      "Resource" : "*"
    }]
  })
}
