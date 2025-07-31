output "instance_id" {
  value = aws_instance.ubuntu_instance.id
}

output "instance_public_ip" {
  value = aws_instance.ubuntu_instance.public_ip
}

output "private_key_pem" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}
