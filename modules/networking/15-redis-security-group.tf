resource "aws_security_group" "redis" {
  name_prefix = "${var.project_name}-${var.environment}-redis-sg"
  description = "RDS: accept Postgres from server tasks only"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "PostgreSQL from tenda-server tasks"
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_server.id]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-redis-sg"
    Environment = var.environment
  }
}