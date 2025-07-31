provider "aws" {
  region = "us-east-1"
}

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
