resource "aws_instance" "custom" {
  for_each      = var.instance_types
  ami           = "ami-0fe8bec493a81c7da" # Ubuntu 22.04 for eu-north-1
  instance_type = each.value

  tags = {
    Name = "${each.key}-oren-20250801"
  }
}
