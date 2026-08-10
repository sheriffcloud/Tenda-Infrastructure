variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  #   default     = "eu-west-2"
}

variable "environment" {
  description = "Environment name (production, staging)"
  type        = string
  #   default     = "production"
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
  #   default     = "tenda"
}

variable "vpc_id" {
  description = "VPC ID where the ALB will be deployed"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "certificate_arn" {
  description = "Certificate ARN for the ALB"
  type        = string
}

variable "zone_id" {
  description = "Route 53 hosted zone ID for the domain"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the ALB"
  type        = string
}

variable "server_port" {
  description = "Container port for the tenda-server API"
  type        = number
  #   default     = 3000
}

variable "admin_port" {
  description = "Container port for the admin Next.js app"
  type        = number
  #   default     = 3100
}

