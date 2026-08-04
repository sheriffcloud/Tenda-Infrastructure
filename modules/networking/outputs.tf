output "vpc_id" {
  description = "ID of the Tenda VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block of the Tenda VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs of the public subnets (ALB lives here)"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets (ECS tasks live here)"
  value       = aws_subnet.private[*].id
}

output "database_subnet_ids" {
  description = "IDs of the database subnets (RDS + ElastiCache live here)"
  value       = aws_subnet.database[*].id
}

output "alb_security_group_id" {
  description = "ID of the ALB security group"
  value       = aws_security_group.alb.id
}

output "ecs_server_security_group_id" {
  description = "Security group for tenda-server tasks (also used by migrate task)"
  value       = aws_security_group.ecs_server.id
}

output "ecs_admin_security_group_id" {
  description = "Security group for tenda-admin tasks"
  value       = aws_security_group.ecs_admin.id
}

output "rds_security_group_id" {
  description = "Security group for RDS"
  value       = aws_security_group.rds.id
}

output "redis_security_group_id" {
  description = "Security group for Redis"
  value       = aws_security_group.redis.id
}

output "nat_gateway_public_ips" {
  description = "Public IP addresses of the NAT gateways"
  value       = aws_nat_gateway.main[*].public_ip
}