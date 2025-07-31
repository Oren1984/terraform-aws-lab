output "instance_ips" {
  description = "Public IPs of both EC2 instances"
  value       = [for instance in aws_instance.instances : instance.public_ip]
}
