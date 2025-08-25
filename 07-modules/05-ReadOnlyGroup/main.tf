terraform {
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

# 1) קבוצה עם מדיניות ReadOnlyAccess
module "readonly_group" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "~> 5.0"

  name = "ReadOnlyGroup"

  # מצמידים את המדיניות המנוהלת של AWS
  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess"
  ]
}

# 2) משתמש שמצורף לקבוצת ReadOnlyGroup
module "read_only_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 5.0"

  name   = var.user_name
  groups = [module.readonly_group.iam_group_name]

  # אופציונלי: אם לא רוצים מפתחות גישה (נמנע חשיפת סודות)
  create_iam_access_key = false
}
