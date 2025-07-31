provider "aws" {
  region = "eu-north-1"
}

resource "aws_iam_role" "admin_role" {
  name = "oren-admin-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "admin_policy" {
  name = "oren-admin-policy"
  role = aws_iam_role.admin_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "*"
        Effect = "Allow"
        Resource = "*"
      }
    ]
  })
}
