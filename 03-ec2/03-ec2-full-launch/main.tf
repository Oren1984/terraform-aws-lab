provider "aws" {
  region = "us-east-1"
}

# Generate a new SSH key pair (private + public)
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Register the public key in AWS as a Key Pair
resource "aws_key_pair" "deployer_key" {
  key_name   = "student-key-2"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

# Get the default VPC (required for security group)
data "aws_vpc" "default" {
  default = true
}

# Create a security group allowing SSH (port 22) from anywhere
resource "aws_security_group" "ssh_sg" {
  name        = "ssh-sg"
  description = "Allow SSH access"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch an EC2 instance with Ubuntu AMI, key pair, and security group
resource "aws_instance" "ubuntu_instance" {
  ami                    = "ami-08c40ec9ead489470" # Ubuntu 22.04 in us-east-1
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deployer_key.key_name
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]

  tags = {
    Name = "TerraformUbuntuFull"
  }
}
