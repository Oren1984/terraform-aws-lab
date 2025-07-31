provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "users" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

output "user_names" {
  value = [for u in aws_iam_user.users : u.name]
}
