output "iam_user_name" {
  value       = module.read_only_user.iam_user_name
  description = "The IAM user created"
}

output "iam_user_arn" {
  value       = module.read_only_user.iam_user_arn
  description = "The IAM user ARN"
}
