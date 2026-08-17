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


# ── Secret Variables ─────────────────────────────────────────────────────────────

# ---- GROUP 1: app-secrets (external service credentials) ----
variable "app_secrets" {
  description = "Sensitive external-service credentials"
  type = object({
    JWT_SECRET                 = string
    CLOUDINARY_API_KEY         = string
    CLOUDINARY_API_SECRET      = string
    TERMII_API_KEY             = string
    OPENROUTER_API_KEY         = string
    RESEND_API_KEY             = string
    SENTRY_DSN                 = string
    GOOGLE_OAUTH_CLIENT_SECRET = string
  })
  sensitive = true
}

# ---- GROUP 2: chain-secrets (RPC URLs with keys, webhook secrets, gas key) ----
variable "chain_secrets" {
  description = "Sensitive chain values across Solana devnet, Base Sepolia, CELO Alfajores"
  type        = map(string)
  sensitive   = true
}


# ── DNS Variables ─────────────────────────────────────────────────────────────
variable "domain_name" {
  description = "Domain name for the hosted zone"
  type        = string
  default     = "netforgetech.online"
}


# ── ECS Variables ─────────────────────────────────────────────────────────────
variable "server_cpu" {
  description = "CPU units for the server task"
  type        = number
  default     = 512 # 0.5 vCPU
}
variable "server_memory" {
  description = "Memory (MB) for the server task"
  type        = number
  default     = 1024 # 1 GB
}
# Non-secret config (Bucket B) - passed as a map
variable "server_environment" {
  type        = map(string)
  description = "Non-secret env vars (public addresses, config)"
}
