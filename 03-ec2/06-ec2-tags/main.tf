provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-08c40ec9ead489470" # Ubuntu 22.04
  instance_type = "t2.micro"

  tags = {
    Name    = "TaggedInstance"
    Project = "TerraformLab"
    Owner   = "oren"
  }
}
