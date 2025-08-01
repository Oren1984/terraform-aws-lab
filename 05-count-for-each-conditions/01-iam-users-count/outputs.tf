output "user_names" {
  value = [for u in aws_iam_user.users : u.name]
}
