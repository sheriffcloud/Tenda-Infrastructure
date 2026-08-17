# ── VPC Outputs ─────────────────────────────────────────────────────────────

output "vpc_id" {
  description = "ID of Tenda VPC"
  value       = module.networking.vpc_id
}

# output "vpc_cidr" {
#     description = "CIDR block of Tenda VPC"
#     value = module.networking.vpc_cidr  
# }

# output "public_subnet_ids" {
#     description = "IDs of the public subnets (ALB lives here)"
#     value = module.networking.public_subnet_ids  
# }

# output "private_subnet_ids" {
#     description = "IDs of the private subnets (ECS tasks live here)"
#     value = module.networking.private_subnet_ids  
# }

# output "database_subnet_ids" {
#     description = "IDs of the database subnets (RDS + ElastiCache live here)"
#     value = module.networking.database_subnet_ids  
# }

# output "alb_security_group_id" {
#     description = "ID of the ALB security group"
#     value = module.networking.alb_security_group_id  
# }

# output "ecs_server_security_group_id" {
#     description = "ID of the ecs_server security group"
#     value = module.networking.ecs_server_security_group_id  
# }

# output "ecs_admin_security_group_id" {
#     description = "ID of the ecs_admin security group"
#     value = module.networking.ecs_admin_security_group_id  
# }

# output "rds_security_group_id" {
#     description = "ID of the rds security group"
#     value = module.networking.rds_security_group_id  
# }

# output "redis_security_group_id" {
#     description = "ID of the redis security group"
#     value = module.networking.redis_security_group_id  
# }

output "nat_gateway_public_ips" {
  description = "Public IP addresses of the NAT gateways"
  value       = module.networking.nat_gateway_public_ips
}

# ── Database Outputs ─────────────────────────────────────────────────────────────

output "db_endpoint" {
  description = "RDS Database endpoint"
  value       = module.database.db_endpoint
}

output "db_address" {
  description = "RDS Database address"
  value       = module.database.db_address
}


# ── Elasticache Outputs ─────────────────────────────────────────────────────────────

output "redis_primary_endpoint" {
  description = "Primary endpoint for writes (host)"
  value       = module.elasticache.redis_primary_endpoint
}

output "redis_port" {
  description = "Port for the Redis cluster"
  value       = module.elasticache.redis_port
}



# ── DNS Outputs ─────────────────────────────────────────────────────────────

output "name_servers" {
  description = "The 4 AWS nameservers — set these at Namecheap"
  value       = module.dns.name_servers
}


# ── ACM Outputs ─────────────────────────────────────────────────────────────
output "certificate_arn" {
  description = "ARN of the validated certificate (for the ALB HTTPS listener)"
  value       = module.acm.certificate_arn
}



# ── ALB Outputs ─────────────────────────────────────────────────────────────
output "alb_dns_name" {
  description = "The ALB's AWS DNS name"
  value       = module.alb.alb_dns_name
}

output "api_url" {
  description = "Public API URL"
  value       = module.alb.api_url
}


# ── ALB Outputs ─────────────────────────────────────────────────────────────
output "server_repository_url" {
  description = "ECR URL for the server image (used to tag/push and by ECS)"
  value       = module.ecr.server_repository_url
}

output "admin_repository_url" {
  description = "ECR URL for the admin image"
  value       = module.ecr.admin_repository_url
}


# ── ECS Outputs ─────────────────────────────────────────────────────────────
output "task_definition_arn" {
  description = "ARN of the ECS task definition"
  value       = module.ecs.task_definition_arn
}