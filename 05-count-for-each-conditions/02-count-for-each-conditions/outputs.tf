output "attached_policies" {
  value = { for k, v in var.role_policies : k => v }
}
