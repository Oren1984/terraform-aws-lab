# ✅ Requirements – Task 28: Attach IAM Policies to Roles

## Terraform Files Required:

- `main.tf`: Resources for IAM policy attachments.
- `variables.tf`: Role-policy mapping as a variable.
- `outputs.tf`: Output showing attached roles.
- `backend.tf`: S3 backend configuration for remote state.

## Terraform Commands:

```bash
terraform init
terraform plan
terraform apply

Ensure the backend S3 bucket exists before running init.
