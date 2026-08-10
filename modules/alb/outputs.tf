output "alb_dns_name" {
  description = "The ALB's AWS DNS name"
  value       = aws_lb.main.dns_name
}

output "server_target_group_arn" {
  description = "Target group ARN for ECS server service to register into"
  value       = aws_lb_target_group.server.arn
}

output "admin_target_group_arn" {
  description = "Target group ARN for ECS admin service to register into"
  value       = aws_lb_target_group.admin.arn
}

output "api_url" {
  description = "Public API URL"
  value       = "https://api.${var.domain_name}"
}