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

variable "domain_name" {
  description = "Domain name for the hosted zone"
  type        = string
}

variable "zone_id" {
  description = "Route 53 hosted zone ID (from dns module)"
  type        = string
}