resource "aws_iam_user" "users" {
  for_each = var.iam_users
  name     = each.key

  tags = {
    team = each.value
  }
}
