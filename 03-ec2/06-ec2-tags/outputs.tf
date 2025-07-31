output "instance_tags" {
  description = "The tags associated with the EC2 instance"
  value       = aws_instance.example.tags
}
