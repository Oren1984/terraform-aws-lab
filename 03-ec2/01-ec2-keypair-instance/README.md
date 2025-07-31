# Task 8 – Create EC2 Key Pair and Instance

## Goal
Create a new EC2 key pair using Terraform and launch a `t2.micro` EC2 instance that uses that key.

## Files
- `main.tf`: Defines the EC2 instance, key pair, and TLS key.
- `outputs.tf`: Outputs the instance ID, public IP, and private key.
- `README.md`: This documentation.

## Notes
- AMI used: Ubuntu 22.04 (`ami-08c40ec9ead489470` – `us-east-1`)
- The key pair will be named `student-key` and stored inside AWS EC2 Key Pairs section.
- The private key is generated locally with Terraform via the `tls_private_key` resource.

## How to Use
```bash
terraform init
terraform apply

** Use the output private_key_pem to SSH into the instance.

** SSH Example:
ssh -i private_key.pem ubuntu@<public-ip>
