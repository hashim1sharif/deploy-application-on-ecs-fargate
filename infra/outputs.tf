output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

output "public_route_table_id" {
  value = module.vpc.public_route_table_id
}

output "private_route_table_az1_id" {
  value = module.vpc.private_route_table_az1_id
}

output "private_route_table_az2_id" {
  value = module.vpc.private_route_table_az2_id
}

output "nat_gateway_az1_id" {
  value = module.vpc.nat_gateway_az1_id
}

output "nat_gateway_az2_id" {
  value = module.vpc.nat_gateway_az2_id
}

output "ecr_repository_name" {
  value = module.ecr.repository_name
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "ecr_repository_arn" {
  value = module.ecr.repository_arn
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "alb_zone_id" {
  value = module.alb.alb_zone_id
}

output "alb_security_group_id" {
  value = module.alb.alb_security_group_id
}

output "app_security_group_id" {
  value = module.alb.app_security_group_id
}

output "target_group_arn" {
  value = module.alb.target_group_arn
}

output "certificate_arn" {
  value = module.acm.certificate_arn
}

output "api_domain" {
  value = module.route53.api_domain
}

output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}

output "ecs_service_name" {
  value = module.ecs.service_name
}

# output "ecr_repository_url" {
#   value = module.ecr.repository_url
# }