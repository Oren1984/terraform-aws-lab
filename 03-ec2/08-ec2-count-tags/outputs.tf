output "instance_ips" {
  description = "Public IPs of the 4 EC2 instances"
  value       = [for instance in aws_instance.instances : instance.public_ip]
}

output "instance_tags" {
  description = "Tags for each EC2 instance"
  value       = [for instance in aws_instance.instances : instance.tags]
}
