resource "aws_secretsmanager_secret" "chain_secrets" {
  name        = "${var.project_name}-${var.environment}-chain-secrets"
  description = "Sensitive chain RPC URLs, webhook secrets, gas seed key"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "chain_secrets" {
  secret_id     = aws_secretsmanager_secret.chain_secrets.id
  secret_string = jsonencode(var.chain_secrets)
}