# Task 24 – Conditionally Create an IAM Group

This Terraform configuration demonstrates how to create an IAM group only when a specific variable is true.

## Files

- `main.tf`: Defines the IAM group with a conditional count.
- `variables.tf`: Declares the `create_group` variable.
- `terraform.tfvars` (optional): Can override `create_group`.

## How it Works

The IAM group is created **only if** the `create_group` variable is set to `true`.

```hcl
count = var.create_group ? 1 : 0

Example Usage:
terraform init
terraform plan
terraform apply

You can disable the group creation by setting:
create_group = false

in a terraform.tfvars file or via CLI input.

