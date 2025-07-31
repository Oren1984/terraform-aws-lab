📄 Task 16 – Output IAM User ARN

Objective:
Create an IAM user using Terraform and output the user's ARN.

🛠 Files
main.tf – Contains the IAM user resource and the output block for the ARN.

variables.tf – (Optional) Contains user name variable if used.

terraform.tfstate – Generated automatically by Terraform.

📦 Terraform Code (main.tf)
hcl

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "user" {
  name = "arn-output-user"
}


output "user_arn" {
  value = aws_iam_user.user.arn
}


✅ How to Use
Run the following commands:
terraform init
terraform plan
terraform apply
Confirm the ARN is printed as output after the apply is complete.

🧪 Example Output
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

user_arn = "arn:aws:iam::123456789012:user/arn-output-user"

🧹 Cleanup (Optional)
terraform destroy
