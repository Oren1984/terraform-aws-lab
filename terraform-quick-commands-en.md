# 🚀 Terraform – Quick Commands Guide (AWS)

This guide contains the most common Terraform commands for AWS usage, based on the tasks performed in the Terraform exercises.

---

## 1️⃣ Initialize the Project
```bash
terraform init
```
- Downloads required providers.
- Prepares the working directory.

---

## 2️⃣ Preview Changes Before Applying
```bash
terraform plan
```
- Shows what will be added/changed/deleted.
- Useful to verify the code before execution.

**Save a plan for later execution**:
```bash
terraform plan -out=tfplan
```

---

## 3️⃣ Apply Changes
```bash
terraform apply
```
- Executes the planned changes.

**Auto-approve without prompt**:
```bash
terraform apply -auto-approve
```

**Apply from a saved plan**:
```bash
terraform apply tfplan
```

---

## 4️⃣ Show Outputs
```bash
terraform output
```
- Displays values defined in `output.tf` (e.g., EC2 public IP, S3 bucket name).

---

## 5️⃣ Destroy Resources
```bash
terraform destroy
```
- Deletes all resources defined in the Terraform project.

**Auto-approve without prompt**:
```bash
terraform destroy -auto-approve
```

---

## 6️⃣ Additional Useful Commands
**Check Terraform version**:
```bash
terraform version
```

**Validate and format configuration files**:
```bash
terraform validate
terraform fmt
```

---

## 📦 Quick AWS Examples
**Create IAM User**:
```bash
terraform init
terraform apply -auto-approve
```
*(with `aws_iam_user` resource in main.tf)*

**Create S3 Bucket**:
```bash
terraform init
terraform apply -auto-approve
```
*(with `aws_s3_bucket` resource in main.tf)*

**Launch EC2 Instance**:
```bash
terraform init
terraform apply -auto-approve
```
*(with `aws_instance` resource, SSH key, and security group)*

---

## 💡 Tips
- **Variable files**: Keep sensitive values in `terraform.tfvars` or `*.auto.tfvars`.
- **Remote backend**: Store the state file in S3 for team collaboration.
- Always run `terraform plan` before `apply` to avoid surprises.
