# Task 21 – Create 3 IAM Users with `count`

This exercise demonstrates how to use the `count` meta-argument in Terraform to create multiple identical AWS resources — in this case, IAM users.

---

## 🧱 Files

- `main.tf` – Defines the `aws_iam_user` resource using `count = 3`
- `outputs.tf` – Prints the generated IAM user names
- `terraform.tfstate` – Auto-generated state file after apply

---

## 🧩 Resource Definition

```hcl
resource "aws_iam_user" "users" {
  count = 3
  name  = "student-${count.index}"
}


** How to Run
terraform init
terraform apply
On apply, the following users will be created:

student-0

student-1

student-2

You can verify them under IAM > Users in the AWS Console.


📤 Output

output "user_names" {
  value = [for u in aws_iam_user.users : u.name]
}

Result:t
user_names = [
  "student-0",
  "student-1",
  "student-2",
]


🧼 Cleanup
To remove the users:
terraform destroy


📝 Notes
This task is useful for bulk user creation or repeated resource provisioning using index-based names.
