# Task 33 – Change and Plan

📌 **Goal:** Understand how Terraform detects changes after modifying infrastructure.

---

## ✅ Changes Made

- Modified the name of the S3 bucket.
- Removed the deprecated `acl = "private"` from `aws_s3_bucket`.
- Added a new resource `aws_s3_bucket_acl` to apply the ACL explicitly.

---

## 🔍 terraform plan Output

```bash
Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + bucket_name = "oren-tf-plan-demo-bucket-changed"


📁 Output File (result.txt)
Terraform Plan – Task 33: Change Resource and Detect Plan


✅ Bucket name changed successfully to: oren-tf-plan-demo-bucket-changed
✅ Deprecated ACL field removed from aws_s3_bucket
✅ Added aws_s3_bucket_acl resource to set ACL explicitly
