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

# ---- Inputs to ASSEMBLE connection strings (from data-tier modules) ----
variable "db_username" {
  description = "Master username"
  type        = string
}

variable "db_password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "db_address" {
  description = "Database address"
  type        = string
}

variable "db_port" {
  description = "Database port"
  type        = number
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "redis_address" {
  description = "Redis address"
  type        = string
}

variable "redis_port" {
  description = "Redis port"
  type        = number
}

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