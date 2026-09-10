output "deploy_role_arn" {
  description = "IAM role ARN GitHub Actions assumes via OIDC — set as a GitHub repo variable"
  value       = aws_iam_role.github_deploy.arn
}

output "infra_deploy_role_arn" {
  description = "IAM role ARN for the infra pipeline (Tenda-Infrastructure repo)"
  value       = aws_iam_role.infra_deploy.arn
}