resource "aws_security_group" "ecs_server" {
  name_prefix = "${var.project_name}-${var.environment}-ecs-server-sg"
  description = "tenda-server tasks: accept traffic from ALB only"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Server port from ALB"
    from_port       = var.server_port
    to_port         = var.server_port
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
    Name        = "${var.project_name}-${var.environment}-ecs-server-sg"
    Environment = var.environment
  }
}