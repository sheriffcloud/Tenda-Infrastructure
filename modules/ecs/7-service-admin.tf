resource "aws_ecs_service" "admin" {
  name            = "${var.project_name}-${var.environment}-admin"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.admin.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = [var.ecs_admin_security_group_id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.admin_target_group_arn
    container_name   = "admin"
    container_port   = var.admin_port
  }

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  health_check_grace_period_seconds  = 60

  tags = {
    Name = "${var.project_name}-${var.environment}-admin"
    Environment = var.environment
    Project     = var.project_name
  }
}