provider "aws" {
  region = "eu-north-1"
}

resource "aws_iam_policy" "s3_readonly" {
  name        = "S3ReadOnlyPolicy"
  description = "Policy that allows read-only access to all S3 buckets"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:Get*",
          "s3:List*"
        ]
        Resource = "*"
      }
    ]
  })
}
