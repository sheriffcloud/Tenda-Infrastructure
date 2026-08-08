output "zone_id" {
  description = "Route 53 hosted zone ID (used by ACM validation and ALB records)"
  value       = aws_route53_zone.main.zone_id
}

output "name_servers" {
  description = "The 4 AWS nameservers — set these at Namecheap"
  value       = aws_route53_zone.main.name_servers
}

output "domain_name" {
  description = "The root domain"
  value       = var.domain_name
}