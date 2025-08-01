# Terraform AWS Modules – Summary

This directory contains three Terraform tasks demonstrating how to use reusable modules in Terraform to manage AWS resources efficiently.

---

## 📁 01-iam-user-module

**Goal**: Create an IAM user using a reusable module.

**Structure**:
01-iam-user-module/
├── backend.tf
├── main.tf
├── modules/
│ └── user/
│ ├── main.tf
│ └── variables.tf
├── outputs.tf
├── requirements.txt
└── README.md

**Details**:
- The module `user` accepts a `user_name` variable and creates an IAM user with that name.
- Reusable for creating multiple users with different names.

---

## 📁 02-ec2-module

**Goal**: Launch an EC2 instance using a module.

**Structure**:
02-ec2-module/
├── backend.tf
├── main.tf
├── modules/
│ └── ec2/
│ ├── main.tf
│ └── variables.tf
├── outputs.tf
├── requirements.txt
└── README.md

**Details**:
- Takes AMI ID, instance type, and instance name as inputs.
- Deploys a virtual machine (e.g., Ubuntu) with specified parameters.
- The instance is tagged for easy identification.

---

## 📁 03-s3-module

**Goal**: Create two different S3 buckets using the same module.

**Structure**:
03-s3-module/
├── backend.tf
├── main.tf
├── modules/
│ └── s3-bucket/
│ ├── main.tf
│ └── variables.tf
├── outputs.tf
├── requirements.txt
└── README.md

**Details**:
- Module takes `bucket_name` as input.
- Used twice to create `logs` and `media` buckets with different names.
- Outputs display created bucket names.

---

## 🛠️ Requirements

```text
Terraform >= 1.3.0 
AWS Provider >= 5.0


📌 Notes
All modules are fully reusable.

State management is configured via remote S3 backend.

The structure helps maintain clean, scalable infrastructure code.


✅ Completed Successfully
📅 Last Updated: August 1, 2025
👤 Author: Oren
