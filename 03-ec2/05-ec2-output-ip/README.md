# Task 17 – Output EC2 Public IP

## 🎯 Goal
Display the public IP of an EC2 instance using Terraform's output block.


## 📁 Files
- `main.tf`: Defines a basic EC2 instance.
- `outputs.tf`: Prints the public IP after deployment.


## 📦 Resources Created
- EC2 instance (`aws_instance.example`)


## ✅ Output
After `terraform apply`, the public IP is displayed automatically.

```bash
Outputs:

public_ip = "XX.XX.XX.XX"


