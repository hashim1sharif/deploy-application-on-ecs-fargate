#create VPC
module "vpc" {
  source = "./modules/vpc"

  project_name            = var.project_name
  environment             = var.environment
  vpc_cidr                = var.vpc_cidr
  public_subnet_az1_cidr  = var.public_subnet_az1_cidr
  public_subnet_az2_cidr  = var.public_subnet_az2_cidr
  private_subnet_az1_cidr = var.private_subnet_az1_cidr
  private_subnet_az2_cidr = var.private_subnet_az2_cidr
}

#create ECR repository
module "ecr" {
  source = "./modules/ecr"

  project_name = var.project_name
  environment  = var.environment
}

# create ALB
module "alb" {
  source = "./modules/alb"

  project_name      = var.project_name
  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  container_port    = var.container_port
  certificate_arn   = module.acm.certificate_arn
}

# create ACM certificate
module "acm" {
  source = "./modules/acm"

  project_name   = var.project_name
  environment    = var.environment
  domain_name    = var.domain_name
  subdomain_name = var.subdomain_name
}

# create route53 record
module "route53" {
  source = "./modules/route53"

  domain_name    = var.domain_name
  subdomain_name = var.subdomain_name
  alb_dns_name   = module.alb.alb_dns_name
  alb_zone_id    = module.alb.alb_zone_id
}

# create ECS cluster and service
module "ecs" {
  source                = "./modules/ecs"
  project_name          = var.project_name
  environment           = var.environment
  aws_region            = var.aws_region
  private_subnet_ids    = module.vpc.private_subnet_ids
  app_security_group_id = module.alb.app_security_group_id
  target_group_arn      = module.alb.target_group_arn
  container_port        = var.container_port
  ecr_repository_url    = module.ecr.repository_url
  image_tag             = "latest"
  desired_count         = 1

  db_secret_arn = module.secrets_manager.secret_arn

}

# create RDS instance
module "rds" {
  source = "./modules/rds"

  project_name          = var.project_name
  environment           = var.environment
  private_subnet_ids    = module.vpc.private_subnet_ids
  vpc_id                = module.vpc.vpc_id
  app_security_group_id = module.alb.app_security_group_id
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
}

# create secret in Secrets Manager
module "secrets_manager" {
  source = "./modules/secrets_manager"

  project_name = var.project_name
  environment  = var.environment
  db_username  = var.db_username
  db_password  = var.db_password
  db_name      = module.rds.db_name
  db_host      = module.rds.db_endpoint
  db_port      = module.rds.db_port
}


