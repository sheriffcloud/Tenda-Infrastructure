output "server_repository_url" {
  description = "ECR URL for the server image (used to tag/push and by ECS)"
  value       = aws_ecr_repository.server.repository_url
}

output "admin_repository_url" {
  description = "ECR URL for the admin image"
  value       = aws_ecr_repository.admin.repository_url
}
