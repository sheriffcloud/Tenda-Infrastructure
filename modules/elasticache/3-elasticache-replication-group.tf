resource "aws_elasticache_replication_group" "main" {
  replication_group_id = "${var.project_name}-${var.environment}-redis-replication-group"
  description          = "Redis for BullMQ job queues"

  engine         = "redis"
  engine_version = "7.1"
  node_type      = var.node_type
  port           = 6379

  # HA: primary + 1 replica across AZs, with automatic failover
  num_cache_clusters         = var.redis_multi_az ? 2 : 1
  automatic_failover_enabled = var.redis_multi_az
  multi_az_enabled           = var.redis_multi_az

  subnet_group_name    = aws_elasticache_subnet_group.main.name
  parameter_group_name = aws_elasticache_parameter_group.main.name
  security_group_ids   = [var.redis_security_group_id]

  at_rest_encryption_enabled = true
  transit_encryption_enabled = false

  snapshot_retention_limit = 5
  snapshot_window          = "02:00-03:00"

  tags = {
    Name        = "${var.project_name}-${var.environment}-redis-replication-group"
    Environment = var.environment
    Project     = var.project_name
  }

}
