
# Task 28 – Attach IAM Policies to Roles

📌 **Goal:** Attach specific IAM policies to IAM roles using Terraform and `for_each`.

---

## 🧩 Files

- `main.tf`: Defines IAM policy attachments.
- `variables.tf`: Holds a map of roles and corresponding policies.
- `outputs.tf`: Displays which roles were attached.
- `backend.tf`: Points to the S3 backend for remote state storage.

---

## 🛠️ Implementation

### 🔸 Variable Definition (`variables.tf`)

```hcl
variable "role_policies" {
  default = {
    Admin  = "arn:aws:iam::aws:policy/AdministratorAccess"
    Reader = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  }
}


🔸 Resource Block (main.tf)
resource "aws_iam_policy_attachment" "policy" {
  for_each   = var.role_policies
  name       = "attach-${each.key}"
  roles      = [each.key]
  policy_arn = each.value
}

🔸 Output (outputs.tf)
output "attached_roles" {
  value = [for r in aws_iam_policy_attachment.policy : tolist(r.roles)[0]]
}


** Commands Execute:
terraform init
terraform plan
terraform apply

✅ Output
Outputs:

attached_roles = [
  "Admin",
  "Reader",
]


**  Success: IAM roles received their respective policies via automated attachment logic using for_each.
