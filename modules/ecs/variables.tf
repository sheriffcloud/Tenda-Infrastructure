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

# From networking module
variable "private_subnet_ids" {
  description = "IDs of the private subnets (ECS tasks live here)"
  type        = list(string)
}

variable "ecs_server_security_group_id" {
  description = "Security group for tenda-server tasks (also used by migrate task)"
  type        = string
}

variable "ecs_admin_security_group_id" {
  description = "Security group for tenda-admin tasks"
  type = string
}

# From IAM module
variable "execution_role_arn" {
  description = "ARN of the execution role for ECS tasks"
  type        = string
}

variable "task_role_arn" {
  description = "ARN of the task role for ECS tasks"
  type        = string
}

# From ALB module
variable "server_target_group_arn" {
  description = "Target group ARN for ECS server service to register into"
  type        = string
}

variable "admin_target_group_arn" {
  description = "Target group ARN for ECS admin service to register into"
  type = string
}

# From secrets module
variable "connection_strings_arn" {
  description = "ARN of the secret containing the database connection string"
  type        = string
}

variable "app_secrets_arn" {
  description = "ARN of the secret containing the app secrets"
  type        = string
}

variable "chain_secrets_arn" {
  description = "ARN of the secret containing the chain secrets"
  type        = string
}


# Sizing
variable "server_cpu" {
  description = "CPU units for the server task"
  type        = number
  #   default = 512   # 0.5 vCPU
}
variable "server_memory" {
  description = "Memory (MB) for the server task"
  type        = number
  #   default = 1024  # 1 GB
}
variable "server_port" {
  description = "Port for the server task"
  type        = number
  #   default = 3000
}

variable "admin_port" {
  description = "Port for the admin task"
  type        = number
  #   default = 3001
}

# Non-secret config (Bucket B) - passed as a map
variable "server_environment" {
  type        = map(string)
  description = "Non-secret env vars (public addresses, config)"
}

# From ECR module
variable "server_repository_url" {
  type        = string
  description = "ECR repo URL (without tag) for building image references"
}

variable "admin_repository_url" {
  type        = string
  description = "ECR repo URL (without tag) for building image references"
}