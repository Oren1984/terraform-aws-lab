# Task 9 - Create a Security Group that Allows SSH

## Goal
Create a security group that allows port 22 (SSH) from all IPs.

## Files
- `main.tf` - Contains the security group and VPC data resource.

## Verify
Check in the AWS Console under **EC2 → Security Groups** that a new group called `ssh-sg` was created with SSH access open to 0.0.0.0/0.
