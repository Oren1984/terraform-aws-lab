# Task 45 – Create a New Workspace (dev)

Goal: demonstrate how to **create and switch** Terraform workspaces and how using `terraform.workspace` in resource names isolates resources per workspace.

> Note: S3 bucket names are **globally unique**. If you actually run this, you may want to use the optional random suffix variant below to avoid name collisions.

---

## Files
```
08-new-workspace/
├─ main.tf
└─ outputs.tf
```

### `main.tf`
The minimal version that uses the current workspace name in the bucket:
```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "tf-demo-${terraform.workspace}"
  acl    = "private"
}
```

**Optional – safer bucket naming** (avoid collisions using a short random hex suffix):
```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "random_id" "suffix" {
  byte_length = 2
}

resource "aws_s3_bucket" "example" {
  bucket = "tf-demo-${terraform.workspace}-${random_id.suffix.hex}"
  acl    = "private"
}
```

### `outputs.tf`
```hcl
output "bucket_name" {
  value       = aws_s3_bucket.example.id
  description = "The created S3 bucket name"
}
```

---

## Steps

1) **Check current workspace**
```bash
terraform workspace show
```

2) **Create a new workspace `dev`**
```bash
terraform workspace new dev
```

3) **Switch to `dev` (if needed)**
```bash
terraform workspace select dev
```

4) **Apply configuration**
```bash
terraform init
terraform apply -auto-approve
```

5) **(Optional) List all workspaces**
```bash
terraform workspace list
```

6) **(Optional) Switch back and compare**
```bash
terraform workspace select default
terraform apply -auto-approve
```

7) **Cleanup when done**
```bash
terraform destroy -auto-approve
```

---

## What you should observe
- The bucket name includes the current workspace (e.g., `tf-demo-dev` or `tf-demo-default`).
- Each workspace maintains a **separate state**, so Terraform tracks and manages resources independently per workspace.
