data "aws_route53_zone" "route53_zone" {
  name         = "${var.domain_name}."
  private_zone = false
}

resource "aws_route53_record" "api_alias_record" {
  zone_id = data.aws_route53_zone.route53_zone.zone_id
  name    = "${var.subdomain_name}.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}