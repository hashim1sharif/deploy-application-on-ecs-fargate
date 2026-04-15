output "alb_arn" {
  value = aws_lb.alb.arn
}

output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "alb_zone_id" {
  value = aws_lb.alb.zone_id
}

output "alb_security_group_id" {
  value = aws_security_group.alb_security_group.id
}

output "app_security_group_id" {
  value = aws_security_group.app_security_group.id
}

output "target_group_arn" {
  value = aws_lb_target_group.target_group.arn
}

output "http_listener_arn" {
  value = aws_lb_listener.http_listener.arn
}

output "https_listener_arn" {
  value = aws_lb_listener.https_listener.arn
}