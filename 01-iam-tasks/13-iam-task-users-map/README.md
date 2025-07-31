# Task 26 – Create IAM Users from Map

This Terraform configuration demonstrates how to create multiple IAM users from a `map` variable and tag them based on their team.

## Files

- `main.tf`: Defines IAM users using `for_each`.
- `variables.tf`: Declares the `iam_users` map variable.
- `terraform.tfvars` (optional): Can override the user map.

## How it Works

Each key in the map becomes a user name, and each value is used as a tag:

```hcl
variable "iam_users" {
  default = {
    daniel = "DevOps"
    shira  = "Dev"
  }
}

resource "aws_iam_user" "users" {
  for_each = var.iam_users
  name     = each.key
  tags = {
    team = each.value
  }
}


This configuration will create two IAM users:
daniel with the tag team = DevOps
shira with the tag team = Dev


Example Usage:
terraform init
terraform plan
terraform apply

