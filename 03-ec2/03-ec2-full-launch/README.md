# Task 10 - Launch an EC2 Ubuntu Instance with SSH Access

## 🎯 Goal
Launch an EC2 instance with:
- Ubuntu AMI (`ami-08c40ec9ead489470`)
- The key pair created in Task 8
- The security group created in Task 9

## 📁 Files
- `main.tf` – Defines the key pair, security group, and EC2 instance
- `outputs.tf` – Outputs the public IP of the EC2 instance

## 🧪 Verify
- Go to the AWS Console → EC2 → Instances → Check instance is running
- Confirm instance has the correct key pair and security group attached
- Confirm a public IP address is assigned
- Use the public IP to connect via SSH (assuming you have the matching private key)

## 💡 Notes
- Only port 22 is open (SSH)
- The EC2 instance type is `t2.micro` for free tier eligibility
- Key and security group are reused from previous tasks

