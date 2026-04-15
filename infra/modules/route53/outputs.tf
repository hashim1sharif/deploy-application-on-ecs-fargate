output "api_domain" {
  value = aws_route53_record.api_alias_record.fqdn
}

output "hosted_zone_id" {
  value = data.aws_route53_zone.route53_zone.zone_id
}