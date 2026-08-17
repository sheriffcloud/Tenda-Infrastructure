resource "aws_ecs_task_definition" "server" {
  family                   = "${var.project_name}-${var.environment}-server"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.server_cpu
  memory                   = var.server_memory
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn

  container_definitions = jsonencode([
    {
      name      = "server"
      image     = var.server_image_url
      essential = true

      portMappings = [
        {
          containerPort = var.server_port
          protocol      = "tcp"
        }
      ]

      # Bucket B: non-secret config, injected as plain env vars
      environment = [
        for k, v in var.server_environment : {
          name  = k
          value = v
        }
      ]

      # Bucket A: secrets pulled from Secrets Manager by ARN + JSON key
      secrets = [
        { name = "DATABASE_URL", valueFrom = "${var.connection_strings_arn}:DATABASE_URL::" },
        { name = "REDIS_URL", valueFrom = "${var.connection_strings_arn}:REDIS_URL::" },

        { name = "JWT_SECRET", valueFrom = "${var.app_secrets_arn}:JWT_SECRET::" },
        { name = "CLOUDINARY_API_KEY", valueFrom = "${var.app_secrets_arn}:CLOUDINARY_API_KEY::" },
        { name = "CLOUDINARY_API_SECRET", valueFrom = "${var.app_secrets_arn}:CLOUDINARY_API_SECRET::" },
        { name = "TERMII_API_KEY", valueFrom = "${var.app_secrets_arn}:TERMII_API_KEY::" },
        { name = "OPENROUTER_API_KEY", valueFrom = "${var.app_secrets_arn}:OPENROUTER_API_KEY::" },
        { name = "RESEND_API_KEY", valueFrom = "${var.app_secrets_arn}:RESEND_API_KEY::" },
        { name = "SENTRY_DSN", valueFrom = "${var.app_secrets_arn}:SENTRY_DSN::" },
        { name = "GOOGLE_OAUTH_CLIENT_SECRET", valueFrom = "${var.app_secrets_arn}:GOOGLE_OAUTH_CLIENT_SECRET::" },

        { name = "CHAIN_SOLANA_DEVNET_RPC_URL", valueFrom = "${var.chain_secrets_arn}:CHAIN_SOLANA_DEVNET_RPC_URL::" },
        { name = "CHAIN_SOLANA_DEVNET_WEBHOOK_SECRET", valueFrom = "${var.chain_secrets_arn}:CHAIN_SOLANA_DEVNET_WEBHOOK_SECRET::" },
        { name = "CHAIN_SOLANA_DEVNET_GAS_SEED_KEY", valueFrom = "${var.chain_secrets_arn}:CHAIN_SOLANA_DEVNET_GAS_SEED_KEY::" },
        { name = "CHAIN_EIP155_84532_RPC_URL", valueFrom = "${var.chain_secrets_arn}:CHAIN_EIP155_84532_RPC_URL::" },
        # { name = "CHAIN_EIP155_84532_RPC_URL_FALLBACK", valueFrom = "${var.chain_secrets_arn}:CHAIN_EIP155_84532_RPC_URL_FALLBACK::" },
        # { name = "CHAIN_EIP155_11142220_RPC_URL", valueFrom = "${var.chain_secrets_arn}:CHAIN_EIP155_11142220_RPC_URL::" },
        # { name = "CHAIN_EIP155_11142220_RPC_URL_FALLBACK", valueFrom = "${var.chain_secrets_arn}:CHAIN_EIP155_11142220_RPC_URL_FALLBACK::" }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.server.name
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = "server"
        }
      }
    }
  ])

  tags = {
    Name        = "${var.project_name}-${var.environment}-server"
    Environment = var.environment
    Project     = var.project_name
  }
}