# 🧪 05 – Backend for New Project (Advanced Tasks)

This folder contains advanced Terraform tasks that use a remote S3 backend.  
Each task demonstrates a different use case for managing AWS resources with `for_each`, `maps`, and dynamic values.

---

## 📦 Included Tasks

### 🔹 [27 – S3 Buckets from List](./27-s3-buckets-from-list)

- **Goal:** Create multiple S3 buckets from a list.
- **Technique:** Uses `for_each` with `toset(var.bucket_names)` to generate buckets dynamically.
- **Outputs:** List of created bucket names.

---

### 🔹 [28 – IAM Policy Attachments](./28-iam-attach-policies)

- **Goal:** Attach IAM policies to predefined IAM roles.
- **Technique:** Uses `map` and `for_each` to iterate over role–policy pairs.
- **Outputs:** List of attached role names.

---

### 🔹 [29 – EC2 Instances with Different Types](./29-ec2-different-types)

- **Goal:** Launch EC2 instances with different instance types.
- **Technique:** Uses `for_each` on a `map` of instance names and types.
- **Outputs:** List of instance names (`app1`, `app2`).

---

## 🔧 Common Configuration

Each task uses:

- A dedicated subfolder
- `main.tf`, `variables.tf`, `outputs.tf`, and `backend.tf`
- Remote backend: `oren-terraform-state-bucket`

---

## ✅ Execution (in each task folder)

```bash
terraform init
terraform plan
terraform apply
