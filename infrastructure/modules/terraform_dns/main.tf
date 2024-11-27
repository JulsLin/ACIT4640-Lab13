resource "aws_route53_zone" "main" {
  name = var.domain_name

  vpc {
    vpc_id = var.vpc_id
  }
}

resource "aws_route53_record" "records" {
  for_each = var.records
  zone_id  = aws_route53_zone.main.zone_id
  name     = each.value.name
  type     = "A"
  ttl      = 300
  records  = [each.value.ip]
}
