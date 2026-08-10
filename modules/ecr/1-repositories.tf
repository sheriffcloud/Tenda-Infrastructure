resource "aws_ecr_repository" "server" {
  name                 = "${var.project_name}-${var.environment}-server"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-server"
    Environment = var.environment
    Project     = var.project_name
  }
}


resource "aws_ecr_repository" "admin" {
  name                 = "${var.project_name}-${var.environment}-admin"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-admin"
    Environment = var.environment
    Project     = var.project_name
  }
}