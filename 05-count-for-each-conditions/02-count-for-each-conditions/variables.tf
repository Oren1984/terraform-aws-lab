variable "role_policies" {
  description = "Map of roles to policies"
  type        = map(string)
  default = {
    Admin  = "arn:aws:iam::aws:policy/AdministratorAccess"
    Reader = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  }
}
