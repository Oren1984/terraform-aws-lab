# Task 42 – Using a Public Remote IAM Module (Read-Only Access)

This task demonstrates how to use a **remote module from the Terraform Registry** to create an IAM user with **ReadOnlyAccess** permissions.

---

## Prerequisites
- Terraform **1.5+**
- AWS account with permissions to create IAM Users and Groups
- Project folder structure:
  ```text
  task1-iam/
  ├─ main.tf
  ├─ variables.tf
  └─ outputs.tf
  ```

---

## Two Usage Options

### Option A – Group Already Exists (`ReadOnlyGroup`)
If you already have a group called **ReadOnlyGroup**, simply attach the new user to it.

**`main.tf`**
```hcl
terraform {
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

module "read_only_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 5.0"

  name   = var.user_name
  groups = ["ReadOnlyGroup"]  # Must already exist
}
```

**`variables.tf`**
```hcl
variable "user_name" {
  type        = string
  description = "The name of the IAM user"
}
```

**`outputs.tf`**
```hcl
output "iam_user_name" {
  value       = module.read_only_user.iam_user_name
  description = "The IAM user created"
}
```

Run:
```bash
terraform init
terraform plan -var="user_name=test-user"
terraform apply -auto-approve -var="user_name=test-user"
```

Destroy when finished:
```bash
terraform destroy -auto-approve -var="user_name=test-user"
```

---

### Option B – Create Group and Attach ReadOnlyAccess
If no group exists, first create a group with the AWS managed policy `ReadOnlyAccess`, then create the user and attach it.

**`main.tf`**
```hcl
terraform {
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

# 1) Group with ReadOnlyAccess policy
module "readonly_group" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "~> 5.0"

  name = "ReadOnlyGroup"

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess"
  ]
}

# 2) User attached to the group
module "read_only_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 5.0"

  name   = var.user_name
  groups = [module.readonly_group.iam_group_name]

  # Optional: set to true only if you need access keys
  create_iam_access_key = false
}
```

**`variables.tf`**
```hcl
variable "user_name" {
  type        = string
  description = "The name of the IAM user"
}
```

**`outputs.tf`**
```hcl
output "iam_user_name" {
  value       = module.read_only_user.iam_user_name
  description = "The IAM user created"
}

output "iam_user_arn" {
  value       = module.read_only_user.iam_user_arn
  description = "The IAM user ARN"
}
```

Run:
```bash
terraform init
terraform plan -var="user_name=test-user"
terraform apply -auto-approve -var="user_name=test-user"
```

Destroy when finished:
```bash
terraform destroy -auto-approve -var="user_name=test-user"
```

---

## Important Notes
- 🔒 **Access Keys**: Only create if necessary. If you enable `create_iam_access_key = true`, mark the outputs as `sensitive = true` and avoid committing secrets to Git.
- 🧩 **Version Pinning**: Using `version = "~> 5.0"` ensures reproducibility by locking to compatible minor/patch updates.
- 🌍 **Region**: IAM is a global service, but keeping `region` in the provider config is fine.
- 🧹 **Cleanup**: Always run `terraform destroy` after testing to avoid leaving unnecessary IAM users/groups.

---

## Troubleshooting
- **Error: group ReadOnlyGroup does not exist** → Use Option B or create the group manually.
- **AccessDenied** when creating resources → Ensure your AWS credentials have IAM privileges.
- **Module version not found** → Verify that the version (`~> 5.0`) exists in the Terraform Registry.

---

## References
- Terraform AWS IAM Module (Registry): `terraform-aws-modules/iam/aws`
- AWS Managed Policy: `ReadOnlyAccess`

✔️ Done!
