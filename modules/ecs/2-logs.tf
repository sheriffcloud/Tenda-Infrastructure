resource "aws_cloudwatch_log_group" "server" {
  name              = "${var.project_name}-${var.environment}-server"
  retention_in_days = 14

  tags = {
    Name        = "${var.project_name}-${var.environment}-server"
    Environment = var.environment
    Project     = var.project_name
  }
}