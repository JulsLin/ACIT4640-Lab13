resource "aws_instance" "instances" {
  for_each        = var.instances
  ami             = each.value.ami
  instance_type   = each.value.instance_type
  subnet_id       = each.value.subnet_id
  key_name        = var.key_name
  security_groups = [var.security_group_id]
  tags = {
    Name = each.value.hostname
  }
  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname ${each.value.hostname}
              EOF
}
