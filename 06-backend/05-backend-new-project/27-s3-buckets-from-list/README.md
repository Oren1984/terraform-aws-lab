# Task 27 – Create S3 Buckets from List

📌 **Goal:** Use `for_each` and a variable list to create multiple S3 buckets dynamically.

---

## ✅ Steps Performed:

### 1. Define the bucket names in `variables.tf`

```hcl
variable "bucket_names" {
  default = ["backup", "logs", "media"]
}
```

---

### 2. Create the S3 buckets using `for_each` in `main.tf`

```hcl
resource "aws_s3_bucket" "buckets" {
  for_each = toset(var.bucket_names)
  bucket   = "my-${each.value}-oren-20250801-bucket"
}
```

---

### 3. Output the created bucket names in `outputs.tf`

```hcl
output "bucket_names" {
  value = [for b in aws_s3_bucket.buckets : b.bucket]
}
```

---

### 4. Run the Terraform commands

```bash
terraform init
terraform plan
terraform apply
```

---

## 📁 Output

```txt
Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

Outputs:

bucket_names = [
  "my-backup-oren-20250801-bucket",
  "my-logs-oren-20250801-bucket",
  "my-media-oren-20250801-bucket",
]
```

✅ Buckets created successfully using `for_each` and a variable list.
