resource "aws_cloudwatch_log_group" "admin" {
  name              = "${var.project_name}-${var.environment}-admin"
  retention_in_days = 14

  tags = {
    Name = "${var.project_name}-${var.environment}-admin-logs"
    Environment = var.environment
    Project     = var.project_name
  }
}