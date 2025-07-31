## Task 22 – Launch 2 EC2 Instances Using `count`

### 🎯 Goal
Launch 2 EC2 instances using `count` and tag them accordingly.

### ✅ Configuration
- **AMI**: Ubuntu 22.04 (`ami-08c40ec9ead489470`)
- **Instance type**: `t2.micro`
- **Count**: 2 instances
- **Tags**: `Name = EC2-1`, `EC2-2`

### 📤 Outputs
- Public IP addresses of both instances

### 🛠 Commands
```bash
terraform init
terraform apply
