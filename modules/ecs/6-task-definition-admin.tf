resource "aws_ecs_task_definition" "admin" {
  family                   = "${var.project_name}-${var.environment}-admin"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn

  container_definitions = jsonencode([
    {
      name      = "admin"
      image     = "${var.admin_repository_url}:latest"
      essential = true

      portMappings = [
        {
          containerPort = var.admin_port
          protocol      = "tcp"
        }
      ]

      environment = [
        { name = "NODE_ENV", value = "production" },
        { name = "PORT",     value = tostring(var.admin_port) }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.admin.name
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = "admin"
        }
      }
    }
  ])

  tags = {
    Name = "${var.project_name}-${var.environment}-admin"
    Environment = var.environment
    Project     = var.project_name
  }
}