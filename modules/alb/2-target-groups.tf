resource "aws_lb_target_group" "server" {
  name        = "${var.project_name}-${var.environment}-server-tg"
  port        = var.server_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path                = "/v1/health"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }

  deregistration_delay = 30

  tags = {
    Name        = "${var.project_name}-${var.environment}-server-tg"
    Environment = "production"
    Project     = var.project_name
  }
}

resource "aws_lb_target_group" "admin" {
  name        = "${var.project_name}-${var.environment}-admin-tg"
  port        = var.admin_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
    matcher             = "200-399"
  }

  deregistration_delay = 30

  tags = {
    Name        = "${var.project_name}-${var.environment}-admin-tg"
    Environment = "production"
    Project     = var.project_name
  }
}