# Task 36 – IAM User with Local Module

📌 **Goal:** Create an IAM user using a reusable local module.

---

## 📁 Project Structure

├── main.tf
├── outputs.tf
├── backend.tf
└── modules/
└── iam-user/
├── main.tf
└── variables.tf


## 📦 Module: `modules/iam-user`

### 🔹 `main.tf`

```hcl
resource "aws_iam_user" "this" {
  name = var.user_name
}

🔹 variables.tf
variable "user_name" {
  type = string
}


📄 Root Configuration
🔹 main.tf
module "user1" {
  source    = "./modules/iam-user"
  user_name = "melina-dev"
}

🔹 outputs.tf
output "created_user" {
  value = module.user1.user_name
}

🔹 backend.tf
terraform {
  backend "s3" {
    bucket = "oren-terraform-state-bucket"
    key    = "state/modules/task36.tfstate"
    region = "us-east-1"
  }
}


** Execution Steps
terraform init -reconfigure
terraform plan
terraform apply


✅ Output
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:
created_user = "melina-dev"


** Notes
This example demonstrates how to encapsulate IAM user creation logic inside a local module.

You can reuse this module for additional users by duplicating the module block with different parameters.


