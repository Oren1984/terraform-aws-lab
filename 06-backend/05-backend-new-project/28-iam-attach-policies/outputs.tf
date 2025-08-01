output "attached_roles" {
  value = [for r in aws_iam_policy_attachment.policy : tolist(r.roles)[0]]
}
