resource "aws_cloudwatch_log_group" "web" {
  name              = "${var.project_name}-${var.environment}-web"
  retention_in_days = 14

  tags = {
    Name        = "${var.project_name}-${var.environment}-web-logs"
    Environment = var.environment
    Project     = var.project_name
  }
}
