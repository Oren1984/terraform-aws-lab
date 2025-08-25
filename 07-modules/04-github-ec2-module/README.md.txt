# 04 – GitHub EC2 Module

This task demonstrates calling a Terraform module directly from GitHub.

## Usage

```hcl
module "my_ec2" {
  source         = "git::https://github.com/Oren1984/terraform-aws-lab.git//07-modules/04-github-ec2-module/modules/ec2"
  instance_name  = "MyFirstEC2"
  instance_type  = "t2.micro"
  ami_id         = "ami-xxxxxxxx"
}


Notes

Replace ami-xxxxxxxx with a valid AMI in your AWS region.

Double slash // indicates a subfolder inside the repository.


---

### 4. דחיפה לריפו
```bash
git add .
git commit -m "Task 41 - Added 04-github-ec2-module"
git push