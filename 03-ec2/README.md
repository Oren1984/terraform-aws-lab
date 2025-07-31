📁 EC2 Exercises with Terraform – Full Walkthrough
This folder contains multiple hands-on Terraform tasks to manage EC2 instances in AWS. Each subfolder is a dedicated exercise focusing on a specific concept or technique.


📂 Folders Overview
Folder Name	Description
01-ec2-keypair-instance	Create a Key Pair and launch an EC2 instance using it
02-ec2-security-group	Create a Security Group allowing SSH access (port 22)
03-ec2-full-launch	Full EC2 launch including Key Pair, SG, and instance
04-ec2-instance-type-var	Use a variable to define EC2 instance type
05-ec2-output-ip	Output the EC2 instance's public IP
06-ec2-tags	Tag an EC2 instance with multiple metadata values
07-ec2-count	Launch multiple instances using count
08-ec2-count-tags	Launch multiple EC2s with custom tags using count
09-ec2-different-types	Create EC2s with different instance types using for_each


✅ Example Highlights
Key Pair: tls_private_key to generate SSH key locally, and aws_key_pair to register it with AWS.

Security Group: SSH (port 22) opened using aws_security_group.

Instance Launch:

AMI: ami-0b8e4d801c75b0f0d (Ubuntu 22.04, eu-north-1)

Instance types: t3.micro, t3.small, dynamically chosen using variables

Multiple Instances: Via count and for_each

Tagging: Used tags block with dynamic values

Outputs: Show IP addresses and instance metadata after apply


📦 Terraform Commands
Use these in each subfolder:
* terraform init
* terraform apply
* terraform destroy


You can also view resources with:
* terraform state list
* terraform output


Tips
* Ensure the selected AMI is valid for your region (eu-north-1).
* Use terraform destroy after each task to keep AWS Console clean.
* Avoid using t2.micro in eu-north-1 — switch to t3.micro and above.

