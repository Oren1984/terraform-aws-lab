# terraform-aws-lab

This repository contains practical Terraform exercises for provisioning and managing AWS infrastructure.  
All resources were created, tested, and destroyed using Terraform on a real AWS environment.

---

## 📁 Directory Structure

| Folder                     | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| `01-iam-tasks`            | IAM users, roles, policies, variable usage, conditional creation with `count` and `map` |
| `02-s3-basic-bucket`      | S3 buckets: creation, versioning, ACLs, static website hosting              |
| `03-ec2`                  | EC2 instances: key pair generation, security groups, instance types, tagging, public IP output |
| `04-variables`            | Input variables, default values, `terraform.tfvars` implementation          |
| `05-count-for-each-conditions` | Use of `count`, `for_each`, `depends_on`, conditional blocks          |
| `06-backend`              | Remote state management with AWS S3 backend configuration                   |
| `07-modules`              | Custom reusable Terraform modules tested and deployed                       |

---

## 🔧 Tools Used

- **Terraform CLI**
- **AWS Console** (for validation)
- **Ubuntu (VirtualBox VM)**
- **VS Code** (editing and Git integration)
- **Git & GitHub** (version control and remote storage)

---

## ✅ Execution Notes

- All Terraform configurations were executed using `terraform init`, `apply`, `destroy`.
- All AWS resources were verified in the AWS Console and then destroyed to avoid charges.
- Resource naming and tagging were used for identification and cleanup.
- Work was structured in isolated folders for clarity and modular learning.

