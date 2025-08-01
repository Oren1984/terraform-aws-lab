# Task 28 – Attach IAM Policies to Roles (using `for_each`)

This exercise demonstrates how to use the `for_each` meta-argument in Terraform with a `map` to dynamically attach IAM policies to IAM roles.

---

## 🧱 Files

- `main.tf` – Creates IAM roles and attaches policies using `for_each`
- `variables.tf` – Defines a map of roles to policies
- `outputs.tf` – Displays the role-to-policy mapping
- `terraform.tfstate` – Auto-generated Terraform state

---

## 🧩 Variables

```hcl
variable "role_policies" {
  description = "Map of role names to policy ARNs"
  type        = map(string)
  default = {
    Admin  = "arn:aws:iam::aws:policy/AdministratorAccess"
    Reader = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  }
}


** How to Run
terraform init
terraform apply

** Terraform will:
Create IAM roles Admin and Reader

Attach the appropriate AWS managed policy to each role


🔁 Resources Used
IAM Roles:
resource "aws_iam_role" "roles" {
  for_each = var.role_policies
  name     = each.key
  ...
}

IAM Policy Attachments:
resource "aws_iam_policy_attachment" "policy" {
  for_each   = var.role_policies
  name       = "attach-${each.key}"
  roles      = [aws_iam_role.roles[each.key].name]
  policy_arn = each.value
}


📤 Output Example
attached_policies = {
  "Admin"  = "arn:aws:iam::aws:policy/AdministratorAccess"
  "Reader" = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}


🧼 Cleanup
To remove all resources:
terraform destroy
