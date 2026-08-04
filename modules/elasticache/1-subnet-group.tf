resource "aws_elasticache_subnet_group" "main" {
  name       = "${var.project_name}-${var.environment}-elasticache-subnet-group"
  subnet_ids = var.database_subnet_ids

  tags = {
    Name        = "${var.project_name}-${var.environment}-elasticache-subnet-group"
    Environment = var.environment
    Project     = var.project_name
  }
}