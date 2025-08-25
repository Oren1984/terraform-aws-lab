# Task 47 – Workspace-Specific Resource Behavior

**Goal:** Change resource properties depending on the active workspace (e.g., `dev` vs `prod`).  
We set S3 bucket ACL to **`private`** for `prod` and **`public-read`** for all other workspaces.

---

## Files


10-workspace-specific-behavior/
├─ main.tf
└─ outputs.tf


### `main.tf`
```hcl
provider "aws" {
  region = "us-east-1"
}

locals {
  # ACL depends on workspace:
  # - prod  -> private
  # - other -> public-read
  acl_setting = terraform.workspace == "prod" ? "private" : "public-read"
}

resource "aws_s3_bucket" "example" {
  bucket = "tf-demo-${terraform.workspace}"
  acl    = local.acl_setting
}

outputs.tf
output "bucket_name" {
  value       = aws_s3_bucket.example.id
  description = "The created S3 bucket name"
}

output "bucket_acl" {
  value       = aws_s3_bucket.example.acl
  description = "The ACL applied to the bucket"
}

Why no outputs?

Terraform only prints outputs after a successful apply or when you explicitly run:

terraform output
terraform output bucket_acl
terraform output bucket_name


If you only ran terraform plan, you won’t see outputs.

Steps

Create/select prod workspace and apply

terraform workspace new prod
terraform workspace select prod
terraform apply -auto-approve


Expected: bucket tf-demo-prod with ACL = private
Show outputs:

terraform output
# or:
terraform output bucket_acl
terraform output bucket_name


Switch to dev and apply

terraform workspace select dev
terraform apply -auto-approve


Expected: bucket tf-demo-dev with ACL = public-read
Show outputs:

terraform output


(Optional) List workspaces and verify

terraform workspace list


Cleanup per workspace (if this was a live run)

terraform workspace select dev
terraform destroy -auto-approve

terraform workspace select prod
terraform destroy -auto-approve

What you learned

You can drive environment-specific behavior using locals + terraform.workspace.

Each workspace has isolated state, so prod and dev resources are managed independently.