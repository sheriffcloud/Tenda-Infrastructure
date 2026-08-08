output "connection_strings_arn" {
  description = "ARN of the connection-strings secret"
  value       = aws_secretsmanager_secret.connection_strings.arn
}

output "app_secrets_arn" {
  description = "ARN of the app-secrets secret"
  value       = aws_secretsmanager_secret.app_secrets.arn
}

output "chain_secrets_arn" {
  description = "ARN of the chain-secrets secret"
  value       = aws_secretsmanager_secret.chain_secrets.arn
}

output "secret_arns" {
  description = "All secret ARNs (for the ECS execution role IAM policy)"
  value = [
    aws_secretsmanager_secret.connection_strings.arn,
    aws_secretsmanager_secret.app_secrets.arn,
    aws_secretsmanager_secret.chain_secrets.arn,
  ]
}