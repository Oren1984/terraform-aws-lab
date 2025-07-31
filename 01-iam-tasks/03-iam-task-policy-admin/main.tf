provider "aws" {
  region = "eu-north-1"
}

resource "aws_iam_policy" "example_policy" {
  name        = "CustomS3ReadOnlyPolicy"
  description = "Custom policy that allows listing S3 buckets only"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListAllMyBuckets"
        ]
        Resource = "*"
      }
    ]
  })
}
