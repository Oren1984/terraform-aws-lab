output "instance_ips" {
  value = {
    for name, inst in aws_instance.custom :
    name => inst.public_ip
  }
}

output "instance_types" {
  value = {
    for name, inst in aws_instance.custom :
    name => inst.instance_type
  }
}
