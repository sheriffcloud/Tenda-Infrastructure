output "certificate_arn" {
  description = "ARN of the validated certificate (for the ALB HTTPS listener)"
  value       = aws_acm_certificate_validation.main.certificate_arn
}