# Output the public IP of the created EC2 instance
output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.ubuntu_instance.public_ip
}
