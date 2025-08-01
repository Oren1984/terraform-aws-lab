# Terraform – count, for_each, and conditionals

This folder includes Terraform examples demonstrating dynamic resource creation using:

- `count` – to create multiple identical resources based on a number
- `for_each` – to iterate over maps/lists and create resources dynamically
- `conditional expressions` – to conditionally create or modify resources

---

## 📁 Subfolders Overview

| Folder | Description |
|--------|-------------|
| `01-iam-users-count` | Create 3 IAM users using `count` and output their names |
| `02-count-for-each-conditions` | Attach IAM policies to dynamically created roles using `for_each` on a map |

---

## 📚 Topics Covered

- `count.index` usage for unique resource names
- `for_each` with maps to attach specific attributes per key
- IAM policy attachment to roles
- Outputting values with `for` expressions

---

## 🧪 How to Use

For each folder:

```bash
cd [folder_name]
terraform init
terraform apply
Use terraform destroy to clean up resources after verification.


🔗 Notes
All examples use real AWS IAM resources.

Make sure to have proper permissions when running these examples.

Best run in a sandbox AWS account or under free-tier testing environment.
