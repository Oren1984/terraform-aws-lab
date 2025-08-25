# Task 43 – IAM Admin User via Remote Module (Option B)

This task extends Task 42 by creating an **IAM user with full admin access** and applying **tags**, using **remote modules from the Terraform Registry**.  
**Option B** assumes the `Administrators` group does **not** exist yet — we create it and attach AWS’s managed policy **`AdministratorAccess`**, then create the user and add it to the group.

> ⚠️ **Caution**: `AdministratorAccess` grants full account permissions. Use strictly for labs/demos and remove when done.

---

## Project Layout
```
task43-admin-iam/
├─ main.tf
├─ variables.tf
└─ outputs.tf
```

---

## Files

### `main.tf`
```hcl
terraform {
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

# 1) Create Administrators group with full admin policy
module "admins_group" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "~> 5.0"

  name = "Administrators"

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess"
  ]
}

# 2) Create user and attach to the Administrators group
module "admin_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 5.0"

  name   = var.user_name
  groups = [module.admins_group.iam_group_name]

  tags = {
    Project = "TerraformDemo"
    Env     = "dev"
  }

  # keep false unless you really need programmatic access
  create_iam_access_key = false
}
```

### `variables.tf`
```hcl
variable "user_name" {
  type        = string
  description = "The name of the IAM user"
}
```

### `outputs.tf`
```hcl
output "iam_user_name" {
  value       = module.admin_user.iam_user_name
  description = "The IAM user created"
}

output "iam_user_arn" {
  value       = module.admin_user.iam_user_arn
  description = "The IAM user ARN"
}
```

---

## How to Run

### Apply
```bash
terraform init
terraform plan -var="user_name=admin-demo"
terraform apply -auto-approve -var="user_name=admin-demo"
```

### Verify
Use either the AWS Console or CLI:
```bash
aws iam list-groups-for-user --user-name admin-demo
aws iam list-user-tags --user-name admin-demo
```
Expected:
- User **belongs to** `Administrators` group.
- Tags `Project=TerraformDemo`, `Env=dev` are present on the user.

### Destroy (cleanup)
```bash
terraform destroy -auto-approve -var="user_name=admin-demo"
```

---

## Notes & Best Practices
- 🔒 **Least privilege**: Admin access is powerful; prefer scoped policies in real projects.
- 🔑 **Access keys**: Keep `create_iam_access_key = false` unless required. If enabled, treat outputs as **sensitive** and never commit secrets.
- 📌 **Version pinning**: `version = "~> 5.0"` locks to compatible module updates for reproducibility.
- 🌍 **Region**: IAM is global, but keeping `region` is fine for provider consistency.
- 🧹 **Cleanup**: Always destroy lab resources to avoid leaving permanent admin users/groups.
