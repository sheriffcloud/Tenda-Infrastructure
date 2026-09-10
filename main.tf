module "networking" {
  source = "./modules/networking"

  aws_region   = var.aws_region
  environment  = var.environment
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  az_count     = var.az_count
  server_port  = var.server_port
  admin_port   = var.admin_port

}


module "database" {
  source = "./modules/database"

  aws_region           = var.aws_region
  environment          = var.environment
  project_name         = var.project_name
  db_allocated_storage = var.db_allocated_storage
  db_instance_class    = var.db_instance_class
  db_name              = var.db_name
  db_username          = var.db_username
  multi_az             = var.multi_az

  database_subnet_ids   = module.networking.database_subnet_ids
  rds_security_group_id = module.networking.rds_security_group_id

}


module "elasticache" {
  source = "./modules/elasticache"

  aws_region   = var.aws_region
  environment  = var.environment
  project_name = var.project_name

  database_subnet_ids     = module.networking.database_subnet_ids
  redis_security_group_id = module.networking.redis_security_group_id

  node_type      = var.node_type
  redis_multi_az = var.redis_multi_az
}


module "secrets" {
  source = "./modules/secrets"

  aws_region   = var.aws_region
  environment  = var.environment
  project_name = var.project_name

  db_username   = module.database.db_username
  db_password   = module.database.db_password
  db_address    = module.database.db_address
  db_port       = module.database.db_port
  db_name       = module.database.db_name
  redis_address = module.elasticache.redis_primary_endpoint
  redis_port    = module.elasticache.redis_port

  app_secrets   = var.app_secrets
  chain_secrets = var.chain_secrets
}


module "iam" {
  source = "./modules/iam"

  aws_region   = var.aws_region
  environment  = var.environment
  project_name = var.project_name

  secret_arns = module.secrets.secret_arns

  # depends_on = [ module.secrets ]
}

module "dns" {
  source = "./modules/dns"

  aws_region   = var.aws_region
  environment  = var.environment
  project_name = var.project_name
  domain_name  = var.domain_name

}

module "acm" {
  source = "./modules/acm"

  aws_region   = var.aws_region
  environment  = var.environment
  project_name = var.project_name
  domain_name  = var.domain_name
  zone_id      = module.dns.zone_id
}


module "alb" {
  source = "./modules/alb"

  aws_region   = var.aws_region
  environment  = var.environment
  project_name = var.project_name

  vpc_id                = module.networking.vpc_id
  public_subnet_ids     = module.networking.public_subnet_ids
  alb_security_group_id = module.networking.alb_security_group_id
  certificate_arn       = module.acm.certificate_arn
  zone_id               = module.dns.zone_id

  domain_name = var.domain_name
  server_port = var.server_port
  admin_port  = var.admin_port

}


module "ecr" {
  source = "./modules/ecr"

  aws_region   = var.aws_region
  environment  = var.environment
  project_name = var.project_name

}


module "ecs" {
  source = "./modules/ecs"

  aws_region   = var.aws_region
  environment  = var.environment
  project_name = var.project_name

  private_subnet_ids           = module.networking.private_subnet_ids
  ecs_server_security_group_id = module.networking.ecs_server_security_group_id

  execution_role_arn = module.iam.execution_role_arn
  task_role_arn      = module.iam.task_role_arn

  server_target_group_arn = module.alb.server_target_group_arn

  connection_strings_arn = module.secrets.connection_strings_arn
  app_secrets_arn        = module.secrets.app_secrets_arn
  chain_secrets_arn      = module.secrets.chain_secrets_arn

  server_cpu    = var.server_cpu
  server_memory = var.server_memory
  server_port   = var.server_port

  server_environment    = var.server_environment
  server_repository_url = module.ecr.server_repository_url

  admin_repository_url        = module.ecr.admin_repository_url
  admin_target_group_arn      = module.alb.admin_target_group_arn
  ecs_admin_security_group_id = module.networking.ecs_admin_security_group_id
  admin_port                  = var.admin_port

  depends_on = [module.alb]

}

module "static_site" {
  source = "./modules/static-site"

  providers = {
    aws           = aws
    aws.us_east_1 = aws.us_east_1
  }

  project_name = var.project_name
  environment  = var.environment
  domain_name  = var.domain_name
  zone_id      = module.dns.zone_id
  # certificate_arn removed — the module makes its own us-east-1 cert
}


module "cicd" {
  source = "./modules/cicd"

  environment  = var.environment
  project_name = var.project_name

  github_repo        = var.github_repo
  deploy_branch      = var.deploy_branch
  execution_role_arn = module.iam.execution_role_arn
  task_role_arn      = module.iam.task_role_arn
  infra_github_repo  = var.infra_github_repo

}