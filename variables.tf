variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "eu-west-2"
}

variable "environment" {
  description = "Environment name (production, staging)"
  type        = string
  default     = "production"
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
  default     = "tenda"
}

# ── VPC Variables ─────────────────────────────────────────────────────────────
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "az_count" {
  description = "Number of Availability Zones to use"
  type        = number
  default     = 2
}

variable "server_port" {
  description = "Container port for the tenda-server API"
  type        = number
  default     = 3000
}

variable "admin_port" {
  description = "Container port for the admin Next.js app"
  type        = number
  default     = 3100
}


# ── Database Variables ─────────────────────────────────────────────────────────────

variable "db_instance_class" {
  description = "DB instance class"
  type        = string
  default     = "db.t4g.micro"

}

variable "db_allocated_storage" {
  description = "DB allocated storage"
  type        = number
  default     = 20
}

variable "multi_az" {
  description = "Run a standby in a second AZ for HA"
  type        = bool
  default     = true
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "tenda"
}

variable "db_username" {
  description = "Master username"
  type        = string
  default     = "tenda_admin"
}


# ── Elasticache Variables ─────────────────────────────────────────────────────────────

variable "node_type" {
  description = "Elasticache node type"
  type        = string
  default     = "cache.t4g.micro"
}

variable "redis_multi_az" {
  description = "Run a standby in a second AZ for HA"
  type        = bool
  default     = true
}
