# Task 7 – Create S3 Bucket

This Terraform configuration creates a basic S3 bucket with a name provided via variable.

## Files
- `main.tf`: Defines the S3 bucket resource.
- `variables.tf`: Declares the bucket_name variable.
- `terraform.tfvars`: Supplies the value for the bucket name.
- `README.md`: This documentation file.

## How to Use
```bash
terraform init
terraform plan
terraform apply

## Output

Once applied, Terraform will output the name of the created bucket:

bucket_name = "oren-basic-s3-bucket"

You can also verify the bucket in the AWS Console under S3.

