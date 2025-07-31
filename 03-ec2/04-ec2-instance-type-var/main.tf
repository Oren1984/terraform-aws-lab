provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = var.instance_type

  tags = {
    Name = "InstanceWithVar"
  }
}
