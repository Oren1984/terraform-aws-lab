variable "role_policies" {
  default = {
    Admin  = "arn:aws:iam::aws:policy/AdministratorAccess"
    Reader = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  }
}
