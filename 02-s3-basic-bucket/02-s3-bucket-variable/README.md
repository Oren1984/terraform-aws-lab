# Task 13 – Use Variable for S3 Bucket Name

This task demonstrates how to use a variable to define the name of an S3 bucket in Terraform.

## Files

- `main.tf`: Defines the S3 bucket using the variable.
- `variables.tf`: Declares the `bucket_name` variable.
- `terraform.tfvars` (optional): Overrides the bucket name.
- `outputs.tf`: Displays the bucket name after creation.

## How it Works

The bucket name is taken from the variable `bucket_name`. You can override it by using `terraform.tfvars` or `-var` in CLI.

### Example

```bash
terraform init
terraform plan
terraform apply

Output:
bucket_name = "oren-variable-s3-bucket"
You can verify the bucket in the AWS S3 Console.
