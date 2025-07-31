provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "instances" {
  count         = 2
  ami           = "ami-08c40ec9ead489470"  # Ubuntu 22.04 AMI in us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "EC2-${count.index + 1}"
  }
}
