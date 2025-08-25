terraform {
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

# 1) Create Administrators group with full admin policy
module "admins_group" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "~> 5.0"

  name = "Administrators"

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess"
  ]
}

# 2) Create user and attach to the Administrators group
module "admin_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 5.0"

  name   = var.user_name
  groups = [module.admins_group.iam_group_name]

  tags = {
    Project = "TerraformDemo"
    Env     = "dev"
  }

  create_iam_access_key = false
}
