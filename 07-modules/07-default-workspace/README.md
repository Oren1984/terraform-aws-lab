# Task 44 – Observe the Default Workspace

This task demonstrates that Terraform always operates within a **workspace**, and by default, the active workspace is called **`default`**.

---

## Project Structure
```
04-default-workspace/
├─ main.tf
└─ outputs.tf
```

---

## Files

### `main.tf`
```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "tf-demo-default"
  acl    = "private"
}
```

### `outputs.tf`
```hcl
output "bucket_name" {
  value = aws_s3_bucket.example.id
}
```

---

## Instructions

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Check the current workspace**
   ```bash
   terraform workspace show
   ```
   Expected output:
   ```
   default
   ```

3. **Apply configuration**
   ```bash
   terraform apply -auto-approve
   ```

   This creates the S3 bucket under the **default** workspace.

4. **(Optional) List all workspaces**
   ```bash
   terraform workspace list
   ```
   Example output:
   ```
   * default
   ```

---

## What You Learned
- Terraform always uses a workspace context.
- The default workspace is named **`default`**.
- Each workspace has its own **state file**.
- New workspaces can be created, for example:
  ```bash
  terraform workspace new dev
  terraform workspace new prod
  ```

✔️ This exercise prepares you for managing multiple environments with workspaces in later tasks.
