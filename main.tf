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

  aws_region            = var.aws_region
  environment           = var.environment
  project_name          = var.project_name
  db_allocated_storage  = var.db_allocated_storage
  db_instance_class     = var.db_instance_class
  db_name               = var.db_name
  db_username           = var.db_username
  database_subnet_ids   = module.networking.database_subnet_ids
  rds_security_group_id = module.networking.rds_security_group_id
  multi_az              = var.multi_az

}


module "elasticache" {
  source = "./modules/elasticache"

  aws_region              = var.aws_region
  environment             = var.environment
  project_name            = var.project_name
  database_subnet_ids     = module.networking.database_subnet_ids
  redis_security_group_id = module.networking.redis_security_group_id
  node_type               = var.node_type
  redis_multi_az          = var.redis_multi_az
}