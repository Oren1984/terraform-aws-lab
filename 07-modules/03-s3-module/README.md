# Task 38 – Use Module to Create S3 Buckets with Different Names# Task 38 – Use Module to Create S3 Buckets with Different Names

## 🎯 Goal
Use the same reusable Terraform module to create multiple S3 buckets with different names.

---

## 📂 Project Structure

03-s3-module/
├── main.tf
├── outputs.tf
├── requirements.txt
├── README.md
└── modules/
└── s3-bucket/
├── main.tf
└── variables.tf

---

## 📄 Module: `modules/s3-bucket/main.tf`

```hcl
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

📄 Module Variables: modules/s3-bucket/variables.tf
variable "bucket_name" {}

📄 Root Configuration: main.tf
module "logs_bucket" {
  source      = "./modules/s3-bucket"
  bucket_name = "oren-logs-bucket-20250801"
}

module "media_bucket" {
  source      = "./modules/s3-bucket"
  bucket_name = "oren-media-bucket-20250801"
}


📤 Outputs:
 outputs.txt:
output "logs_bucket_name" {
  value = module.logs_bucket.bucket_name
}

output "media_bucket_name" {
  value = module.media_bucket.bucket_name
}


📦 Requirements:
 requirements.txt:
Terraform >= 1.3.0 
AWS Provider >= 5.0 


✅ Result
After running:
terraform init
terraform apply

* You will see output similar to:
logs_bucket_name = "oren-logs-bucket-20250801"
media_bucket_name = "oren-media-bucket-20250801"
The two S3 buckets were created successfully with different names using the same module.


📝 Notes
S3 bucket names must be globally unique.

If a bucket already exists, Terraform will return an error (BucketAlreadyExists).

Use timestamp, project ID, or name suffixes to ensure uniqueness.


