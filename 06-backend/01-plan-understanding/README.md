# Task 31 – Understanding `terraform plan`

This exercise demonstrates the use of the `terraform plan` command to preview infrastructure changes before applying them.

---

## 📁 Files

- `main.tf` – Defines a basic S3 bucket
- `outputs.tf` – Prints the bucket name
- `result.txt` – Documents the output of `terraform plan` as a reference

---

## 🧪 Goal

Understand how `terraform plan` allows users to:

- Preview what Terraform will do
- Avoid unintentional changes
- Ensure transparency before running `terraform apply`

---

## 🚀 How to Run

### Step 1: Initialize Terraform

```bash
terraform init
Step 2: Preview changes without applying them
terraform plan

You will see output like:
Plan: 1 to add, 0 to change, 0 to destroy.

+ bucket_name = "oren-tf-plan-demo-bucket"
This means Terraform is ready to create the S3 bucket, but hasn't done so yet.


💡 Tip
To save the plan for later application:
terraform plan -out=tfplan

Then apply it with:
terraform apply tfplan


🧼 Cleanup
No cleanup is needed if you didn’t run terraform apply.

If you did apply later, destroy with:
terraform destroy



