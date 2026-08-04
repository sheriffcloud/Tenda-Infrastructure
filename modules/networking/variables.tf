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

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  #   default     = "10.0.0.0/16"
}

variable "az_count" {
  description = "Number of Availability Zones to use"
  type        = number
  # default = 2  
}

variable "server_port" {
  description = "Container port for the tenda-server API"
  type        = number
  #   default     = 3000
}

variable "admin_port" {
  description = "Container port for the admin Next.js app"
  type        = number
  #   default = 3100
}