output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.subnets.subnet_ids
}

output "instance_ips" {
  value = module.instances.instance_ips
}

output "dns_zone_id" {
  value = module.dns.zone_id
}
