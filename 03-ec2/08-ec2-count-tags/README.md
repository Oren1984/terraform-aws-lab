🧪 Task 25 – Create 4 EC2 Instances With Count and Tags

🎯 Goal
Launch 4 EC2 instances using count, each with custom tags including Name, Owner, and Project.


📁 Files
* main.tf – Contains the Terraform configuration for creating the EC2 instances with count and tags.
* outputs.tf – Displays the list of public IPs and tags.
* README.md – This documentation file.


📄 main.tf (summary)
resource "aws_instance" "instances" {
  count         = 4
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"

  tags = {
    Name    = "EC2-${count.index + 1}"
    Owner   = "oren"
    Project = "TerraformLab"
  }
}

📤 outputs.tf (summary)
output "instance_ips" {
  value = [for instance in aws_instance.instances : instance.public_ip]
}

output "instance_tags" {
  value = [for instance in aws_instance.instances : instance.tags]
}

Terraform Execution:
* terraform init
* terraform apply

✅ Resources created:
4 EC2 instances

Each instance tagged with:

Name: EC2-1, EC2-2, etc.

Owner: oren

Project: TerraformLab

🖥 Example Output
instance_ips = [
  "52.201.234.134",
  "44.211.173.232",
  "3.85.86.106",
  "54.166.116.142",
]

instance_tags = [
  {
    "Name" = "EC2-1",
    "Owner" = "oren",
    "Project" = "TerraformLab"
  },
  ...
]
