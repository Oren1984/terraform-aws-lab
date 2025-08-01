resource "aws_iam_policy_attachment" "policy" {
  for_each   = var.role_policies
  name       = "attach-${each.key}"
  roles      = [aws_iam_role.roles[each.key].name]
  policy_arn = each.value
}
