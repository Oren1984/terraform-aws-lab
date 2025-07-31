# Terraform IAM Tasks – Collection

This folder contains a complete set of hands-on Terraform exercises for managing **AWS IAM resources**.  
Each subfolder represents a specific task with its own `main.tf`, variables, and configuration.

## 📁 Folder Structure

| Folder | Description |
|--------|-------------|
| `01`   | Create a basic IAM user |
| `02`   | Duplicate IAM user creation |
| `03`   | Create a custom IAM policy |
| `04`   | Create an S3 ReadOnly policy |
| `05`   | Create an Admin role |
| `06`   | Create a role with S3 ReadOnly policy |
| `07`   | IAM user with AWS Console login |
| `08`   | IAM user using variables |
| `09`   | IAM user using `.tfvars` file |
| `10`   | Output IAM user ARN |
| `11`   | Create multiple IAM users with `count` |
| `12`   | Conditionally create an IAM group |
| `13`   | Create IAM users from `map` variable |

## 🛠 How to Use

Each folder contains its own Terraform configuration. To run a specific task:

```bash
cd 00-iam-tasks/0X-iam-task-*
terraform init
terraform plan
terraform apply
You can also override variables using terraform.tfvars or the -var flag.

✅ This collection is ideal for beginners and intermediate Terraform users aiming to master IAM automation in AWS.
