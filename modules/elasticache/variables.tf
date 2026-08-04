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

variable "database_subnet_ids" {
  description = "Subnet IDs where RDS may live (from networking module)"
  type        = list(string)
}

variable "redis_security_group_id" {
  description = "Security group controlling access to Redis (from networking)"
  type        = string
}

variable "node_type" {
  description = "Cache node type"
  type        = string
  #   default     = "cache.t4g.micro"
}

variable "redis_multi_az" {
  description = "Run a standby in a second AZ for HA"
  type        = bool
  #   default     = true
}
