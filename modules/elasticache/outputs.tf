output "redis_primary_endpoint" {
  description = "Primary endpoint for writes (host)"
  value       = aws_elasticache_replication_group.main.primary_endpoint_address
}

output "redis_port" {
  description = "Port for the Redis cluster"
  value       = aws_elasticache_replication_group.main.port
}