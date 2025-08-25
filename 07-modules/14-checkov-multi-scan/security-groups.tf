# Wide-open Security Group (insecure on purpose)
resource "aws_security_group" "open_sg" {
  name        = "open-sg"
  description = "Open SG"
  vpc_id      = null # left null intentionally for demo; provider default VPC may be used

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # wide open
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # fully open egress
  }
}
