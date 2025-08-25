module "my_ec2" {
  source         = "git::https://github.com/Oren1984/terraform-aws-lab.git//07-modules/04-github-ec2-module/modules/ec2"
  instance_name  = "MyFirstEC2"
  instance_type  = "t2.micro"
  ami_id         = "ami-xxxxxxxx"
}
