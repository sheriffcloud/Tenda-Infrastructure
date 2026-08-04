resource "aws_elasticache_parameter_group" "main" {
  name   = "${var.project_name}-${var.environment}-elasticache-parameter-group"
  family = "redis7"

  parameter {
    name  = "maxmemory-policy"
    value = "noeviction"
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-elasticache-parameter-group"
    Environment = var.environment
    Project     = var.project_name
  }
}