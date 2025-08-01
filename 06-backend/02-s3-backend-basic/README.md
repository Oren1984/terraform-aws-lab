# Task 32 – S3 Remote Backend

📌 **Goal:** Store the Terraform state file remotely in an S3 bucket.

---

## ✅ Steps Performed:

### 1. Create an S3 Bucket (via Terraform):

```hcl
resource "aws_s3_bucket" "backend_bucket" {
  bucket = "oren-terraform-state-bucket"
  acl    = "private"
}
```

### 2. Define backend in `backend.tf`:

```hcl
terraform {
  backend "s3" {
    bucket = "oren-terraform-state-bucket"
    key    = "state/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
```

### 3. Run `terraform init`:

```bash
terraform init
```

✔️ Terraform detected the new backend configuration  
✔️ State was successfully migrated to S3  
✔️ `.terraform/` directory was created

---

## 🗃️ Outputs

```hcl
output "s3_backend_bucket" {
  value = aws_s3_bucket.backend_bucket.bucket
}
```

---

## 📁 Result in `result.txt`

```text
Terraform Backend – Task 32: Store Terraform State in S3

✅ Step 1: S3 bucket created successfully via Terraform  
✅ Step 2: backend.tf created with S3 backend configuration  
✅ terraform init completed and remote state is active
```
