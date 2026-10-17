resource "aws_security_group" "ecs_web" {
  name_prefix = "${var.project_name}-${var.environment}-ecs-web-"
  description = "web tasks: accept traffic from ALB only"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Web port from ALB"
    from_port       = var.web_port
    to_port         = var.web_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-ecs-web-sg"
    Environment = var.environment
    Project     = var.project_name
  }
}