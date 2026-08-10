resource "aws_lb" "main" {
  name               = "${var.project_name}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnet_ids

  idle_timeout = 300

  # (flip to true for real production so nobody accidentally deletes the load balancer)
  enable_deletion_protection = false



  tags = {
    Name        = "${var.project_name}-${var.environment}-alb"
    Environment = "production"
    Project     = var.project_name
  }
}