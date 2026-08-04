resource "aws_security_group" "ecs_admin" {
  name_prefix = "${var.project_name}-${var.environment}-ecs-admin-sg"
  description = "tenda-admin tasks: accept traffic from ALB only"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Admin port from ALB"
    from_port       = var.admin_port
    to_port         = var.admin_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    description = "All outbound (RPCs, Cloudinary, FCM via NAT)"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-ecs-admin-sg"
    Environment = var.environment
  }
}