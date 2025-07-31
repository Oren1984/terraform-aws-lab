# 🪣 Terraform – S3 Basic Bucket Lab

This folder contains a series of Terraform exercises to create and manage AWS S3 buckets using various techniques: hardcoded names, variables, outputs, loops (`count`, `for_each`), and tags.

---

## 📁 Folder Structure

| Folder                  | Description |
|-------------------------|-------------|
| `01-s3-task-basic`      | Create a basic S3 bucket with a static name |
| `02-s3-bucket-variable` | Use variables to define the bucket name |
| `03-s3-bucket-output`   | Output the bucket name after creation |
| `04-s3-buckets-count`   | Create two buckets using `count` |
| `05-s3-buckets-foreach` | Create multiple buckets using a list and `for_each` |
| `06-s3-buckets-tags`    | Create buckets using a map and attach purpose tags |

---

## 🛠️ Usage

Inside each folder:

```bash
terraform init
terraform plan
terraform apply

To clean up resources:
terraform destroy


🧠 Learning Objectives:
* Understand basic S3 bucket creation with Terraform
* Use input variables for customization
* Work with loops (count, for_each) to create multiple resources
* Apply tags dynamically using maps
* Leverage outputs to retrieve information after deployment


📝 Notes
All bucket names include your name (oren) and the year (2025) to avoid conflicts.

Example output snippet from 06-s3-buckets-tags/outputs.tf:
output "bucket_tags" {
  value = {
    for name, bucket in aws_s3_bucket.buckets :
    name => bucket.tags
  }
}
