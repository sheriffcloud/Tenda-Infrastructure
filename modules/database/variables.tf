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

variable "rds_security_group_id" {
  description = "Security group controlling access to RDS (from networking)"
  type        = string
}

variable "db_instance_class" {
  description = "DB instance class"
  type        = string
  #   default     = "db.t4g.micro"

}

variable "db_allocated_storage" {
  description = "DB allocated storage"
  type        = number
  #   default     = 20
}

variable "multi_az" {
  description = "Run a standby in a second AZ for HA"
  type        = bool
  #   default     = true
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  #   default     = "tenda"
}

variable "db_username" {
  description = "Master username"
  type        = string
  #   default     = "tenda_admin"
}

