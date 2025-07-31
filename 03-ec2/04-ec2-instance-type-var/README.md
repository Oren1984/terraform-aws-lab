Task 14 – Use Variable to Set EC2 Instance Type

🎯 Goal:
Launch an EC2 instance using a variable to define the instance type (e.g., t2.micro).

📁 Files:
main.tf – Defines the EC2 instance and AWS provider.

variables.tf – Declares the instance_type variable with default.

outputs.tf – Displays the public IP of the instance after apply.

📦 Resources Created:
aws_instance.example – Ubuntu EC2 instance with type based on variable (var.instance_type).

AMI ID used: ami-08c40ec9ead489470 (Ubuntu 22.04 LTS, us-east-1)

** Usage:
 terraform init
 terraform apply

**To override instance type:
 terraform apply -var="instance_type=t3.micro"

**Example Output:
Outputs:


instance_public_ip = "<ip_public>"

** ℹNotes:
* This approach improves flexibility across environments.
* Default instance type is t2.micro (free-tier eligible).
* No SSH key or security group is configured in this specific task – only instance type is demonstrated.

