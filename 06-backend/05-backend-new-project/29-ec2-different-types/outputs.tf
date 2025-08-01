output "instance_names" {
  value = [for name in keys(var.instance_types) : name]
}
