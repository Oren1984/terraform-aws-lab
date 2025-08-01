# 🔁 Terraform Remote Backend – Step 06

This directory demonstrates different strategies for managing **Terraform remote state using S3**.

---

## 📂 Folders & Tasks

| Folder Name              | Task  | Description                                                                 |
|--------------------------|-------|-----------------------------------------------------------------------------|
| 01-plan-understanding     | 31    | Understand `terraform plan` and how it shows changes.                       |
| 02-s3-backend-basic       | 32    | Configure basic S3 backend with bucket, key, and region.                    |
| 03-change-and-plan        | 33    | Test detecting changes in backend state.                                    |
| 04-save-plan              | 34    | Save the `terraform plan` output to a file and apply from it.              |
| 05-backend-new-project    | 35    | Set up remote S3 backend for a new project and reuse it across subfolders. |

---

## 💡 Highlights

- Each folder is self-contained and includes:
  - `main.tf`
  - `backend.tf` (or `backend.auto.tfvars`)
  - `variables.tf` (when needed)
  - `outputs.tf`
  - `README.md`
  - `result.txt`

- Terraform state is stored remotely in S3 using:
  ```hcl
  terraform {
    backend "s3" {
      bucket = "oren-terraform-state-bucket"
      key    = "state/<resource>.tfstate"
      region = "us-east-1"
    }
  }



✅ Usage
To run any subfolder:
terraform init
terraform plan
terraform apply
Use terraform destroy if needed to clean up after each task.


📁 Auto-loaded Variable File
If present:
# backend.auto.tfvars
bucket = "oren-terraform-state-bucket"
key    = "state/<subpath>.tfstate"
region = "us-east-1"
This will automatically configure the backend during terraform init.

✍️ Author
Maintained by Oren Salami
All resources are created in eu-north-1 (Stockholm) for consistency.

