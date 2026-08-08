resource "aws_secretsmanager_secret" "connection_strings" {
  name        = "${var.project_name}-${var.environment}-connection-strings"
  description = "DATABASE_URL and REDIS_URL, assembled from data-tier outputs"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "connection_strings" {
  secret_id = aws_secretsmanager_secret.connection_strings.id
  secret_string = jsonencode({
    DATABASE_URL = "postgresql://${var.db_username}:${var.db_password}@${var.db_address}:${var.db_port}/${var.db_name}"
    REDIS_URL    = "redis://${var.redis_address}:${var.redis_port}"
  })
}