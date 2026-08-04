output "db_endpoint" {
  description = "RDS Database endpoint"
  value       = aws_db_instance.main.endpoint
}

output "db_address" {
  description = "RDS Database address"
  value       = aws_db_instance.main.address
}

output "db_port" {
  description = "RDS Database port"
  value       = aws_db_instance.main.port
}

output "db_name" {
  description = "RDS Database name"
  value       = aws_db_instance.main.db_name
}

output "db_username" {
  description = "RDS Database username"
  value       = aws_db_instance.main.username
}

output "db_password" {
  description = "Master password (generated)"
  value       = random_password.db.result
  sensitive   = true
}