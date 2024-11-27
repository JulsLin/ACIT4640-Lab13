output "zone_id" {
  value = aws_route53_zone.main.zone_id
}

output "record_names" {
  value = { for k, v in aws_route53_record.records : k => v.fqdn }
}
