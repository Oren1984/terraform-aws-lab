# Task 46 – Switch Between Workspaces

**Goal:** Demonstrate switching between Terraform workspaces (`default` and `dev`) and observe isolated resources.

This task assumes you already completed Task 45 and have a configuration that names the S3 bucket with `${terraform.workspace}` (e.g., `tf-demo-${terraform.workspace}`).
If not, here is a minimal example:

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "tf-demo-${terraform.workspace}"
  acl    = "private"
}

output "bucket_name" {
  value       = aws_s3_bucket.example.id
  description = "The created S3 bucket name"
}
```

---

## Steps

1) **Switch back to `default` workspace**
```bash
terraform workspace select default
```

2) **Apply configuration in `default`**
```bash
terraform apply -auto-approve
```
Expected bucket name:
```
tf-demo-default
```

3) **Switch to `dev` workspace**
```bash
terraform workspace select dev
```

4) **Apply configuration in `dev`**
```bash
terraform apply -auto-approve
```
Expected bucket name:
```
tf-demo-dev
```

5) **(Optional) List and verify workspaces**
```bash
terraform workspace list
```
You should see both `default` and `dev` in the list.

6) **(Optional) Cleanup**
If this was a live run and you don't want to keep the buckets, destroy in each workspace:
```bash
# destroy in dev
terraform workspace select dev
terraform destroy -auto-approve

# destroy in default
terraform workspace select default
terraform destroy -auto-approve
```

---

## What You Observed
- The **same code** produces **different resources** per workspace by using `${terraform.workspace}` in names.
- Each workspace maintains its **own state**, keeping environments isolated (`default` vs `dev`).

✔️ Done.
