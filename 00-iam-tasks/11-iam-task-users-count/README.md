# Task 19 – Create IAM Users with Count and Output Names

## Goal
Use `count` to create multiple IAM users and output their names.

## Files
- `main.tf`: Defines AWS provider, IAM users using count, and an output block.
- `variables.tf`: Contains a list variable `user_names`.
- `terraform.tfvars`: Optional file to override `user_names` from the default.

## Terraform Output
After running `terraform apply`, you should see the output list of created user names:

```bash
user_names = [
  "oren",
  "melina",
  "lior",
]


Commands
terraform init
terraform plan
terraform apply


AWS Console:
Verify that the 3 IAM users were successfully created.

