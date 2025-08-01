# Task 37 – Use Module to Create an EC2 Instance

## 🎯 Goal
Create an EC2 instance using a reusable module in Terraform.

---

## 📁 Structure
.
├── main.tf
├── outputs.tf
├── requirements.txt
└── modules/
└── ec2/
├── main.tf
└── variables.tf

---

## ⚙️ Module: `modules/ec2/main.tf`

```hcl
resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}


📥 Module Variables: modules/ec2/variables.tf
variable "ami_id" {}
variable "instance_type" {}
variable "instance_name" {}


📌 Root Module: main.tf
module "ubuntu_instance" {
  source         = "./modules/ec2"
  ami_id         = "ami-02fda57d7882770d8"
  instance_type  = "t3.micro"
  instance_name  = "MyUbuntu"
}


📤 Outputs: outputs.tf
output "instance_name" {
  value = module.ubuntu_instance.instance_name
}


📦 Requirements: requirements.txt
Terraform >= 1.3.0
AWS Provider >= 5.0


✅ Result
EC2 instance created successfully

Instance name: MyUbuntu

Verified via output:
Outputs:
instance_name = "MyUbuntu"


🗂️ Notes
Region: eu-north-1 (Stockholm)

Used AMI: ami-02fda57d7882770d8

Instance type: t3.micro (since t2.micro is not supported in eu-north-1)

