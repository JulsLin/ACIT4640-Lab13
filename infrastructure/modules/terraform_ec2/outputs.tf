output "instance_ips" {
  value = { for k, v in aws_instance.instances : k => v.private_ip }
}

output "instance_ids" {
  value = { for k, v in aws_instance.instances : k => v.id }
}
