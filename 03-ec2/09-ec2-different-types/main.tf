provider "aws" {
  region = "eu-north-1"
}

variable "instance_types" {
  default = {
    web1 = "t3.micro"
    web2 = "t3.small"
  }
}

resource "aws_instance" "custom" {
  for_each      = var.instance_types
  ami           = "ami-0b8e4d801c75b0f0d"  
  instance_type = each.value

  tags = {
    Name = each.key
  }
}
