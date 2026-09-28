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

variable "subdomain" {
  type        = string
  description = "Subdomain for docs, e.g. docs"
  #   default     = "docs"
}

variable "zone_id" {
  type        = string
  description = "Route 53 hosted zone ID"
}

variable "certificate_arn" {
  type        = string
  description = "us-east-1 wildcard cert ARN (from static-site module)"
}