# Task 29 – Create EC2 Instances with Different Types

📌 **Goal:** Launch multiple EC2 instances of different types using a map and `for_each`.

---

##  Configuration

### 🔸 `variables.tf`

```hcl
variable "instance_types" {
  default = {
    web1 = "t2.micro"
    web2 = "t2.small"
  }
}

🔸 main.tf
resource "aws_instance" "custom" {
  for_each      = var.instance_types
  ami           = "ami-08c40ec9ead489470"
  instance_type = each.value

  tags = {
    Name = each.key
  }
}

🔸 outputs.tf
output "instance_names" {
  value = [for name in keys(var.instance_types) : name]
}

🔸 backend.tf
terraform {
  backend "s3" {
    bucket = "oren-terraform-state-bucket"
    key    = "state/ec2/task29.tfstate"
    region = "us-east-1"
  }
}


** Execution Steps
terraform init
terraform plan
terraform apply


✅ Result
Outputs:

instance_names = [
  "web1",
  "web2",
]

✅ EC2 instances created successfully with the correct instance types and tags.
