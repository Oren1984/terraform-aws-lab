# Task 51 – Scan a Larger Terraform Project with Multiple Problems (Checkov)

**Goal:** Practice scanning a larger Terraform project that contains multiple intentional security misconfigurations, and review Checkov findings.

---

## Files
```
14-checkov-multi-scan/
├─ main.tf
├─ s3.tf
├─ security-groups.tf
└─ README.md
```

### `main.tf`
- Defines the AWS provider.
- Adds an S3 bucket **without encryption/versioning** to trigger findings.

### `s3.tf`
- Public S3 bucket with `acl = "public-read"` (**insecure**).
- Missing encryption, versioning, and public access blocks.

### `security-groups.tf`
- Security Group with **wide-open ingress (0.0.0.0/0, tcp 0–65535)** and **open egress** (**insecure**).

---

## How to Run (with Checkov installed)

1) Navigate to the folder:
```bash
cd 14-checkov-multi-scan
```

2) Scan the entire project:
```bash
checkov -d .
```

**Expected outcome:** Checkov flags multiple issues, for example:
- Public S3 bucket (`acl = "public-read"`).
- S3 bucket missing **encryption at rest** and **versioning**.
- Security Group with **0.0.0.0/0** ingress (and open egress).
- Potential additional findings depending on your environment and provider defaults.

---

## Fix Ideas (High Level)

### S3 (public bucket)
- Avoid public ACLs; prefer **private** buckets and use presigned URLs or CloudFront with OAC.
- Block public access:
  ```hcl
  resource "aws_s3_bucket_public_access_block" "this" {
    bucket                  = aws_s3_bucket.public_bucket.id
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  }
  ```

### S3 (encryption & versioning)
```hcl
resource "aws_s3_bucket_versioning" "v" {
  bucket = aws_s3_bucket.no_encrypt_bucket.id
  versioning_configuration { status = "Enabled" }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "enc" {
  bucket = aws_s3_bucket.no_encrypt_bucket.id
  rule {
    apply_server_side_encryption_by_default { sse_algorithm = "AES256" }
  }
}
```

### Security Group
- Limit ingress to **specific ports** and **trusted CIDRs** (e.g., office IPs, VPC subnets).
- Avoid `0.0.0.0/0` unless absolutely necessary (and then only for narrow ports like 80/443).

---

## Clean Up (if you applied Terraform for a live test)
```bash
terraform destroy -auto-approve
```

> This project is intentionally insecure for demo/training purposes. Do not use these configurations in production.
