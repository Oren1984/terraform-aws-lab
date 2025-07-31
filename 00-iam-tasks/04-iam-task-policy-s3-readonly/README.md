# 📘 Task 4 – Create IAM Policy with Read-Only Access to S3

This Terraform configuration creates a custom IAM policy that grants **read-only** access to all S3 buckets in the account.

---

## 📁 Files
- `main.tf` – Terraform configuration file for the S3 Read-Only IAM Policy

---

## ⚙️ AWS Resources Created

- `aws_iam_policy.s3_readonly`
  - Name: `S3ReadOnlyPolicy`
  - Description: Grants `s3:Get*` and `s3:List*` permissions on all S3 resources

---

## 🛠️ Commands Used

```bash

terraform init
terraform plan
terraform apply

✅ Result
IAM Policy S3ReadOnlyPolicy created successfully.

Verified via:
AWS Console → IAM → Policies → S3ReadOnlyPolicy

🧠 Notes
This policy is ideal for attaching to IAM roles or users who need read-only access to S3 (e.g., for auditing or reporting).

Follows best practice of least privilege.
