output "certificate_arn" {
  value = aws_acm_certificate_validation.acm_certificate_validation.certificate_arn
}

output "api_domain" {
  value = "${var.subdomain_name}.${var.domain_name}"
}