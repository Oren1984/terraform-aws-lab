# Task 53 – GitHub Actions + Terraform (Apply with AWS Access Keys)

**Goal:** Run `terraform plan` and `terraform apply` with GitHub Actions using **AWS access keys stored in GitHub Secrets**.

This example provisions an S3 bucket via Terraform on each push to the **main** branch.

---

## Structure
```
16-github-actions-terraform/
├─ .github/
│  └─ workflows/
│     └─ terraform.yml
├─ main.tf
├─ variables.tf
├─ versions.tf
└─ .gitignore
```

---

## GitHub Secrets (required)
Create repository secrets:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

> For production, consider **OIDC + IAM role** instead of long‑lived keys. This task intentionally uses access keys for a simple demo.

---

## Workflow (`.github/workflows/terraform.yml`)
```yaml
name: Terraform CI

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  terraform:
    runs-on: ubuntu-latest
    permissions:
      contents: read
    env:
      AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
      AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
      AWS_DEFAULT_REGION: us-east-1
    steps:
      - name: Checkout repo
        uses: actions/checkout@v4

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: 1.6.0

      - name: Terraform Version
        run: terraform -version

      - name: Terraform Init
        run: terraform init

      - name: Terraform Validate
        run: terraform validate

      - name: Terraform Plan
        run: terraform plan -out=tfplan

      - name: Terraform Apply
        if: github.ref == 'refs/heads/main'
        run: terraform apply -auto-approve tfplan || terraform apply -auto-approve
```

---

## Terraform
Random suffix avoids S3 bucket name collisions (global namespace). Region is `us-east-1` by default.
```hcl
resource "random_id" "suffix" {
  byte_length = 2
}

resource "aws_s3_bucket" "example" {
  bucket = "gha-tf-demo-${random_id.suffix.hex}"
  acl    = "private"
}

output "bucket_name" {
  value       = aws_s3_bucket.example.id
  description = "Provisioned S3 bucket name"
}
```

---

## How it works
1. Push to **main** (or run manually with **Run workflow**).
2. Workflow checks out the code, sets up Terraform, runs **init → validate → plan → apply**.
3. On success, an S3 bucket is created.

---

## Cleanup
If you created real resources, destroy locally or add a separate **destroy** job:
```bash
terraform destroy -auto-approve
```
Or create a `workflow_dispatch` job that runs `terraform destroy` with the same secrets.

---

## Notes
- Prefer **OIDC with GitHub → AWS** for production (no long‑lived keys).
- Lock state remotely (S3 + DynamoDB) if collaborating.
- Add `terraform fmt -check` and Checkov steps for compliance if desired.
