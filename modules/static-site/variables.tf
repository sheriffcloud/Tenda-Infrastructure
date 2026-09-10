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

variable "zone_id" {
  description = "Route53 zone ID"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the hosted zone"
  type        = string
}