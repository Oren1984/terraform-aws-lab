module "ubuntu_instance" {
  source         = "./modules/ec2"
  ami_id         = "ami-02fda57d7882770d8"
  instance_type  = "t3.micro"
  instance_name  = "MyUbuntu"
}
