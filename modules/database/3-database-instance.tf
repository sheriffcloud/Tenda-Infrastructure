resource "aws_db_instance" "main" {
  identifier     = "${var.project_name}-${var.environment}-db-instance"
  engine         = "postgres"
  engine_version = "16.14"

  instance_class        = var.db_instance_class
  allocated_storage     = var.db_allocated_storage
  max_allocated_storage = 100
  storage_type          = "gp3"
  storage_encrypted     = true


  db_name  = var.db_name
  username = var.db_username
  password = random_password.db.result


  db_subnet_group_name   = aws_db_subnet_group.main.name
  parameter_group_name   = aws_db_parameter_group.main.name
  vpc_security_group_ids = [var.rds_security_group_id]


  multi_az = true

  backup_retention_period = 7
  backup_window           = "02:00-03:00"
  maintenance_window      = "Sun:03:30-Sun:04:30"


  skip_final_snapshot       = false
  final_snapshot_identifier = "${var.project_name}-${var.environment}-db-final-snapshot"
  deletion_protection       = false

  tags = {
    Name        = "${var.project_name}-${var.environment}-db-instance"
    Environment = var.environment
  }
}