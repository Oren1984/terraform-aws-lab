resource "aws_iam_policy_attachment" "policy" {
  for_each   = var.role_policies
  name       = "attach-${each.key}"
  roles      = [each.key]
  policy_arn = each.value
}
